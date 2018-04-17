<?php
namespace app\index\controller;
use app\system\model\Cards;
use app\system\model\Franchisees;
use app\system\model\Consumers;
use app\system\model\Consumes;
use app\index\service\TimeService;
use think\Db;
use think\Request;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 14:02
 */

class Franchiser extends Base{
    protected $table='';
    protected $franchisee_id;
    protected $franchisee;

    public function __construct(Request $request = null)
    {
        parent::__construct($request);
        $this->franchisee_id=2;
        $franchiser=Franchisees::get( $this->franchisee_id);
        if(empty($franchiser))              $this->error('暂未成为代理商!');
        if(!$franchiser->is_authorized)     $this->error('该代理商暂未授权!');
    }

    /*加盟商列表*/
    public function franchiser_info(){
        $list=db('consume')
            ->where('franchisee_id',$this->franchisee_id)
            ->select();
        $today=TimeService::today();
        $this_week=TimeService::week();
        $this_month=TimeService::month();
        $sum=[0,0,0];
        foreach ($list as $k=>$v){
            if(time()>=$today[0]  && time()<=$today[1]){
                $sum[0]+=$v['amount'];
            }
            if(time()>=$this_week[0] && time()<$this_week[1]){
                $sum[1]+=$v['amount'];
            }
            if(time()>=$this_month[0]  && time()<=$this_month[1]){
                $sum[2]+=$v['amount'];
            }
        }

        return view('',['sum'=>$sum]);
    }

    /*代理商支付页面*/
    public function payment(){
//        $consumer=Consumers::get(['openid'=>session('consumer.openid')]);
//        $franchiser=Franchisees::get($consumer->franchisee_id);

        $key=input('key');
        $key=123;
        if(is_null($key))       $this->error('卡券信息无效!');
        $card=Cards::get(['key'=>$key]);
        if(empty($card))        $this->error('暂无卡券信息!');

        if($this->request->isPost()){
            Db::startTrans();
            try{
                /*添加消费信息*/
                $consume=new Consumes();
                $consume->amount=input('payment');
                $consume->card_id=$card->id;
                $consume->franchisee_id=$this->franchisee_id;
                $consume->consumer_id=$card->consumer_id;
                $consume->isUpdate(false)->save();

                /*更新卡券信息*/
                $card->remaining-=input('payment');
                $card->consumed+=input('payment');
                $card->save();

                /*更新用户信息*/
                $consumer=Consumers::get($card->consumer_id);
                $consumer->remaining-=input('payment');
                $consumer->consumed+=input('payment');

                Db::commit();
            }catch (\Exception $e) {
                Db::rollback();
                $this->error('操作失败！');
            }
            $this->success('操作成功！','payment');
        }
        return view('',['card'=>$card,'franchiser'=>$this->franchisee]);
    }
}