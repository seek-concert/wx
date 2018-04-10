<?php
/* |------------------------------------------------------
 * | 提现
 * |------------------------------------------------------
 * | 审核用户提现
 * | 提现打款
 * */
namespace app\system\controller;

use app\system\model\Withdraws;
use think\Db;

class Withdraw extends  Auth{

    protected $table='withdraw';

    /* ========== 初始化 ========== */
    public function _initialize()
    {
        parent::_initialize();

    }

    /* ========== 列表 ========== */
    public function index(){
        $where=[];
        /*状态*/
        $status=input('status');
        if(is_numeric($status))  {
            $where['withdraw.status']=$status;
            $datas['status']=$status;
        }

        /* ++++++++++ 用户名 ++++++++++ */
        $username=trim(input('user_name'));
        if($username){
            $where['bank_card.user_name']=['like','%'.$username.'%'];
            $datas['user_name']=$username;
        }

        /* ++++++++++ 每页条数 ++++++++++ */
        $nums=[config('paginate.list_rows'),30,50,100,200,500];
        sort($nums);
        $datas['nums']=$nums;
        $display_num=input('display_num');
        $display_num=$display_num?$display_num:config('paginate.list_rows');
        $datas['display_num']=$display_num;

        $list=Db::view('withdraw','id,amount,status,apply_time,info')
        ->view('bank_card','card_number,user_name','withdraw.bank_id=bank_card.id')
        ->where($where)
        ->paginate($display_num);

        $this->assign('list',$list);
        $this->assign($datas);
        return view();
    }

    /*审核*/
    public function review(){
        $ids=input('post.ids/a');
        if(empty($ids))      return $this->error('至少选择一项');
        $status=Db::table($this->table)->where('id','in',$ids)->column('status');
        if(in_array('1',$status)  || in_array('2',$status)) {
            return $this->error('存在已审核或已提现项');
        }
        $result=Db::table($this->table)->where('id','in',$ids)->update(['status'=>1]);
        if($result){
            return $this->success('操作成功','');
        }else{
            return $this->error('操作失败');
        }
    }

    /*提现处理*/
    public function handle(){
        $ids=input('post.ids/a');
        if(empty($ids))      return $this->error('至少选择一项');
        $status=Db::table($this->table)->where('id','in',$ids)->column('status');
        if(in_array('0',$status)  || in_array('2',$status)) {
            return $this->error('存在已提现或暂未审核项');
        }
        $result=Db::table($this->table)->where('id','in',$ids)->update(['status'=>2]);
        if($result){
            return $this->success('操作成功','');
        }else{
            return $this->error('操作失败');
        }
    }

    /* ========== 删除 ========== */
    public function delete(){
        $inputs=input();
        $ids=isset($inputs['ids'])?$inputs['ids']:'';

        if(empty($ids)){
            return $this->error('至少选择一项');
        }
        $res=Withdraws::destroy($ids);
        if($res){
            return $this->success('删除成功','');
        }else{
            return $this->error('删除失败');
        }
    }
}