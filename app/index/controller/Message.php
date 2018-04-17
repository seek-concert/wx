<?php
namespace app\index\controller;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 9:31
 */
class Message extends Base{

    /*消息中心*/
    public function message_center(){
        return view();
    }

    /*消息详细内容*/
    public function messages_info(){
        return view();
    }
}