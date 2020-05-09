<?php
namespace app\api\controller;
use think\Controller;
class Repair extends Controller{
	public function listJson(){
        $param = $this->request->get();
        $where = [];

        if(empty($param['limit'])){
            $param['limit'] = 10;
        }
        
        $data = Db::name('repair')->alias('p')
        	->field(['p.*','m.member_name as repair_user_name','t.fullname as repair_audit_name'])
        	->join('member m','m.id = p.repair_user_id','LEFT')
        	->join('user_ext t','t.userid = p.repair_audit_id','LEFT')
        	->order('p.id desc')->paginate($param['limit']);
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
		
		return $this->fetch('add',[
	        'member' => $member
        ]);
	}
}