<?php
namespace app\index\controller;
use app\system\model\Consumers;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 9:31
 */
class Index extends Base{
    public function index(){
        if(input('key')){
            $superior=Consumers::get(['key'=>input('key')]);
            $consumer=Consumers::get(session('consumer.id'));
            $consumer->pid=$superior->id;
            $consumer->save();
        }
        $franchisers=db('franchisee')->order('id')->limit(3)->select();
        return view('',['franchisers'=>$franchisers]);
    }

    public function test(){
        echo phpinfo();
        $page=db('config')->value('company');
        return view('',['page'=>$page]);
    }
}