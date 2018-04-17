<?php
namespace app\index\controller;
use app\system\model\Consumes;
use think\Request;
use app\system\model\Consumers;
use app\system\model\Cards;
use think\Db;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 10:22
 */
class Product extends Base{
    public function product_info(){
        return view();
    }

    public function buy_product(){
        if($this->request->isPost()){
            Db::startTrans();
            try{
                $consumer_id=2;

                /*判断是否为第一次购买*/
                $count=Cards::where('consumer_id',$consumer_id)->count();
                if($count==0){
                    $rebate=1980*0.1;
                    $superior_amount=1980*0.1+500;
                }else{
                    $rebate=1980*0.2;
                    $superior_amount=1980*0.1;
                }

                /*购买用户信息更新*/
                $consumer=Consumers::get($consumer_id);
                $consumer->payment=1980;
                $consumer->consumed=0;
                $consumer->remaining=1980;
                $consumer->isUpdate(true)->save();

                /*卡券信息更新*/
                $card=new Cards();
                $card->consumer_id=$consumer->id;
                $card->total=1980;
                $card->consumed=0;
                $card->remaining=1980;
                $card->superior_id=$consumer->pid;
                $card->rebate=$rebate;
                $card->superior_amount=$superior_amount;
                $card->key=create_guid();
                $card->number=date('YmdHis').rand(100000,999999);
                $card->isUpdate(false)->save();

                /*分销上级信息更新*/
                $consumer=Consumers::get($card->superior_id);
                $consumer->total+=$card->superior_amount;
                $consumer->left+=$card->superior_amount;
                $consumer->isUpdate(true)->save();

                // 提交事务
                Db::commit();
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                $this->error('购买失败!');
            }

            return $this->success('购买成功!',url('coupon/coupon_center'));




        }
        return view('',['id'=>1]);
    }
}