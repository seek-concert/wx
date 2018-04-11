<?php
/* |------------------------------------------------------
 * | 卡券 控制器
 * |------------------------------------------------------
 * */
namespace app\system\controller;

use app\system\model\Cards;
use think\Db;
class Card extends Auth{

    /* ========== 初始化 ========== */
    public function _initialize()
    {
        parent::_initialize();

    }

    /* ========== 列表 ========== */
    public function index()
    {
        /* ********** 查询条件 ********** */
        $datas=[];
        $where=[];

        /* ++++++++++ 用户名 ++++++++++ */
        $user_name=trim(input('user_name'));
        if($user_name){
            $where['c1.user_name']=['like','%'.$user_name.'%'];
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

        $list=Db::table('card c')
            ->join('consumer c1','c1.id=c.consumer_id','left' )
            ->join('consumer c2','c.rebate_consumer_id=c2.id','left')
            ->field('c.*,c1.avatar,c1.avatar,c2.user_name as rebate_user')
            ->where($where)
            ->order([$ordername=>$orderby])
            ->paginate($display_num);

        $datas['list']=$list;
        $this->assign($datas);
        return view();
    }

}