<?php
/* |------------------------------------------------------
 * | 消费者 模型
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
        return $this->hasMany('Cards','consumer_id');
    }

    /*关联分销上级*/
    public function superior(){
        return $this->belongsTo('Consumers','pid');
    }

    /*关联分销下级*/
    public function junior(){
        return $this->hasMany('Consumers','pid');
    }

    /*关联银行卡*/
    public function bank(){
        return $this->hasMany('BankCards','consumer_id');
    }

    /*关联消费信息*/
    public function consume(){
        return $this->hasMany('Consumes','consumer_id');
    }

    /*关联提现*/
    public function withdraw(){
        return $this->hasMany('Withdraw','consumer_id');
    }

    /*关联加盟商*/
    public function franchisee(){
        return $this->belongsTo('Franchisees','franchisee_id');
    }
}