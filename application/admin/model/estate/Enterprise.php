<?php
namespace app\admin\model\estate;
use think\Model;
use service\PHPExcelService;
use think\Db;
use basic\ModelBasic;
use traits\ModelTrait;


/**
 * 产品管理 model
 * Class StoreProduct
 * @package app\admin\model\store
 */
class Enterprise extends ModelBasic
{
	use ModelTrait;
	

    /**
     * 获取连表查询条件
     * @param $type
     * @return array
     */
    public static function setData($status){
        switch ((int)$status){
            case 0:
                $data = ['enter_status'=>0];
                break;
            case 1://空闲
                $data = ['p.enter_status'=>1];
                break;
        };
        return isset($data) ? $data: [];
    }
    /**
     * 获取连表MOdel
     * @param $model
     * @return object
     */
    public static function getModelObject($where=[]){
        $model=new self();
        $model=$model->alias('p')->join('cars_record cr','p.id=cr.carid','LEFT');
        if(!empty($where)){
            if(isset($where['status']) && $where['status']!='' && ($data=self::setData($where['status']))){
                $model = $model->where($data);
            }
            if(isset($where['enter_name']) && $where['enter_name']!=''){
                $model = $model->where('p.enter_name|p.car_no','LIKE',"%$where[enter_name]%");
            }
        }
        return $model;
    }
	/**
	 * 获取单表MOdel
	 * @param $model
	 * @return object
	 */
	public static function getModelSingle($where=[]){
	    $model=self::alias('p');
	    if(!empty($where)){
	        if(isset($where['status']) && $where['status']!='' && ($data=self::setData($where['status']))){
	            $model = $model->where($data);
	        }
	        if(isset($where['enter_name']) && $where['enter_name']!=''){
	            $model = $model->where('p.enter_name|p.car_no','LIKE',"%$where[enter_name]%");
	        }
	    }
	    return $model;
	}

    /*
     * 获取企业列表
     * @param $where array
     * @return array
     *
     */
    public static function EnterpriseList($where){
        $model=self::getModelObject($where)->field(['p.*']);
        if(!empty($where))
		$model=$model->group('p.id');
		if($where['excel']==0) $model=$model->page((int)$where['page'],(int)$where['limit']);
        $data=($data=$model->select()) && count($data) ? $data->toArray():[];
		// foreach ($data as & $item){
  //           $item['money'] = self::getMoney($item['id'])>0?self::getMoney($item['id']):0;//消耗
  //       }
        if($where['excel']==1){
            $export = [];
            foreach ($data as $index=>$item){
                $export[] = [
                    $item['enter_name'],
                    $item['enter_short'],
                    $item['enter_people'],
                    $item['enter_phone'],
                    $item['enter_address'],
                    date('Y-m-d',$item['enter_time']),
                    date('Y-m-d',$item['enter_leave']),
                    '￥'.$item['enter_status']
                ];
            }
            PHPExcelService::setExcelHeader(['企业名称','企业简称','联系人','联系电话','地址','入驻日期','离场日期','状态'])
                ->setExcelTile('企业导出','企业信息'.time(),' 生成时间：'.date('Y-m-d H:i:s',time()))
                ->setExcelContent($export)
                ->ExcelSave();
        }
        $count=self::getModelObject($where)->count();
        return compact('count','data');
    }
    
    //获取总消耗
    public static function getMoney($carId)
    {
        return Db::name('cars_record')->where(['carid'=>$carId,'record_type'=>0])->sum('record_money');
    }
    
    /*
         * 设置where条件
         * @param array $where
         * @param string $alias
         * @param object $model
         * */
        public static function valiWhere($where,$alias='',$joinAlias='',$model=null)
        {
            $model=is_null($model) ? new self() : $model;
            if($alias){
                $model=$model->alias($alias);
                $alias.='.';
            }
            $joinAlias=$joinAlias ? $joinAlias.'.' : '';
            if(isset($where['id']) && $where['id']!=0) $model=$model->where($alias.'id',$where['id']);
            if(isset($where['enter_name']) && $where['enter_name']) $model=$model->where("{$joinAlias}enter_name",'LIKE',"%$where[enter_name]%");
			return $model->where("{$alias}enter_status",1);
        }

}