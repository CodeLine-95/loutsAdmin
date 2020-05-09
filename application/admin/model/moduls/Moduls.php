<?php
// +----------------------------------------------------------------------
// | ViooMa [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2020 http://www.viooma.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: 老马 <viooma@yahoo.com>
// +----------------------------------------------------------------------
namespace app\admin\model\moduls;

use think\Model;
use think\Db;
use app\admin\controller\moduls\ModulsConfig;

class Moduls extends Model
{

    /**
     * 获取模块列表
     */
    public static function getList()
    {
        //$dirs = array_map('basename', glob(APP.'/admin/controller/moduls/*.php'));
        
        $moduls = self::select();
 
        return $moduls;
    }

    public static function isInstalled($name){
		$installed = self::where('name',$name)->find();
		return $installed;
	}

    

}