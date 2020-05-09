<?php
namespace app\api\controller;
use think\Controller;
use service\QrcodeServer;
class QrCode extends Controller{
	public function code(){
	 	$get = request()->param();
        // 自定义二维码配置
        $config = [
            'title'         => false,
            'logo'          => false,
        ];
        if(isset($get['generate']) && !empty($get['generate']) && $get['generate'] == 'writefile'){
        	return self::codeEncode($config,$get);
        }else{
        	echo self::codeEncode($config,$get);
        }
    }
	public static function codeEncode($config,$params){
        // 二维码访问地址
        if(!isset($params['unique_id']) || empty($params['unique_id'])) return json(['code'=>-1,'msg'=>'unique_id不能为空']);
        $qr_url = request()->domain(). url('api/qr_code/code',['unique_id'=>$params['unique_id']]);
        
        if(isset($params['generate']) && !empty($params['generate']) && $params['generate'] == 'writefile'){
	        $config['file_name'] = 'qrcode';
	        $config['generate']  = 'writefile';
	        $qr_code = new QrcodeServer($config);
	        $rs = $qr_code->createServer($qr_url);
	        if($rs['success']){
	        	$rs['data']['pic_url'] = $rs['data']['url'];
	        	$rs['data']['url'] = $qr_url;
	        	return json_encode(['code'=>0,'msg'=>'ok','data'=>$rs['data']]);
	        }else{
	        	return json_encode(['code'=>-1,'msg'=>'error','data'=>[]]);
	        }
        }else{
        	$qr_code = new QrcodeServer($config);
	        $rs = $qr_code->createServer($qr_url);
	        echo $rs;exit;
        }
    }
}