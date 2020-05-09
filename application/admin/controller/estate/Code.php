<?php
namespace app\admin\controller\estate;
// +----------------------------------------------------------------------
// | LotusAdmin
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://www.lotusadmin.top/ All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: wenhainan <qq 610176732>
// +----------------------------------------------------------------------
use think\Controller;
use app\admin\controller\Base;
use app\admin\model\UserLog;
use org\Auth;
use think\Db;
use service\QrcodeServer;
use app\api\controller\QrCode;

class Code extends Base{
	public function index(){
		return $this->fetch('index',[
	        
        ]);
	}
	
	public function listJson(){
        $param = $this->request->get();
        $where = [];

        if(empty($param['limit'])){
            $param['limit'] = 10;
        }
        
        if(!empty($param['code_name'])){
            $where[] =[ 'code_name|unique_id','like','%'.$param['code_name'].'%' ];
        }
        
        $data = Db::name('plan_code')->where($where)->order('id desc')->paginate($param['limit']);
        $this->genTableJson($data);
    }
    
    //添加
	public function add(){
		if(request()->isPost()){
			$post = request()->post();
			$res = Db::name('plan_code')->where(['unique_id' => ['=',$post['unique_id']]])->field('id')->find();
            if($res){
                $this->error("标识唯一！");
            }
            $config = [
	            'title'         => false,
	            'logo'          => false,
	        ];
            $QrCodeArr = json_decode(QrCode::codeEncode($config,['unique_id'=>$post['unique_id'],'generate'=>'writefile']),true);
            if($QrCodeArr['code'] == 0 && $QrCodeArr['msg'] == 'ok'){
            	if($QrCodeArr['data']){
            		$post['code_url'] = $QrCodeArr['data']['url'];
            		$post['code_pic'] = '/'.$QrCodeArr['data']['pic_url'];
            	}
            }else{
            	$this->error('生成二维码失败，请稍后重试');
            }
            if(Db::name('plan_code')->insert($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'添加二维码: '.$post['code_name'].'(标识：'.$post['unique_id'].')',
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('添加失败');
            }
		}
		return $this->fetch('add',[
        ]);
	}
	
	//编辑
	public function edit(){
		if(request()->isPost()){
			$post = request()->post();
			if($post['unique_id'] != $post['unique_id_old']){
        		$res = Db::name('plan_code')->where(['unique_id' => ['=',$post['unique_id']]])->field('id')->find();
	            if($res){
	            	$this->error('该标识已存在，请更改后再试');
	            }
        	}
        	unset($post['unique_id_old']);
            $config = [
	            'title'         => false,
	            'logo'          => false,
	        ];
            $QrCodeArr = json_decode(QrCode::codeEncode($config,['unique_id'=>$post['unique_id'],'generate'=>'writefile']),true);
            if($QrCodeArr['code'] == 0 && $QrCodeArr['msg'] == 'ok'){
            	if($QrCodeArr['data']){
            		$post['code_url'] = $QrCodeArr['data']['url'];
            		$post['code_pic'] = '/'.$QrCodeArr['data']['pic_url'];
            	}
            }else{
            	$this->error('生成二维码失败，请稍后重试');
            }
            if(Db::name('plan_code')->update($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'编辑二维码: '.$post['code_name'].'(标识：'.$post['unique_id'].')',
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('添加失败');
            }
		}
		$get = request()->get();
		$field = Db::name('plan_code')->where(['id'=>$get['id']])->find();
		return $this->fetch('edit',[
			'field' =>$field
        ]);
	}
	
	//删除
    public function del($id){
       $plan_code = Db::name('plan_code')->where('id',$id)->delete();
        UserLog::addLog([
            'uid'=>session('userid'),
            'name'=>'删除二维码（ID：'.$id."）",
            'url' => $this->request->path(),
            'ip' =>$this->request->ip(),
        ]);
        $this->success('success');
    }
}