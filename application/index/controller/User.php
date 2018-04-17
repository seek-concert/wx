<?php
namespace app\index\controller;
use app\system\model\Consumers;
use think\Db;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 10:22
 */
class User extends Base{

    /*用户中心*/
    public function user_center(){
        $consumer_id=1;
        if(!$consumer_id){
            return $this->error('错误操作');
        }
        $consumer_id=2;
        $data=Consumers::get($consumer_id);
        return view('',['data'=>$data]);
    }

    /*分销中心*/
    public function distribution_center(){

        $consumer_id=1;
        if(!$consumer_id){
            return $this->error('错误操作');
        }
        $subQuery = Db::table('card')
            ->where('superior_id',$consumer_id)
            ->field('consumer_id,sum(total) as consume_total')
            ->group('consumer_id')
            ->buildSql();

        $list=Db::table('consumer')
            ->alias('a')
            ->join([$subQuery=>'b'],'a.id=b.consumer_id','LEFT')
            ->where('pid',$consumer_id)
            ->select();

        return view('',['list'=>$list]);
    }

}