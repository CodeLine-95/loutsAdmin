<?php
namespace app\admin\model;
use think\Model;
use app\admin\model\Item;

class Stocks extends Model
{
    protected  $name = 'stocks';
    
    public static function checksales($orid,$house){
    	$list = Item::alias('i')->join('stocks s','i.gd_id=s.goods_id','left')->where('i.or_id',$orid)->where('s.house_id',$house)->field('i.it_number as numbers,s.numbers as stocks')->select()->toArray();
    	$err = 0;
    	if($list){
    	foreach($list as $key=>$val){
    		if($val['numbers'] > $val['stocks'])
    		$err ++;
    	}
    	}else{
    		$err = 1;
    	}
    	return $err;
    }

}