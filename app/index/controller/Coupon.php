<?php
namespace app\index\controller;
use app\system\model\Cards;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 10:18
 */
class Coupon extends Base{
    public function coupon_center(){
        $consumer_id=2;
        $list=Cards::all(['consumer_id'=>$consumer_id]);

        empty($list)?$view='card_volume':$view='coupon_center';
        return view($view,['list'=>$list]);
    }

    public function coupon_info(){
        $id=input('id');
        if(!$id){
            $this->error('错误请求!');
        }
        $data=Cards::get($id);


        return view('',['data'=>$data]);
    }
}