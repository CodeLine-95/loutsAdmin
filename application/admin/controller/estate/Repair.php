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

class Repair extends Base{
	public function index(){
		$member = DB::name('member')->where(['member_status'=>1])->order('id desc')->select();
		$enter = DB::name('enterprise')->where(['enter_status'=>1])->order('id desc')->select();
		return $this->fetch('index',[
	        'member' => $member,
	        'enter' => $enter
        ]);
	}
	
	public function listJson(){
        $param = $this->request->get();
        $where = [];

        if(empty($param['limit'])){
            $param['limit'] = 10;
        }
        
        if(!empty($param['repair_name'])){
            $where[] =[ 'm.member_name|p.repair_tel|d.member_name','like','%'.$param['repair_name'].'%' ];
        }
        
        if(!empty($param['enter_id'])){
            $where[] = ['p.enter_id','=',$param['enter_id']];
        }
        
        if(!empty($param['repair_create_time'])){
            $where[] =[ 'p.repair_create_time','>=',strtotime($param['repair_create_time'].' 00:00:00')];
            $where[] =[ 'p.repair_create_time','<=',strtotime($param['repair_create_time'].' 23:59:59')];
        }
        
        if(!empty($param['repair_audit_time'])){
        	$where[] =[ 'p.repair_audit_time','>=',strtotime($param['repair_audit_time'].' 00:00:00')];
            $where[] =[ 'p.repair_audit_time','<=',strtotime($param['repair_audit_time'].' 23:59:59')];
        }
        
        $data = Db::name('repair')->alias('p')
        	->field(['p.*','m.member_name as repair_user_name','t.fullname as repair_audit_name','e.enter_name','d.member_name as maintainer'])
        	->join('member m','m.id = p.repair_user_id','LEFT')
        	->join('member d','d.id = p.maintainer','LEFT')
        	->join('user_ext t','t.userid = p.repair_audit_id','LEFT')
        	->join('enterprise e','e.id = p.enter_id','LEFT')
        	->where($where)->order('p.id desc')->paginate($param['limit']);
		$total = $data->total();
        $items = $data->items();
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
			$post['repair_create_time'] = time();
			$post['repair_order_id'] = 'BX'.date('Ymd').rand(1000,9999);
            if(Db::name('repair')->insert($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'添加报修单: '.$post['repair_order_id'],
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('添加失败');
            }
		}
		
		$member = DB::name('member')->where(['member_status'=>1])->order('id desc')->select();
		$enter = DB::name('enterprise')->where(['enter_status'=>1])->order('id desc')->select();
		return $this->fetch('add',[
	        'member' => $member,
	        'enter' => $enter
        ]);
	}
	
	//编辑
	public function edit(){
		if(request()->isPost()){
			$post = request()->post();
			$post['repair_update_time'] = time();
            if(Db::name('repair')->update($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'编辑报修单: '.$post['repair_order_id'],
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('编辑失败');
            }
		}
		$get = request()->get();
		$member = DB::name('member')->where(['member_status'=>1])->order('id desc')->select();
		$enter = DB::name('enterprise')->where(['enter_status'=>1])->order('id desc')->select();
		$field = Db::name('repair')->where(['id'=>$get['id']])->find();
		return $this->fetch('edit',[
	        'member' => $member,
	        'enter' => $enter,
	        'field' =>$field
        ]);
	}
	
	//审批
	public function audit(){
		if(request()->isPost()){
			$post = request()->post();
			$post['repair_audit_id'] = session('userid');
			$post['repair_audit_time'] = time();
            if(Db::name('repair')->update($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'审批报修单: '.$post['repair_order_id'],
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('审批失败');
            }
		}
		$get = request()->get();
		$field = Db::name('repair')->where(['id'=>$get['id']])->find();
		if($field['maintainer']){
			$member = DB::name('member')->where(['member_status'=>1])
			->where('id not in ('.$field['maintainer'].')')
			->order('id desc')->select();
		}else{
			$member = DB::name('member')->where(['member_status'=>1])
			->order('id desc')->select();
		}
		return $this->fetch('audit',[
	        'field' =>$field,
	        'member' =>$member
        ]);

	}
	
	//删除
    public function del($id){
       $Project = Db::name('repair')->where('id',$id)->delete();
        UserLog::addLog([
            'uid'=>session('userid'),
            'name'=>'删除保修单（ID：'.$id."）",
            'url' => $this->request->path(),
            'ip' =>$this->request->ip(),
        ]);
        $this->success('success');
    }
}