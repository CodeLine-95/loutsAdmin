<?php
namespace app\admin\controller\moduls;
// +----------------------------------------------------------------------
// | ViooMa
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://www.viooma.com/ All rights reserved.
// +----------------------------------------------------------------------
// | Author: viooma <qq 12612019>
// +----------------------------------------------------------------------
use think\Controller;
use app\admin\controller\Base;
use think\Validate;
use service\UtilService as Util;
use service\JsonService;
use service\JsonService as Json;
use service\UploadService as Upload;
use service\FormBuilder as Form;
use think\Db;
use think\Session;
use think\Request;
use traits\CurdControllerTrait;
use app\admin\model\moduls\Cars as CarsModel;
use think\Hook;
use think\Url;
use app\admin\model\UserLog;

class ModulsCars extends Base
{

use CurdControllerTrait;
protected $bindModel = ModulsCars::class;

    public function index()
    {
		$status=$this->request->param('status');
		if($status=='') $status = 1;
		        //空闲中车辆
		        $onrest =  CarsModel::getModelSingle()->where(CarsModel::setData(1))->count();
		        //使用中车辆
		        $onuse =  CarsModel::getModelSingle()->where(CarsModel::setData(2))->count();
		        //维修中车辆
		        $onrepair = CarsModel::getModelSingle()->where(CarsModel::setData(3))->count();
		        //预约中车辆
		        $onappoint =CarsModel::getModelSingle()->where(CarsModel::setData(4))->count();
				//禁用的车辆
				$onstop = CarsModel::getModelSingle()->where(CarsModel::setData(0))->count();
		        $this->assign(compact('status','onrest','onuse','onrepair','onappoint','onstop'));
		return $this->fetch();
    }

    public function listJson()
    {
        $where=Util::getMore([
                    ['page',1],
                    ['limit',25],
                    ['car_name',''],
                    ['excel',0],
                    ['order',''],
                    ['status',$this->request->param('status')]
                ]);
        return JsonService::successlayui(CarsModel::CarList($where));
    }
	/*
	*车辆使用记录
	*/
   public function recordList()
   {
       $where = $this->request->get();
	   //var_dump($where);
       if(empty($where['limit'])){
           $where['limit'] = 20;
       }
       $model=Db::name('cars_record r')->join('cars c','r.carid=c.car_id','LEFT')->join('member m','r.record_people=m.id','LEFT')->field(['r.*','c.car_no,c.car_type,m.member_name'])->order('r.id desc');
        if(isset($where['title'])){
               $model = $model->where('c.car_name|c.car_no','LIKE',"%$where[title]%");
           }
       	if(!empty($where['is_finish']))
       	$model = $model->where('r.record_finish',$where['is_finish']);
       if(!empty($where['start'])){
           $model = $model->where('r.record_time','>=',strtotime($where['start'].' 00:00:00'));
       }
       if(!empty($where['end'])){
           $model = $model->where('r.record_time','<=',strtotime($where['end'].' 23:59:59'));
       }
	   //var_dump($where);
	   $data=$model->paginate($where['limit']);
       $this->genTableJson($data);
   }

