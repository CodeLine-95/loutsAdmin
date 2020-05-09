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

class Tools extends Base{
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
        
        if(!empty($param['tools_name'])){
            $where[] =[ 't.unique_id|t.tools_name|e.enter_name','like','%'.$param['tools_name'].'%' ];
        }
        
        if(!empty($param['start_time'])){
            $where[] =[ 't.start_time','>=',strtotime($param['start_time'].' 00:00:00')];
        }
        
        if(!empty($param['end_time'])){
            $where[] =[ 't.end_time','<=',strtotime($param['end_time'].' 23:59:59')];
        }
        
        $data = Db::name('tools')->alias('t')
        	->field(['t.*','e.enter_name'])
        	->join('enterprise e','e.id = t.enter_id','LEFT')
        	->where($where)->order('t.id desc')->paginate($param['limit']);
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
			$post['unique_id'] = strtoupper(lotus_random_string(10));
			//根据初始数据拿到单价
			$default = Db::name('tools_default')->where(['id'=>$post['default_id']])->find();
			//应收费用
			$previous_period = $post['previous_period'];  //上期
			$current_period = $post['current_period'];  //本期
			//电表数用量
			$d = $current_period[0]-$previous_period[0];
			//水表数用量
			$s = $current_period[1]-$previous_period[1];
			//气表数用量
			$q = $current_period[2]-$previous_period[2];
			
			//用量
			$dosage[0] = $d;
			$dosage[1] = $s;
			$dosage[2] = $q;
			$post['dosage'] = json_encode($dosage);
			
			if($post['cycle'] == 5 || $post['cycle'] == 4 || $post['cycle'] == 3){
				//租赁面积
				$enter = Db::name('enterprise')->where(['id'=>$post['enter_id']])->find();
				//天数
				switch ($post['cycle']) {
					case 3:
						// 4个月
						$start_time = strtotime(date("Y-m-d"));
						$end_time = strtotime(date("Y-m-d",strtotime("+3 month")));
						$day = $default['month_num'];
						break;
					case 4:
						//12个月
						$start_time = strtotime(date("Y-m-d"));
						$end_time = strtotime(date("Y-m-d",strtotime("+12 month")));
						$day = $default['month_num']*3;
						break;
					case 5:
						//1天
						$start_time = strtotime($post['start_time']);
						$end_time = strtotime($post['end_time']);
						$day = floor(($end_time-$start_time)/86400);
						break;
				}
				
				//冷气费
				$post['air_fee'] = $day * $enter['enter_acreage'] * $default['air_fee'];
				//暖气费
				$post['heating_fee'] = $day * $enter['enter_acreage'] * $default['heating_fee'];
				//物业费
				$post['property_fee'] = $day * $enter['enter_acreage'] * $default['property_fee'];
			}else{
				switch($post['cycle']){
					case 0:
						$start_time = strtotime(date("Y-m-d"));
						$end_time = strtotime(date("Y-m-d",strtotime("+1 day")));
						break;
					case 1:
						$start_time = strtotime(date("Y-m-d"));
						$end_time = strtotime(date("Y-m-d",strtotime("+7 day")));
						break;
					case 2:
						$start_time = strtotime(date("Y-m-d"));
						$end_time = strtotime(date("Y-m-d",strtotime("+1 month")));
						break;
				}
				$post['air_fee'] = 0;
				$post['heating_fee'] = 0;
				$post['property_fee'] = 0;
			}
			
			//计算
			$d_price = $d*$default['electricity_fee'];
			$s_price = $s*$default['water_rate'];
			$q_price = $q*$default['gas_bill'];
			
			$post['current_totalPrice'] = $d_price + $s_price + $q_price + $post['extra_price'];
			
			$post['previous_period'] = json_encode($post['previous_period']);
			$post['current_period'] = json_encode($post['current_period']);
			$post['start_time'] = $start_time;
			$post['end_time'] = $end_time;
			$post['mumber_id'] = session('userid');
			
			$post['create_time'] = time();
			if(Db::name('tools')->insert($post)){
				UserLog::addLog([
                    'uid'=> session('userid'),
                    'name'=>'添加工具: '.$post['tools_name'].'(标识：'.$post['unique_id'].')',
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
			}else{
				$this->error('添加失败');
			}
		}
		
		$tools_default = Db::name('tools_default')->order('id desc')->select();
		$enterprise = Db::name('enterprise')->order('id desc')->select();
		return $this->fetch('add',[
	        'tools_default' => $tools_default,
	        'enterprise' => $enterprise
        ]);
	}
	
