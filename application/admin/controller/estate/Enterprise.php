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
use app\admin\model\estate\Enterprise as EnterpriseModel;

class Enterprise extends Base{
	//企业列表
    public function index(){
        return $this->fetch('index',[
	        
        ]);
    }
    //企业列表数据
    public function listJson(){
        $param = $this->request->get();
        $where = [];

        if(empty($param['limit'])){
            $param['limit'] = 10;
        }
        
        if(!empty($param['enter_name'])){
            $where[] =[ 'enter_name','like','%'.$param['enter_name'].'%' ];
        }
        
        $data = (new EnterpriseModel())->where($where)->order('id desc')->paginate($param['limit']);
        $this->genTableJson($data);
        
    }
	
	//添加企业
	public function add(){
		if(request()->isPost()){
			$post = request()->post();
			$post['enter_time'] = strtotime($post['enter_time']);
			$post['enter_leave'] = strtotime($post['enter_leave']);
			$res = (new EnterpriseModel())->where(['enter_name'  => ['=',$post['enter_name']]])->field('id')->find();
            if($res){
                $this->error("企业名称重复！");
            }
            if((new EnterpriseModel())->allowField(true)->save($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'添加企业名称: '.$post['enter_name'],
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('添加失败');
            }
		}
		$member = DB::name('member')->order('id desc')->select();
		return $this->fetch('add',[
	        'member' => $member
        ]);
	}
	//编辑企业
	public function edit(){
		if(request()->isPost()){
			$post = request()->post();
			if(!$post['id']>0){
                $this->error("提交了非法数据");
            }
			$post['enter_time'] = strtotime($post['enter_time']);
			$post['enter_leave'] = strtotime($post['enter_leave']);
            if((new EnterpriseModel())->allowField(true)->update($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'修改企业名称: '.$post['enter_name'],
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('编辑失败');
            }
		}
		$get = request()->get();
		$field = (new EnterpriseModel)->where(['id'=>$get['id']])->find();
		$member = DB::name('member')->order('id desc')->select();
		return $this->fetch('edit',[
	        'field'=>$field,
	        'member' => $member
        ]);
	}
	
	//修改状态
	public function editStatus(){
		if(request()->isPost()){
			$post = request()->post();
			if(!$post['id']>0){
                $this->error("提交了非法数据");
            }
            if((new EnterpriseModel())->allowField(true)->update($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'修改企业状态:（ID： '.$post['id'].'）',
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('修改失败');
            }
		}else{
			$this->error('非法请求');
		}
	}
	
	//企业删除
    public function del($id){
        $Project = Project::destroy($id);
        UserLog::addLog([
            'uid'=>session('userid'),
            'name'=>'删除企业名称（ID：'.$id."）",
            'url' => $this->request->path(),
            'ip' =>$this->request->ip(),
        ]);
        $this->success('success');
    }
}
