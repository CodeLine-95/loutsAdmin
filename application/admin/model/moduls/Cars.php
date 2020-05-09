<?php
namespace app\admin\model\moduls;
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
class Cars extends ModelBasic
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
                $data = ['car_status'=>0];
                break;
            case 1://空闲
                $data = ['p.car_status'=>1,'p.is_use'=>0,'p.is_repair'=>0,'p.is_appointment'=>0];
                break;
            case 2://使用中
                $data = ['p.car_status'=>1,'p.is_use'=>1];
                break;
            case 3://维修中
                $data = ['p.car_status'=>1,'p.is_repair'=>1];
                break;
			case 4://预约中
				$data = ['p.car_status'=>1,'p.is_appointment'=>1];
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
        $model=$model->alias('p')->join('cars_record cr','p.car_id=cr.carid','LEFT');
        if(!empty($where)){
            if(isset($where['status']) && $where['status']!='' && ($data=self::setData($where['status']))){
                $model = $model->where($data);
            }
            if(isset($where['car_name']) && $where['car_name']!=''){
                $model = $model->where('p.car_name|p.car_no','LIKE',"%$where[car_name]%");
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
	        if(isset($where['car_name']) && $where['car_name']!=''){
	            $model = $model->where('p.car_name|p.car_no','LIKE',"%$where[car_name]%");
	        }
	    }
	    return $model;
	}

    /*
     * 获取产品列表
     * @param $where array
     * @return array
     *
     */
    public static function CarList($where){
        $model=self::getModelObject($where)->field(['p.*','sum(cr.record_money) as money']);
        if(!empty($where))
		$model=$model->group('p.car_id');
		if($where['excel']==0) $model=$model->page((int)$where['page'],(int)$where['limit']);
        $data=($data=$model->select()) && count($data) ? $data->toArray():[];
		foreach ($data as & $item){
            $item['money'] = self::getMoney($item['car_id'])>0?self::getMoney($item['car_id']):0;//消耗
        }
        if($where['excel']==1){
            $export = [];
            foreach ($data as $index=>$item){
                $export[] = [
                    $item['car_name'],
                    $item['car_no'],
                    $item['car_type'],
                    $item['car_sort'],
                    $item['car_mileage'],
                    date('Y-m-d',$item['car_buy']),
                    date('Y-m-d',$item['car_upkeep']),
                    '￥'.$item['money']
                ];
            }
            PHPExcelService::setExcelHeader(['车辆名称','车牌号','车类型','排序','里程数','购买日期','保养日期','消耗'])
                ->setExcelTile('车辆导出','车辆信息'.time(),' 生成时间：'.date('Y-m-d H:i:s',time()))
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
            if(isset($where['car_id']) && $where['car_id']!=0) $model=$model->where($alias.'car_id',$where['car_id']);
            if(isset($where['car_name']) && $where['car_name']) $model=$model->where("{$joinAlias}car_name",'LIKE',"%$where[car_name]%");
			return $model->where("{$alias}car_status",1);
        }

}