    //增加商品
    public function add()
    {
		//$url = New Url($this->app);
        $field = [
                    Form::input('car_name','车辆名称')->col(Form::col(24)),
					Form::input('car_no','车辆牌照')->col(Form::col(24)),
					Form::input('car_sort','排序',0)->col(8),
                    Form::input('car_mileage','车辆里程',0)->col(8),
                    Form::select('car_type','车辆类型')->options([['label'=>'蓝牌车型','value'=>1],['label'=>'黄牌车型','value'=>2],['label'=>'绿牌车型','value'=>3]])->col(8),
                    Form::frameImageOne('image','车辆主图片(305*305px)',Url('admin/widget.images/index',array('fodder'=>'image')))->icon('image')->width('100%')->height('500px'),
                    Form::radio('car_status','状态',1)->options([['label'=>'启用','value'=>1],['label'=>'禁用','value'=>0]])->col(8),
					Form::datepicker('car_buy','购买日期')->col(8),
					Form::datepicker('car_upkeep','保养日期')->col(8)
                ];
                $form = Form::make_post_form('添加车辆',$field,Url('moduls.moduls_cars/save'),2);
                $this->assign(compact('form'));
                return $this->fetch('pub/form-builder');
    }
	/**
	     * 保存新建的资源
	     *
	     * @param  \think\Request  $request
	     * @return \think\Response
	     */
	    public function save(Request $request)
	    {
	        $data = Util::postMore([
	            'car_name',
				'car_no',
	            ['car_type',0],
	            ['image',[]],
	            ['car_mileage',[]],
	            ['car_buy',0],
	            ['car_status',0],
				['car_sort',0],
				['car_upkeep', 0]
	        ],$request);
	        if(!$data['car_name']) return Json::fail('请输入车辆名称');
			if(!$data['car_no']) return Json::fail('请输入车辆牌照');
			if(!$data['car_mileage']) return Json::fail('请输入车辆里程数');
			if(!$data['car_buy']) return Json::fail('请输入车辆购买日期');
			if(!$data['car_upkeep']) return Json::fail('请输入车辆保养日期');
			if(!$data['car_type']) return Json::fail('请选择车辆类型');
	        if(count($data['image'])<1) return Json::fail('请上传车辆图片');
	        
	        $data['image'] = $data['image'][0];
	        $data['car_add_time'] = time();
			$data['car_buy'] = strtotime($data['car_buy']);
	        $res=CarsModel::set($data);
	        return Json::successful('添加车辆成功!');
	    }
/**
     * 设置车辆启用|禁用
     *
     * @return json
     */
    public function set_show($status='',$id=''){
        ($status=='' || $id=='') && JsonService::fail('缺少参数');
        $res=CarsModel::where(['car_id'=>$id])->update(['car_status'=>(int)$status]);
        if($res){
            return JsonService::successful($status==1 ? '启用成功':'禁用成功');
        }else{
            return JsonService::fail($status==1 ? '启用失败':'禁用失败');
        }
    }
	/**
	     * 设置批量产品上架
	     *
	     * @return json
	     */
	    public function product_show(){
	        $post=Util::postMore([
	            ['ids',[]]
	        ]);
	        if(empty($post['ids'])){
	            return JsonService::fail('请选择需要上架的产品');
	        }else{
	            $res=CarsModel::where('id','in',$post['ids'])->update(['status'=>1]);
	            if($res)
	                return JsonService::successful('上架成功');
	            else
	                return JsonService::fail('上架失败');
	        }
	    }
		/**
		     * 快速编辑
		     *
		     * @return json
		     */
		    public function set_product($field='',$id='',$value=''){
		        $field=='' || $id=='' || $value=='' && JsonService::fail('缺少参数');
		        if(CarsModel::where(['id'=>$id])->update([$field=>$value]))
		            return JsonService::successful('保存成功');
		        else
		            return JsonService::fail('保存失败');
		    }
    /**
         * 显示编辑资源表单页.
         *
         * @param  int  $id
         * @return \think\Response
         */
        public function edit($id)
        {
            if(!$id) return $this->failed('数据不存在');
            $cars = CarsModel::where('car_id',$id)->find();
            if(!$cars) return Json::fail('数据不存在!');
            $field = [
                Form::input('car_name','车辆名称',$cars->getData('car_name')),
                Form::input('car_no','车牌号',$cars->getData('car_no')),
				Form::number('car_sort','排序',$cars->getData('car_sort'))->min(0)->col(4),
				Form::input('car_mileage','里程数',$cars->getData('car_mileage'))->col(8),
				Form::select('car_type','车辆类型',$cars->getData('car_type'))->options([['label'=>'蓝牌车型','value'=>1],['label'=>'黄牌车型','value'=>2],['label'=>'绿牌车型','value'=>3]])->col(8),
                Form::frameImageOne('image','车辆图片(305*305px)',Url('admin/widget.images/index',array('fodder'=>'image')),$cars->getData('image'))->icon('image')->width('100%')->height('500px'),
                Form::radio('car_status','车辆状态',$cars->getData('car_status'))->options([['label'=>'启用','value'=>1],['label'=>'禁用','value'=>0]])->col(8),
                Form::datepicker('car_buy','购买日期',date('Y-m-d',$cars->getData('car_buy')))->col(8),
                Form::datepicker('car_upkeep','保养日期',date('Y-m-d',$cars->getData('car_upkeep')))
            ];
            $form = Form::make_post_form('编辑车辆',$field,Url('update',array('car_id'=>$id)),2);
            $this->assign(compact('form'));
            
            return $this->fetch('pub/form-builder');
        }
    /**
         * 保存更新的资源
         *
         * @param  \think\Request  $request
         * @param  int  $id
         * @return \think\Response
         */
        public function update(Request $request, $car_id)
        {
            $data = Util::postMore([
                'car_name',
                'car_no',
				['car_type',0],
                ['image',[]],
                ['car_status',0],
                ['car_buy',0],
                ['car_mileage',0],
				['car_sort',0],
				['car_upkeep', 0]

            ],$request);
            if(!$data['car_name']) return Json::fail('请输入车辆名称');
			if(!$data['car_no']) return Json::fail('请输入车辆牌照号');
			if(!$data['car_type']) return Json::fail('请选择车辆类型');
			if(!$data['car_mileage']) return Json::fail('请输入车辆里程数');
            if(count($data['image'])<1) return Json::fail('请上传车辆图片');
            $data['image'] = $data['image'][0];
			$data['car_buy'] = strtotime($data['car_buy']);
			$data['car_upkeep'] = strtotime($data['car_upkeep']);
            CarsModel::where('car_id',$car_id)->update($data);
            
            return Json::successful('修改成功!');
        }
	/**
	     * 删除指定资源
	     *
	     * @param  int  $id
	     * @return \think\Response
	     */
	    public function delete($id)
	    {
	        if(!$id) return Json::failed('数据不存在');
	        if(!CarsModel::be(['id'=>$id])) return Json::failed('产品数据不存在');
	        if(CarsModel::where(['id'=>$id,'status'=>4])->count()){
	            $data['status'] = 1;
	            if(!CarsModel::where('id',$id)->update($data))
	                return Json::fail('恢复失败,请稍候再试!');
	            else
	                return Json::successful('成功恢复产品!');
	        }else{
	            $data['status'] = 4;
	            if(!CarsModel::where('id',$id)->update($data))
	                return Json::fail('删除失败,请稍候再试!');//CarsModel::getErrorInfo(
	            else
	                return Json::successful('成功移到回收站!');
	        }
	
	    }
	
