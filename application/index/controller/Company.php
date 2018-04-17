<?php
namespace app\index\controller;
use app\system\model\Configs;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 10:28
 */
class Company extends Base{
    public function company_info(){
        $model=new Configs();
        $data=$model->find();
        return view('',['data'=>$data]);
    }
}