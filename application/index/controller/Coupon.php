<?php
namespace app\index\controller;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 10:18
 */
class Coupon extends Base{
    public function coupon_center(){
        $list=array();
        empty($list)?$view='card_volume':$view='coupon_center';
        $view='coupon_center';
        return view($view);
    }

    public function coupon_info(){
        return view();
    }
}