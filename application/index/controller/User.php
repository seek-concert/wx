<?php
namespace app\index\controller;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 10:22
 */
class User extends Base{

    /*用户中心*/
    public function user_center(){
        return view();
    }

    /*分销中心*/
    public function distribution_center(){
        return view();
    }

}