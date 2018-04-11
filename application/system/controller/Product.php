<?php
/* |------------------------------------------------------
 * | 产品管理
 * |------------------------------------------------------
 * | 首页
 * | 列表
 * | 添加
 * | 修改
 * | 删除
 * */
namespace app\system\controller;


use app\system\model\Products;

class Product extends Auth
{
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

        $products=Products::where($where)->order([$ordername=>$orderby])->paginate($display_num);

        $datas['product']=$products;

        $this->assign($datas);

        return view();
    }

    /* ========== 添加 ========== */
    public function add(){
        $model=new Products();
        if(request()->isPost()){
            $datas=input();
            $rules=[
                'title'=>'require'
            ];
            $msg=[
                'title.require'=>'产品名称不能为空',
            ];
            $result=$this->validate($datas,$rules,$msg);
            if(true !== $result){
                return $this->error($result);
            }

            $model->save($datas);
            if($model !== false){
                return $this->success('保存成功','');
            }else{
                return $this->error('保存失败');
            }
        }else{
            return view('modify');
        }
    }

    /* ========== 修改 ========== */
    public function edit(){
        $id=input('id');
        if(!$id){
            return $this->error('至少选择一项','');
        }
        $model=new Products();
        if(request()->isPost()){
            $datas=input();
            $rules=[
                'title'=>'require'
            ];
            $msg=[
                'title.require'=>'产品名称不能为空',
            ];

            $result=$this->validate($datas,$rules,$msg);
            if(true !== $result){
                return $this->error($result);
            }

            $model->isUpdate(true)->save($datas);
            if($model !== false){
                return $this->success('修改成功','');
            }else{
                return $this->error('修改失败');
            }
        }else{
            $infos=Products::find($id);
            if(!$infos){
                return $this->error('数据不存在');
            }

            return view('modify',[
                'infos'=>$infos,
                'model'=>$model
            ]);
        }

    }

    /* ========== 删除 ========== */
    public function del(){
        $inputs=input();
        $ids=isset($inputs['ids'])?$inputs['ids']:'';

        if(empty($ids)){
            return $this->error('至少选择一项');
        }
        $res=Products::whereIn('id',$ids)->delete(true);
        if($res){
            return $this->success('删除成功','');
        }else{
            return $this->error('删除失败！');
        }
    }
}