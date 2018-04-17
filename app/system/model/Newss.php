<?php
/* |------------------------------------------------------
 * | 新闻管理 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;
use think\Model;

class Newss extends Model
{
    protected $table='news';
    protected $pk='id';
    protected $createTime='create_at';
    protected $updateTime='update_at';
    protected $deleteTime='delete_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;
    protected $type = [

    ];
}