<?php
namespace app\index\controller;
use app\system\model\Consumers;
use app\system\model\Cards;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 10:28
 */
class Cash extends Base{
    public function cash_back(){
        $consumer_id=1;
        $withdraw=Consumers::get($consumer_id);
        return view('',['data'=>$withdraw]);
    }

    public function cash_record(){
        $consumer_id=1;
        $cashed=Consumers::get($consumer_id)->cashed;

        $card=new Cards();
        $rebate=$card
            ->where('superior_id',$consumer_id)
            ->whereOr('consumer_id',$consumer_id)
            ->order('created_at','desc')
            ->select();
        return view('',['list'=>$rebate,'cashed'=>$cashed,'consumer_id'=>$consumer_id]);
    }

    public function instructions(){
        return view();
    }

    public function rebate(){
        return view('');
    }
}