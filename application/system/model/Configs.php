<?php
/* |------------------------------------------------------
 * | 系统配置 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;

use think\Model;
use traits\model\SoftDelete;

class Configs extends Model
{
    use SoftDelete;
    protected $table='config';
    protected $pk='id';
    protected $createTime='create_at';
    protected $updateTime='update_at';
    protected $deleteTime='delete_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;
    protected $type = [

    ];
}