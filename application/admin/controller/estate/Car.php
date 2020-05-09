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

class Car extends Base{
	//进车管理
	public function index(){
        return $this->fetch('index',[
	        
        ]);
    }
    //进车管理数据列表
    public function listJson(){
        $param = $this->request->get();
        $where = [];

        if(empty($param['limit'])){
            $param['limit'] = 10;
        }
        
        if(!empty($param['car_name'])){
            $where[] =[ 'c.car_name|c.car_no|c.car_username|e.enter_name','like','%'.$param['car_name'].'%' ];
        }
        
        if(!empty($param['car_start_time'])){
            $where[] =[ 'c.car_start_time','>=',strtotime($param['car_start_time'].' 00:00:00')];
        }
        
        if(!empty($param['car_end_time'])){
            $where[] =[ 'c.car_end_time','<=',strtotime($param['car_end_time'].' 23:59:59')];
        }
        
        $data = Db::name('user_car')->alias('c')
        	->field(['c.*','e.enter_name'])
        	->join('enterprise e','e.id = c.enter_id','LEFT')
        	->where($where)->order('id desc')->paginate($param['limit']);
        $total = $data->total();
        $items = $data->items();
        foreach ($items as $k=>$i){
        	switch ($i['car_type']) {
        		case 1:
        			$items[$k]['car_no'] = '<span style="background:#0092DC;color:#fff;padding:5px;border-radius:5px;font-size:12px">'.$i['car_no'].'</span>';
        			break;
        			
        		case 2:
        			$items[$k]['car_no'] = '<span style="background:yellow;color:#000;padding:5px;border-radius:5px;font-size:12px">'.$i['car_no'].'</span>';
        			break;
        			
        		case 3:
        			$items[$k]['car_no'] = '<span style="background:green;color:#fff;padding:5px;border-radius:5px;font-size:12px">'.$i['car_no'].'</span>';
        			break;
        	}
        	if(!empty($i['car_pic'])){
	        	$urlList = json_decode($i['car_pic'],true);
	        	$img_str = '<img style="cursor: pointer" lay-event="open_image" src="'.$urlList[0].'">';
	        	$items[$k]['car_pic'] = $img_str;
        	}else{
        		$items[$k]['car_pic'] = '';
        	}
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
			$post['car_start_time'] = strtotime($post['car_start_time']);
			$post['car_end_time'] = strtotime($post['car_end_time']);
			if(isset($post['car_pic']) && !empty($post['car_pic'])){
				$post['car_pic'] = json_encode($post['car_pic']);
			}else{
				$post['car_pic'] = '';
			}
			if(isset($post['car_parking']) && !empty($post['car_parking'])){
				$post['car_parking'] = strtoupper($post['car_parking']);
			}
			$res = Db::name('user_car')->where(['car_no' => ['=',$post['car_no']]])->field('id')->find();
            if($res){
                $this->error("车牌号重复！");
            }
            if(Db::name('user_car')->insert($post)){
	            UserLog::addLog([
                    'uid'=>session('userid'),
                    'name'=>'添加车辆: '.$post['car_name'].'(车牌号：'.$post['car_no'].')',
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
			$post['car_start_time'] = strtotime($post['car_start_time']);
			$post['car_end_time'] = strtotime($post['car_end_time']);
			if(isset($post['car_pic']) && !empty($post['car_pic'])){
				$post['car_pic'] = json_encode($post['car_pic']);
			}else{
				$post['car_pic'] = '';
			}
			if(isset($post['car_parking']) && !empty($post['car_parking'])){
				$post['car_parking'] = strtoupper($post['car_parking']);
			}
			Db::name('user_car')->update($post);
            UserLog::addLog([
                'uid'=>session('userid'),
                'name'=>'编辑车辆: '.$post['car_name'].'(车牌号：'.$post['car_no'].')',
                'url' => $this->request->path(),
                'ip' =>$this->request->ip(),
            ]);
            $this->success('success');
		}
		$get = request()->get();
		$enter = Db::name('enterprise')->where(['enter_status'=>1])->order('id desc')->select();
		$field = Db::name('user_car')->where(['id'=>$get['id']])->find();
		$field['car_start_time'] = date('Y-m-d',$field['car_start_time']);
		$field['car_end_time'] = date('Y-m-d',$field['car_end_time']);
		if(isset($field['car_pic']) && !empty($field['car_pic'])){
			$field['car_pic'] = json_decode($field['car_pic'],true);
		}else{
			$field['car_pic'] = '';
		}
		return $this->fetch('edit',[
	        'enter' => $enter,
	        'field'=>$field
        ]);
	}
	
	//查看
	public function show(){
		$get = request()->get();
		$enter = Db::name('enterprise')->where(['enter_status'=>1])->order('id desc')->select();
		$field = Db::name('user_car')->where(['id'=>$get['id']])->find();
		$field['car_start_time'] = date('Y-m-d',$field['car_start_time']);
		$field['car_end_time'] = date('Y-m-d',$field['car_end_time']);
		if(isset($field['car_pic']) && !empty($field['car_pic'])){
			$field['car_pic'] = json_decode($field['car_pic'],true);
		}else{
			$field['car_pic'] = '';
		}
		if(isset($post['car_parking']) && !empty($post['car_parking'])){
			$post['car_parking'] = strtoupper($post['car_parking']);
		}
		return $this->fetch('show',[
	        'enter' => $enter,
	        'field'=>$field
        ]);
	}
	
	//删除
    public function del($id){
       $Project = Db::name('user_car')->where('id',$id)->delete();
        UserLog::addLog([
            'uid'=>session('userid'),
            'name'=>'删除车辆（ID：'.$id."）",
            'url' => $this->request->path(),
            'ip' =>$this->request->ip(),
        ]);
        $this->success('success');
    }
}