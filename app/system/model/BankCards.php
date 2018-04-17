<?php
/* |------------------------------------------------------
 * | 银行卡 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;
use think\Model;
use traits\model\SoftDelete;
class  BankCards extends Model{
    use SoftDelete;
    protected $table='bank_card';
    protected $pk='id';
    protected $createTime='created_at';
    protected $updateTime='updated_at';
    protected $deleteTime='deleted_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;

    /*关联到消费者*/
    public function consumer(){
        return $this->belongsTo('Consumers');
    }
}