<?php
/* |------------------------------------------------------
 * | 卡券 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;
use think\Model;
class Cards extends  Model{
    protected $table='card';
    protected $pk='id';
    protected $createTime='created_at';
    protected $updateTime='updated_at';
    protected $deleteTime='deleted_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;

}