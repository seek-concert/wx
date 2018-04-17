<?php
/* |------------------------------------------------------
 * | 加盟商 控制器
 * |------------------------------------------------------
 * */
namespace app\system\controller;
use app\system\model\Franchisees;
use app\system\model\Consumes;
use think\Db;

class Franchisee extends  Auth{

    /* ========== 初始化 ========== */
    public function _initialize()
    {
        parent::_initialize();

    }

    /*列表页*/
    public function index(){

        /* ********** 查询条件 ********** */
        $datas=[];
        $where=[];

        /* ++++++++++ 姓名 ++++++++++ */
        $name=trim(input('name'));
        if($name){
            $where['name']=['like','%'.$name.'%'];
            $datas['name']=$name;
        }

        /* ++++++++++ 授权状态 ++++++++++ */
        $is_authorized=input('is_authorized');
        if(is_numeric($is_authorized) && in_array($is_authorized,[0,1])){
            $where['is_authorized']=$is_authorized;
            $datas['is_authorized']=$is_authorized;
        }

        /*标签*/
        $mark=input('mark');
        if(is_numeric($mark) && in_array($mark,[0,1])){
            $where['mark']=$mark;
            $datas['mark']=$mark;
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

        $model=new Franchisees();

        $list=$model
            ->where($where)
            ->order([$ordername=>$orderby])
            ->paginate($display_num);

        $datas['list']=$list;

        $this->assign($datas);

        return view();
    }


    /* ========== 添加 ========== */
    public function add($id=0){
        $model=new Franchisees();
        if(request()->isPost()){
            $rules=[
                'name'=>'require|length:4,255|unique:franchisee',
                'tel'=>'require',
                'img'=>'require',
                'address'=>'require|length:4,255'
            ];
            $msg=[
                'name.require'=>'请输入公司名称',
                'name.length'=>'公司名称不能少于4位',
                'name.unique'=>'公司名称已存在',
                'tel.require'=>'联系方式不能为空',
                'img.require'=>'公司图片不能为空',
                'address.require'=>'地址不能为空',
                'address.length'=>'地址不能少于4位'
            ];

            $result=$this->validate(input(),$rules,$msg);
            if(true !== $result){
                return $this->error($result);
            }
            $model->save(input());
            if($model !== false){
                return $this->success('保存成功','');
            }else{
                return $this->error('保存失败');
            }
        }else{
            return view('modify');
        }
    }

    /* ========== 授权 ========== */
    public function authorize(){
        $inputs=input();
        $ids=isset($inputs['ids'])?$inputs['ids']:'';
        $is_authorized=$inputs['is_authorized'];

        if(empty($ids)){
            return $this->error('至少选择一项');
        }
        if(!in_array($is_authorized,[0,1])){
            return $this->error('错误操作');
        }
        $res=model('Franchisees')->save(['is_authorized'=>$is_authorized],['id'=>['in',$ids]]);
        if($res){
            return $this->success('操作成功','');
        }else{
            return $this->error('修改失败');
        }
    }

    /* ========== 详情 ========== */
    public function detail($id=null){
        if(!$id){
            return $this->error('至少选择一项');
        }
        $model=new Franchisees();
        $infos=Franchisees::find($id);
        if(!$infos){
            return $this->error('选择加盟商不存在');
        }
        return view('modify',['infos'=>$infos]);
    }

    /* ========== 修改 ========== */
    public function edit(){
        $id=input('id');
        if(!$id){
            return $this->error('错误操作');
        }
        $rules=[
            'name'=>'require|length:4,255|unique:franchisee,name,'.$id.',id',
            'tel'=>'require',
            'img'=>'require',
            'address'=>'require|length:4,255'
        ];
        $msg=[
            'name.require'=>'请输入公司名称',
            'name.length'=>'名称不能少于4位',
            'name.unique'=>'公司名称已存在',
            'tel.require'=>'联系方式不能为空',
            'img.require'=>'公司图片不能为空',
            'address.require'=>'地址不能为空',
            'address.length'=>'地址不能少于4位'
        ];
        $result=$this->validate(input(),$rules,$msg);
        if(true !== $result){
            return $this->error($result);
        }
        $model=new Franchisees();
        $model->isUpdate(true)->save(input());
        if($model !== false){
            return $this->success('修改成功','');
        }else{
            return $this->error('修改失败');
        }
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

    /*销售情况*/
    public function consume(){
        $id=input('id');
        if(!$id){
            return $this->error('错误操作');
        }

        $model=new Consumes();
        $where['franchisee_id']=$id;
        $model->where('franchisee_id',$id);

        if(input('date')){
            $arr=explode(' - ',input('date'));
            $model->whereBetween('created_at',[strtotime($arr[0]),strtotime($arr[1])]);
        }

        $list=$model
            ->order('created_at','desc')
            ->paginate(10,false,['query'=>request()->param()]);

        $datas['list']=$list;
        $this->assign($datas);
        return view();
    }
}