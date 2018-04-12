<?php
/* |------------------------------------------------------
 * | 消费列表 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;
use think\Model;
use traits\model\SoftDelete;
class Consumes extends  Model{
    use SoftDelete;
    protected $table='consume';
    protected $pk='id';
    protected $createTime='created_at';
    protected $updateTime='updated_at';
    protected $deleteTime='deleted_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;

    /*关联卡券*/
    public function card(){
        return $this->belongsTo('card');
    }

    /*关联消费者*/
    public function consumer(){
        return $this->belongsTo('Consumers','consumer_id');
    }

    /*关联加盟商*/
    public function franchisee(){
        return $this->belongsTo('Franchisees','franchisee_id');
    }

}