<?php
namespace app\api\controller;
use think\Controller;
class WxLogin extends Controller{
	private $appid = 'wx6da3c72afe9a3244';
	private $secret = 'ae7b55bfd4e22eefbaa039b6b459f7a5';
	public $code;
	public $OK = 0;
	public $IllegalAesKey = -41001;
	public $IllegalIv = -41002;
	public $IllegalBuffer = -41003;
	public $DecodeBase64Error = -41004;
	//通过登录获取openid
	public function mp_userinfo(){
		$get = request()->get();
		if(isset($get['code']) && !empty($get['code'])){
			$url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.$this->appid.'&secret='.$this->secret.'&js_code='.$get['code'].'&grant_type=authorization_code';
			$res = json_decode(doGet($url),true);
			if(isset($res['errcode']) && $res['errcode'] == -1){
				return json(['code'=>-1,'msg'=>$res['errmsg']]);
			}
			$this->code = $get['code'];
			return json(['code'=>0,'msg'=>'获取成功','data'=>$res]);
		}else{
			return json(['code'=>-1,'msg'=>'code不能为空']);
		}
	}
	//通过解密获取openid
	public function mp_userinfo_notlogin(){
		$get = request()->get();
		if(!isset($get['session_key']) || empty($get['session_key'])){
			return json(['code'=>-1,'msg'=>'sessionKey不能为空']);
		}
		if(!isset($get['encryptedData']) || empty($get['encryptedData'])){
			return json(['code'=>-1,'msg'=>'encryptedData不能为空']);
		}
		
		if(!isset($get['iv']) || empty($get['iv'])){
			return json(['code'=>-1,'msg'=>'iv不能为空']);
		}
		return $this->decryptData($get['session_key'],$get['encryptedData'],$get['iv'],$data);
	}
	
	/**
	 * 检验数据的真实性，并且获取解密后的明文.
	 * @param $encryptedData string 加密的用户数据
	 * @param $iv string 与用户数据一同返回的初始向量
	 * @param $data string 解密后的原文
     *
	 * @return int 成功0，失败返回对应的错误码
	 */
	public function decryptData($sessionKey, $encryptedData, $iv, &$data){
		if (strlen($sessionKey) != 24) {
			return json(['code'=>$this->IllegalAesKey,'msg'=>'sessionKey位数不正确']);
		}
		$aesKey = base64_decode($sessionKey);

        
		if (strlen($iv) != 24) {
			return json(['code'=>$this->IllegalIv,'msg'=>'iv位数不正确']);
		}
		$aesIV = base64_decode($iv);

		$aesCipher=base64_decode($encryptedData);

		$result=openssl_decrypt($aesCipher, "AES-128-CBC", $aesKey, 1, $aesIV);

		$dataObj=json_decode($result);
		if($dataObj == NULL){
			return json(['code'=>$this->IllegalBuffer,'msg'=>'数据解密错误']);
		}
		if($dataObj->watermark->appid != $this->appid){
			return json(['code'=>$this->IllegalBuffer,'msg'=>'数据解密错误']);
		}
		$data = json_decode($result,true);
		return json(['code'=>$this->OK,'msg'=>'','data'=>$data]);
	}
}