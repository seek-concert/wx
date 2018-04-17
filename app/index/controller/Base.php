<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use wechat\WechatOauth;
use app\system\model\Consumers;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 9:32
 */
class Base extends Controller{
    public function _initialize(){
//        $wechatOauth=new WechatOauth();
//        $user_info=$wechatOauth->getUserInfo();
//        $consumer=Consumers::get(['openid'=>$user_info['openid']]);
//        if(empty($consumer)){
//            $consumer=new Consumers();
//            $consumer->isUpdate(false)->save($user_info);
//        }
//        session('consumer',$consumer);
    }

}