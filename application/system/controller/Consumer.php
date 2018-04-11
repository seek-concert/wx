<?php
/* |------------------------------------------------------
 * | 用户 控制器
 * |------------------------------------------------------
 * */
namespace app\system\controller;

use app\system\model\Consumers;
use app\system\model\Cards;
use think\Db;

class Consumer extends Auth{
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
            $where['consumer.user_name']=['like','%'.$user_name.'%'];
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

        $model=new Consumers();

        $consumers=$model
            ->where($where)
            ->order([$ordername=>$orderby])
            ->paginate($display_num);

        $datas['consumers']=$consumers;
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
        $res=Consumers::destroy($ids);
        if($res){
            return $this->success('删除成功','');
        }else{
            return $this->error('删除失败');
        }
    }

    /* ========== 详情 ========== */
    public function detail($id=null){
        if(!$id){
            return $this->error('至少选择一项');
        }

        $infos=Consumers::withTrashed()->find($id);
        if(!$infos){
            return $this->error('选择用户不存在');
        }

        return view('modify',[
            'infos'=>$infos
        ]);
    }

    /* ========== 修改 ========== */
    public function edit(){
        $id=input('id');
        if(!$id){
            return $this->error('错误操作');
        }

        $rules=[
            'user_name'=>'require',
            'total'=>'number',
            'left'=>'number',
            'cashed'=>'number'
        ];
        $msg=[
            'user_name.require'=>'请输入用户名',
            'total.number'=>'返利总额只能为数字',
            'left.number'=>'待提现总额只能为数字',
            'cashed.number'=>'返利总额只能为数字'
        ];

        $result=$this->validate(input(),$rules,$msg);
        if(true !== $result){
            return $this->error($result);
        }

        if(input('total')!=input('left')+input('cashed')){
            return $this->error('请检查金额是否正确!');
        }
        $model=new Consumers();

        $model->isUpdate(true)->save(input());
        if($model !== false){
            return $this->success('修改成功','');
        }else{
            return $this->error('修改失败');
        }
    }

    /* ========== 下级分销 ========== */
    public function distribution(){
        $id=input('id');
        if(!$id){
            return $this->error('错误操作');
        }
        $subQuery = Db::table('card')
            ->where('rebate_consumer_id',$id)
            ->field('sum(superior_amount) as total_rebate,consumer_id,sum(total) as total')
            ->group('consumer_id')
            ->buildSql();

        $list=Db::table('consumer')
            ->alias('a')
            ->join([$subQuery=>'b'],'a.id=b.consumer_id','LEFT')
            ->where('pid',$id)
            ->paginate(10);

        $datas['list']=$list;
        $this->assign($datas);
        return view();
    }


}