		/*
		*车辆出行操作
		*@param $id
		*/
		public function use(){
			$request = $this->request;
			if($request->isAjax()){
			    $post     = $request->post();
				$car_id = $post['car_id'];
				switch($post['method']){
					case "use"://用车
					$data['is_use'] = 1;
					$msg = "派车用车成功";
					break;
					case "repair"://维修
					$data['is_repair'] = 1;
					$msg = "车辆送修成功";
					break;
					case "appointment"://预约
					$data['is_appointment'] = 1;
					$msg = "车辆预约成功";
					break;
				}
			    CarsModel::where('car_id',$car_id)->update($data);
			    Db::name('cars_record')->insert([
					'carid' => $car_id,
					'record_reason' => $post['record_reason'],
					'record_time' => strtotime($post['record_time']),
					'record_user' => session('userid'),
					'record_people' => $post['record_people']
				]); 
			        UserLog::addLog([
			            'uid'=> session('userid'),
			            'name'=> $msg,
			            'url' => $this->request->path(),
			            'ip' =>$this->request->ip(),
			        ]);
			        $this->success($msg);
			}else{
				$get = $request->get();
				$id = $get['id'];
				$method = $get['method'];
		        if(!$id) return $this->error('数据不存在');
				$using = Db::name('cars_record')->where(['carid'=>$id,'record_finish'=>0])->find();
				if($using) return $this->error('车辆存在未完成记录');
		        $cars = CarsModel::where('car_id',$id)->find();
				$members = Db::name('member')->where('member_status',1)->select();
		        if(!$cars) return $this->error('数据不存在!');
		        $this->assign([
		            'cars'=>$cars,
					'members'=>$members,
					'method'=>$method
		        ]);
		        return $this->fetch();
				}
		    }
		/*
		*车辆取回操作
		*/	
		public function back(){
			$request = $this->request;
			if($request->isAjax()){
			    $post     = $request->post();
				$car_id = $post['car_id'];
				$id = $post['id'];
				switch($post['method']){
					case "use"://用车收回
					$data['is_use'] = 0;
					$msg = "派车用车收回成功";
					break;
					case "repair"://维修收回
					$data['is_repair'] = 0;
					$msg = "车辆送修取回成功";
					break;
					case "appointment"://预约收回
					$data['is_appointment'] = 0;
					$msg = "车辆预约取回成功";
					break;
				}
				$data['car_mileage'] = $post['record_mileage'];
				if(empty($post['record_end_time']))
				$endtime = time();
				else
				$endtime = strtotime($post['record_end_time']);
			    Db::name('cars_record')->where('id',$id)->update([
					'record_end_time' => $endtime,
					'record_type' => 1,//$post['record_type'],
					'record_money' => 0,//$post['record_money'],
					'record_mileage' => $post['record_mileage'],
					'record_oil' => $post['record_oil'],
					'record_finish' => 1
				]); 
				CarsModel::where('car_id',$car_id)->update($data);
			        UserLog::addLog([
			            'uid'=> session('userid'),
			            'name'=> $msg,
			            'url' => $this->request->path(),
			            'ip' =>$this->request->ip(),
			        ]);
			        $this->success($msg);
			}else{
				$get = $request->get();
				$id = $get['id'];
				$method = $get['method'];
				$where = ['carid'=>$id,'record_finish'=>0];	//查找未完成记录	
		        if(!$id) return $this->error('数据不存在');
		        $record = Db::name('cars_record')->where($where)->find();
				//var_dump($record);
		        if(!$record) return $this->error('车辆没有未完成的记录!');
				$cars = Db::name('cars_record')->alias('c')->join('member m','c.record_people=m.id','LEFT')->field('c.*,m.member_name')->where(['carid'=>$id,'record_finish'=>0])->find();
				$this->assign([
		            'cars'=>$cars,
					'method'=>$method
		        ]);
		        return $this->fetch();
				}
		    }
			/*
			*车辆保险购买
			*@param $id
			*/
			public function buy(){
				$request = $this->request;
				if($request->isAjax()){
				    $post     = $request->post();
					$car_id = $post['car_id'];
				    Db::name('cars_record')->insert([
						'carid' => $car_id,
						'record_reason' => $post['record_reason'],
						'record_time' => strtotime($post['record_time']),
						'record_end_time' => strtotime($post['record_end_time']),
						'record_user' => session('userid'),
						'record_people' => $post['record_people'],
						'record_type'=> 0,
						'record_money' => $post['record_money'],
						'record_finish' => 1
					]); 
					$msg = $post['car_no']." 成功购买保险";
				        UserLog::addLog([
				            'uid'=> session('userid'),
				            'name'=> $msg,
				            'url' => $this->request->path(),
				            'ip' =>$this->request->ip(),
				        ]);
				        $this->success($msg);
				}else{
					$get = $request->get();
					$id = $get['id'];
			        if(!$id) return $this->error('数据不存在');
			        $cars = CarsModel::where('car_id',$id)->find();
			        if(!$cars) return $this->error('数据不存在!');
					$members = Db::name('member')->where('member_status',1)->select();
			        $this->assign([
			            'cars'=>$cars,
						'members' =>$members
			        ]);
			        return $this->fetch();
					}
			    }
		/*
		*车辆使用记录查看
		*/
	   public function list(){
		   $carid = input('carid');
		    if(!$carid) $producaridct_id =  0;
		    $this->assign('carid',(int)$carid);
		   return $this->fetch();
	   }
	   /*
	   *车辆图片获取
	   */
	   public function get_cars_images_list()
	       {
	           $where=UtilService::getMore([
	               ['page',1],
	               ['limit',10],
	               ['title',''],
	               ['car_name',''],
	               ['car_id',0],
	           ]);
			   $list=CarsModel::valiWhere($where)->page($where['page'],$where['limit'])->select();
	           return JsonService::successful($list);
	       }
}
