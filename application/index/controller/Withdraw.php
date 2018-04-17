<?php
namespace app\index\controller;
use app\system\model\Consumers;
use app\system\model\BankCards;
use app\system\model\Withdraws;
use think\Db;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 10:28
 */
class Withdraw extends Base{

    public function withdraw(){

        $consumer_id=1;
        if($this->request->isPost()){
            Db::startTrans();
            try{
                /*银行卡信息*/
                $bank_card=new BankCards();
                $data=[
                    'consumer_id'=>$consumer_id,
                    'card_number'=>input('card_number'),
                    'user_name'=>input('user_name'),
                    'phone'=>input('phone')];
                if(is_numeric(input('id'))){
                    $bank_card->save($data,['id'=>input('id')]);
                }else{
                    $bank_card->save($data);
                }

                if(empty($bank_card)){
                    exception('系统繁忙，请稍后重试!', 100006);
                }

                /*提现信息*/
                $withdraw=new Withdraws();
                $withdraw->bank_id=$bank_card->id;
                $withdraw->consumer_id=$consumer_id;
                $withdraw->amount=input('amount');
                $withdraw->apply_time=time();
                $withdraw->isUpdate(false)->save();
                if(empty($bank_card)){
                    exception('操作失败!', 100006);
                }
                Db::commit();
            }catch (\Exception $e) {
                Db::rollback();
                $this->error($e->getMessage());
            }
            $this->success('提现申请成功!');
        }
        $bank_card=BankCards::get(['consumer_id'=>$consumer_id]);
        $left=Consumers::get($consumer_id)->left;
        return view('',['left'=>$left,'bank_card'=>$bank_card]);
    }
}