	//编辑
	public function edit(){
		if(request()->isPost()){
			$post = request()->post();
			// $post['unique_id'] = strtoupper(lotus_random_string(10));
			$field = Db::name('tools')->where(['id'=>$post['id']])->find();
			//根据初始数据拿到单价
			$default = Db::name('tools_default')->where(['id'=>$post['default_id']])->find();
			//应收费用
			$previous_period = $post['previous_period'];  //上期
			$current_period = $post['current_period'];  //本期
			//电表数用量
			$d = $current_period[0]-$previous_period[0];
			//水表数用量
			$s = $current_period[1]-$previous_period[1];
			//气表数用量
			$q = $current_period[2]-$previous_period[2];
			
			//用量
			$dosage[0] = $d;
			$dosage[1] = $s;
			$dosage[2] = $q;
			$post['dosage'] = json_encode($dosage);
			
			if($post['cycle'] == 5 || $post['cycle'] == 4 || $post['cycle'] == 3){
				//租赁面积
				$enter = Db::name('enterprise')->where(['id'=>$post['enter_id']])->find();
				//天数
				switch ($post['cycle']) {
					case 3:
						// 4个月
						$start_time = $field['start_time'];
						$end_time = strtotime(date("Y-m-d",strtotime("+3 month")));
						$day = $default['month_num'];
						break;
					case 4:
						//12个月
						$start_time = $field['start_time'];
						$end_time = strtotime(date("Y-m-d",strtotime("+12 month")));
						$day = $default['month_num']*3;
						break;
					case 5:
						//1天
						$start_time = strtotime($post['start_time']);
						$end_time = strtotime($post['end_time']);
						$day = floor(($end_time-$start_time)/86400);
						break;
				}
				
				//冷气费
				$post['air_fee'] = $day * $enter['enter_acreage'] * $default['air_fee'];
				//暖气费
				$post['heating_fee'] = $day * $enter['enter_acreage'] * $default['heating_fee'];
				//物业费
				$post['property_fee'] = $day * $enter['enter_acreage'] * $default['property_fee'];
			}else{
				switch($post['cycle']){
					case 0:
						$start_time = $field['start_time'];
						$end_time = strtotime(date("Y-m-d",strtotime("+1 day")));
						break;
					case 1:
						$start_time = $field['start_time'];
						$end_time = strtotime(date("Y-m-d",strtotime("+7 day")));
						break;
					case 2:
						$start_time = $field['start_time'];
						$end_time = strtotime(date("Y-m-d",strtotime("+1 month")));
						break;
				}
				$post['air_fee'] = 0;
				$post['heating_fee'] = 0;
				$post['property_fee'] = 0;
			}
			
			//计算
			$d_price = $d*$default['electricity_fee'];
			$s_price = $s*$default['water_rate'];
			$q_price = $q*$default['gas_bill'];
			
			$post['current_totalPrice'] = $d_price + $s_price + $q_price + $post['extra_price'];
			
			$post['previous_period'] = json_encode($post['previous_period']);
			$post['current_period'] = json_encode($post['current_period']);
			
			$post['start_time'] = $start_time;
			$post['end_time'] = $end_time;
			
			// $post['mumber_id'] = session('userid');
			
			$post['update_time'] = time();
			
			if(Db::name('tools')->update($post)){
				UserLog::addLog([
                    'uid'=> session('userid'),
                    'name'=>'编辑工具: '.$post['tools_name'].'(标识：'.$field['unique_id'].')',
                    'url' => $this->request->path(),
                    'ip' =>$this->request->ip(),
                ]);
                $this->success('success');
			}else{
				$this->error('编辑失败');
			}
		}
		$get = request()->get();
		$tools_default = Db::name('tools_default')->order('id desc')->select();
		$enterprise = Db::name('enterprise')->order('id desc')->select();
		$field = Db::name('tools')->where(['id'=>$get['id']])->find();
		$field['previous_period'] = json_decode($field['previous_period'],true);
		$field['current_period'] = json_decode($field['current_period'],true);
		$field['start_time'] = date('Y-m-d',$field['start_time']);
		$field['end_time'] = date('Y-m-d',$field['end_time']);
		return $this->fetch('edit',[
	        'tools_default' => $tools_default,
	        'enterprise' => $enterprise,
	        'field' => $field
        ]);
	}
	
	//删除
    public function del($id){
       $Project = Db::name('tools')->where('id',$id)->delete();
        UserLog::addLog([
            'uid'=>session('userid'),
            'name'=>'删除物业工具（ID：'.$id."）",
            'url' => $this->request->path(),
            'ip' =>$this->request->ip(),
        ]);
        $this->success('success');
    }
}