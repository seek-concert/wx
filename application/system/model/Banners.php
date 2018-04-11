<?php
/* |------------------------------------------------------
 * | Banner管理 模型
 * |------------------------------------------------------
 * */
namespace app\system\model;
use think\Model;

class Banners extends Model
{
    protected $table='banner';
    protected $pk='id';
    protected $createTime='create_at';
    protected $updateTime='update_at';
    protected $deleteTime='delete_at';
    protected $autoWriteTimestamp = true;
    protected $field=true;
    protected $type = [

    ];

    public function getTypeAttr($value)
    {
        $type = [1=>'首页轮播图',2=>'首页Banner图'];
        return $type[$value];
    }

}