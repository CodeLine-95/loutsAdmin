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

class Caller extends Base{
	//访客管理
	public function index(){
        return $this->fetch('index',[
	        
        ]);
    }
    
    //访客管理数据列表
    public function listJson(){
        $param = $this->request->get();
        $where = [];

        if(empty($param['limit'])){
            $param['limit'] = 10;
        }
        
        if(!empty($param['caller_name'])){
            $where[] =[ 'c.caller_name|c.caller_cardid|c.caller_work|c.caller_phone|e.enter_name|c.caller_car_no','like','%'.$param['caller_name'].'%' ];
        }
        
        if(!empty($param['caller_on_time'])){
            $where[] =[ 'c.caller_on_time','>=',strtotime($param['caller_on_time'].' 00:00:00')];
        }
        
        if(!empty($param['caller_out_time'])){
            $where[] =[ 'c.caller_out_time','<=',strtotime($param['caller_out_time'].' 23:59:59')];
        }
        
        $data = Db::name('caller')->alias('c')
        	->field(['c.*','e.enter_name'])
        	->join('enterprise e','e.id = c.caller_enter_id','LEFT')
        	->where($where)->order('c.id desc')->paginate($param['limit']);
        $this->genTableJson($data);
    }
    
    //添加
	public function add(){
		if(request()->isPost()){
			$post = request()->post();
			$post['caller_on_time'] = strtotime($post['caller_on_time']);
			$post['caller_out_time'] = strtotime($post['caller_out_time']);
			if(isset($post['caller_parking']) && !empty($post['caller_parking'])){
				$post['caller_parking'] = strtoupper($post['caller_parking']);
			}
			if(isset($post['caller_car_no']) && !empty($post['caller_car_no'])){
				$post['caller_car_no'] = strtoupper($post['caller_car_no']);
			}
			$post['caller_token'] = strtoupper(lotus_random_string(8));
			if(isset($post['is_on_car']) && $post['is_on_car'] == 1 && isset($post['caller_car_no']) && empty($post['caller_car_no'])){
				$this->error('车牌号必填');
			}
            if(Db::name('caller')->insert($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'新增访客: '.$post['caller_name'],
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
            }else{
	            $this->error('添加失败');
            }
		}
		
		$enter = Db::name('enterprise')->where(['enter_status'=>1])->order('id desc')->select();
		return $this->fetch('add',[
	        'enter' => $enter
        ]);
	}
	
	//编辑
	public function edit(){
		if(request()->isPost()){
			$post = request()->post();
			$post['caller_on_time'] = strtotime($post['caller_on_time']);
			$post['caller_out_time'] = strtotime($post['caller_out_time']);
			if(isset($post['caller_parking']) && !empty($post['caller_parking'])){
				$post['caller_parking'] = strtoupper($post['caller_parking']);
			}
			if(isset($post['caller_car_no']) && !empty($post['caller_car_no'])){
				$post['caller_car_no'] = strtoupper($post['caller_car_no']);
			}
			if(isset($post['is_on_car']) && $post['is_on_car'] == 1 && isset($post['caller_car_no']) && empty($post['caller_car_no'])){
				$this->error('车牌号必填');
			}
			Db::name('caller')->update($post);
            UserLog::addLog([
                'uid'=>session('userid'),
                'name'=>'编辑访客: '.$post['caller_name'],
                'url' => $this->request->path(),
                'ip' =>$this->request->ip(),
            ]);
            $this->success('success');
		}
		$get = request()->get();
		$enter = Db::name('enterprise')->where(['enter_status'=>1])->order('id desc')->select();
		$field = Db::name('caller')->where(['id'=>$get['id']])->find();
		$field['caller_on_time'] = date('Y-m-d',$field['caller_on_time']);
		$field['caller_out_time'] = date('Y-m-d',$field['caller_out_time']);
		return $this->fetch('edit',[
	        'enter' => $enter,
	        'field'=>$field
        ]);
	}
	
	//删除
    public function del($id){
       $Project = Db::name('caller')->where('id',$id)->delete();
        UserLog::addLog([
            'uid'=>session('userid'),
            'name'=>'删除访客（ID：'.$id."）",
            'url' => $this->request->path(),
            'ip' =>$this->request->ip(),
        ]);
        $this->success('success');
    }
}