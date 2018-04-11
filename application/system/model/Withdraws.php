<?php
/* |------------------------------------------------------
 * | 提现 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;

use think\Model;
use traits\model\SoftDelete;

class  Withdraws extends Model{
    use SoftDelete;
    protected $table='withdraw';
    protected $pk='id';
    protected $createTime='created_at';
    protected $updateTime='updated_at';
    protected $deleteTime='deleted_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;

    /*获取状态属性*/
    public function getStatusAttr($key=null){
        $array=[0=>'申请中',1=>'已处理'];
        if(is_numeric($key) && in_array($key,[0,1])){
            return $array[$key];
        }else{
            return $array;
        }
    }

    /*关联到银行卡*/
    public function bank(){
        return $this->belongsTo('BankCards','bank_id');
    }

    /*关联到用户*/
//    public function user(){
//        return $this->hasOne('Consumer')->field('id,user_name');
//    }
}
