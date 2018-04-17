<?php
/* |------------------------------------------------------
 * | 卡券 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;
use think\Model;
use traits\model\SoftDelete;
class Cards extends  Model{
    use SoftDelete;
    protected $table='card';
    protected $pk='id';
    protected $createTime='created_at';
    protected $updateTime='updated_at';
    protected $deleteTime='deleted_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;

    /*关联消费者*/
    public function consumer(){
        return $this->belongsTo('Consumers','consumer_id');
    }

    /*关联上级分销*/
    public function superior(){
        return $this->belongsTo('Consumers','superior_id');
    }

}