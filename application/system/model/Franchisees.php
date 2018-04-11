<?php
/* |------------------------------------------------------
 * | 加盟商 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;

use think\Model;

class Franchisees extends Model{
    protected $table='franchisee';
    protected $pk='id';
    protected $createTime='created_at';
    protected $updateTime='updated_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;

    /*获取授权属性*/
    public function getIsAuthorizedAttr($key=null){
        $array=[0=>'暂未授权',1=>'已授权'];
        if(is_numeric($key) && in_array($key,[0,1])){
            return $array[$key];
        }else{
            return $array;
        }
    }

}