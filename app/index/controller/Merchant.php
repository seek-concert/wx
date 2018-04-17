<?php
namespace app\index\controller;
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/13
 * Time: 9:31
 */
class Merchant extends Base{

    /*加盟商列表*/
    public function merchants_list(){

        $search=input('search');
        $db=db('franchisee');
        if($search){
            $db->where('name','like',"%{$search}%");
        }
        $franchisers=$db->order('id')->select();
        return view('',['franchisers'=>$franchisers,'search'=>$search]);
    }


}