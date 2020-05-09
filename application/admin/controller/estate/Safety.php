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

class Safety extends Base{
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
            $where[] =[ 'c.code_name|p.patrol_name|m.member_name|r.tel','like','%'.$param['tools_name'].'%' ];
        }
        
        $data = Db::name('patrol_record')->alias('r')
        	->field(['r.*','m.member_name','p.patrol_name','c.code_name'])
        	->join('member m','m.id = r.user_id','LEFT')
        	->join('plan_patrol p','p.id = r.patrol_id','LEFT')
        	->join('plan_code c','c.id = r.code_id','LEFT')
        	->where($where)->order('r.id desc')->paginate($param['limit']);
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
}