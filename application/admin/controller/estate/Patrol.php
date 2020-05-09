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

class Patrol extends Base{
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
        
        if(!empty($param['patrol_name'])){
            $where[] =[ 'p.patrol_name','like','%'.$param['patrol_name'].'%' ];
        }
        
        if(!empty($param['patrol_start_time'])){
            $where[] =[ 'p.patrol_start_time','>=',strtotime($param['patrol_start_time'].' 00:00:00')];
        }
        
        if(!empty($param['patrol_end_time'])){
            $where[] =[ 'p.patrol_end_time','<=',strtotime($param['patrol_end_time'].' 23:59:59')];
        }
        
        $data = Db::name('plan_patrol')->alias('p')
        	->field(['p.*'])->where($where)->order('p.id desc')->paginate($param['limit']);
		$total = $data->total();
        $items = $data->items();
        foreach($items as $k=>$i){
	        $plan_code = Db::name('plan_code')->field(['GROUP_CONCAT(code_name) as code_name'])->where(' id in ('.$i['code_id'].')')->find();
	        $items[$k]['code_name'] = $plan_code['code_name'];
        }
        $res = [
            'code'=>0,
            'msg'=>'',
            'count'=>$total,
            'data'=>$items
        ];
		return json($res);
    }
    
    //添加
	public function add(){
		if(request()->isPost()){
			$post = request()->post();
			$post['patrol_start_time'] = strtotime($post['patrol_start_time']);
			$post['patrol_end_time'] = strtotime($post['patrol_end_time']);
			if(isset($post['code_id']) && !empty($post['code_id'])){
				$post['code_id'] = implode(',',$post['code_id']);
			}
			$post['create_time'] = time();
			$res = Db::name('plan_patrol')->where(['patrol_name' => ['=',$post['patrol_name']]])->field('id')->find();
            if($res){
                $this->error("计划名称唯一！");
            }
            if(Db::name('plan_patrol')->insert($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'添加计划: '.$post['patrol_name'].'(标识：'.$post['code_id'].')',
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('添加失败');
            }
		}
		
		$code = Db::name('plan_code')->order('id desc')->select();
		return $this->fetch('add',[
	        'code' => $code
        ]);
	}
	
	//编辑
	public function edit(){
		if(request()->isPost()){
			$post = request()->post();
			$post['patrol_start_time'] = strtotime($post['patrol_start_time']);
			$post['patrol_end_time'] = strtotime($post['patrol_end_time']);
			if(isset($post['code_id']) && !empty($post['code_id'])){
				$post['code_id'] = implode(',',$post['code_id']);
			}
			$post['update_time'] = time();
			if($post['patrol_name'] != $post['patrol_name_old']){
        		$res = Db::name('plan_patrol')->where(['patrol_name' => ['=',$post['patrol_name']]])->field('id')->find();
	            if($res){
	            	$this->error('该计划名称已存在，请更改后再试');
	            }
        	}
        	unset($post['patrol_name_old']);
            if(Db::name('plan_patrol')->update($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'编辑计划: '.$post['patrol_name'].'(标识：'.$post['code_id'].')',
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('编辑失败');
            }
		}
		$get = request()->get();
		$code = Db::name('plan_code')->order('id desc')->select();
		$field = Db::name('plan_patrol')->where(['id'=>$get['id']])->find();
		$field['patrol_start_time'] = date('Y-m-d',$field['patrol_start_time']);
		$field['patrol_end_time'] = date('Y-m-d',$field['patrol_end_time']);
		if(isset($field['code_id']) && !empty($field['code_id'])){
			$field['code_id'] = explode(',',$field['code_id']);
		}
		return $this->fetch('edit',[
	        'code' => $code,
	        'field' =>$field
        ]);
	}
	
	//删除
    public function del($id){
       $Project = Db::name('plan_patrol')->where('id',$id)->delete();
        UserLog::addLog([
            'uid'=>session('userid'),
            'name'=>'删除计划（ID：'.$id."）",
            'url' => $this->request->path(),
            'ip' =>$this->request->ip(),
        ]);
        $this->success('success');
    }
}