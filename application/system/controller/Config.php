<?php
/* |------------------------------------------------------
 * | 系统设置 系统配置
 * |------------------------------------------------------
 * | 配置信息
 * | 微信参数
 * | 自动获取微信二维码
 * */
namespace app\system\controller;

use app\system\model\Configs;

class Config extends Auth
{
    /* ========== 配置信息 ========== */
    public function index(){
        $model=new Configs();
        if(request()->isPost()){
            if(input('id')){
                $model->save(input(),['id'=>input('id')]);
            }else{
                $model->save(input());
            }
            if($model !== false){
                $this->assign('notice',"<script>layer.msg('操作成功',function() {});</script>");
            }else{
                $this->assign('notice',"<script>layer.msg('操作失败',function() {});</script>");
            }
        }
        $infos=$model->find();

        $this->assign('infos',$infos);

        return view();
    }

    /* ========== 微信参数 ========== */
    public function wxsetting(){
        $id=input('id');
        if(!$id){
            return $this->error('错误操作');
        }
        $model=new Configs();
        if(request()->isPost()){
            $model->save(input(),['id'=>$id]);
            if($model !== false){
                return $this->success('修改成功','');
            }else{
                return $this->error('修改失败');
            }
        }else{
            $infos=$model->find($id);

            $this->assign('infos',$infos);

            return view();
        }
    }

    /* ========== 自动获取微信二维码 ========== */
    public function wxqrcode(){
        $settings=Configs::field(['wx_appid','wx_appsecret'])->find();
        if($settings && $settings->wx_appid && $settings->wx_appsecret){
            $ticket=cache('qrcode_ticket');
            if(!$ticket){
                $access_token=cache('base_access_token');
                if(!$access_token){
                    $res=https_request('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$settings->wx_appid.'&secret='.$settings->wx_appsecret);
                    $res=json_decode($res,true);
                    if(!isset($res['access_token'])){
                        return $this->error('获取失败','',$res);
                    }
                    cache('base_access_token',$res['access_token'],7000);
                    $access_token=$res['access_token'];
                }
                $data['action_name']='QR_LIMIT_STR_SCENE';
                $data['action_info']['scene']['scene_str']='xiaoshuo';
                $data=json_encode($data);
                $res=https_request('https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token='.$access_token,$data);
                $res=json_decode($res,true);
                if($res['ticket']){
                    cache('qrcode_ticket',$res['ticket']);
                    $ticket=$res['ticket'];
                }
            }

            if($ticket){
                return $this->success('获取成功','https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket='.urlencode($ticket));
            }else{
                return $this->error('获取失败');
            }
        }else{
            return $this->error('获取失败');
        }
    }

}