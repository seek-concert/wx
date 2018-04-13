<?php
/* |------------------------------------------------------
 * | 消费信息 控制器
 * |------------------------------------------------------
 * */
namespace app\system\controller;

use app\system\model\Consumes;
use think\Db;
class Consume extends  Auth{
    /* ========== 初始化 ========== */
    public function _initialize()
    {
        parent::_initialize();

    }

    /* ========== 列表 ========== */
    public function index()
    {
        /* ********** 查询条件 ********** */
        $datas=$where=[];

        /*供应商*/
        $franchisee=input('franchisee');
        if(is_numeric($franchisee)){
            $where['consume.franchisee_id']=$franchisee;
            $datas['franchisee']=$franchisee;
        }
        $franchisee_list=Db::table('franchisee')->field('id,name')->select();
        $datas['franchisee_list']=$franchisee_list;

        /* ++++++++++ 用户名 ++++++++++ */
        $user_name=trim(input('user_name'));
        if($user_name){
            $datas['user_name']=$user_name;
        }



        /* ++++++++++ 排序 ++++++++++ */
        $ordername=input('ordername');
        $ordername=$ordername?$ordername:'id';
        $datas['ordername']=$ordername;
        $orderby=input('orderby');
        $orderby=$orderby?$orderby:'asc';
        $datas['orderby']=$orderby;
        /* ++++++++++ 每页条数 ++++++++++ */
        $nums=[config('paginate.list_rows'),30,50,100,200,500];
        sort($nums);
        $datas['nums']=$nums;
        $display_num=input('display_num');
        $display_num=$display_num?$display_num:config('paginate.list_rows');
        $datas['display_num']=$display_num;

        $list=Consumes::hasWhere('consumer',['user_name'=>['like','%'.$user_name.'%']])
            ->where($where)
            ->order([$ordername=>$orderby])
            ->paginate($display_num);

        $datas['list']=$list;
        $this->assign($datas);
        return view();
    }

    /* ========== 删除 ========== */
    public function delete(){
        $inputs=input();
        $ids=isset($inputs['ids'])?$inputs['ids']:'';

        if(empty($ids)){
            return $this->error('至少选择一项');
        }
        $res=Franchisees::destroy($ids);
        if($res){
            return $this->success('删除成功','');
        }else{
            return $this->error('删除失败');
        }
    }
}