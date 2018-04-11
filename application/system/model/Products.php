<?php
/* |------------------------------------------------------
 * | 产品管理 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;
use think\Model;

class Products extends Model
{
    protected $table='product';
    protected $pk='id';
    protected $createTime='create_at';
    protected $updateTime='update_at';
    protected $deleteTime='delete_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;
    protected $type = [
        'img_url'=>'array'
    ];
}