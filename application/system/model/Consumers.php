<?php
/* |------------------------------------------------------
 * | 消费用户 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;

use think\Model;
use traits\model\SoftDelete;
class Consumers extends  Model{
    use SoftDelete;
    protected $table='consumer';
    protected $pk='id';
    protected $createTime='created_at';
    protected $updateTime='updated_at';
    protected $deleteTime='deleted_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;

    /*关联卡券*/
    public function card()
    {
        return $this->hasMany('Cards');
    }

}