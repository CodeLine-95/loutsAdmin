<?php /*a:2:{s:69:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/car/add.html";i:1587542326;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
<!doctype html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="/static/css/font.css">
<!--    <link rel="stylesheet" href="/static/css/xadmin.css">-->
    <link rel="stylesheet" href="/static/lib/layui/css/layui.css">
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery.form.js"></script>
    <script type="text/javascript" src="/static/js/lotus.js"></script>
    <script type="text/javascript" src="/static/js/jquery.jqprint-0.3.js"></script>
    
    
    
    <style>
    body{
        background-color: white;
    }
    .lotus-form{
        padding-top: 15px;
    }
    /*.layui-fluid {*/
    /*    position: relative;*/
    /*    margin: 0 auto;*/
    /*    padding: 5px 5px;*/
    /*}*/
    .layui-table-view {
        margin: 0px 0px;
    }
    </style>
</head>
<body>

<style type="text/css" media="all">
	.layui-image{
		display: inline-block;
	    width: 58px;
	    height: 58px;
	    text-align: center;
	    line-height: 58px;
	    border: 1px solid #c0ccda;
	    border-radius: 4px;
	    overflow: hidden;
	    background: #fff;
	    position: relative;
	    box-shadow: 2px 2px 5px rgba(0,0,0,.1);
	    margin-right: 4px;
	    box-sizing: border-box;
	}
	.layui-image img{
	    height: 100%;
	    display: inline-block;
	    vertical-align: top;
	}
	
	.fc-files {
	    display: inline-block;
	    width: 58px;
	    height: 58px;
	    cursor: pointer;
	    text-align: center;
	    line-height: 58px;
	    border: 1px dashed #c0ccda;
	    border-radius: 4px;
	    overflow: hidden;
	    background: #fff;
	    position: relative;
	    box-shadow: 2px 2px 5px rgba(0,0,0,.1);
	    margin-right: 4px;
	    box-sizing: border-box;
	}
	.ivu-icon {
	    display: inline-block;
	    font-family: Ionicons;
	    speak: none;
	    font-style: normal;
	    font-weight: 400;
	    font-variant: normal;
	    text-transform: none;
	    text-rendering: auto;
	    line-height: 1;
	    -webkit-font-smoothing: antialiased;
	    -moz-osx-font-smoothing: grayscale;
	}
</style>
<div class="layui-fluid lotus-form">
    <div class="layui-row">
        <form class="layui-form layui-form-pane" id="lotus-add-form" action="add" method="post">
 
            <div class="layui-form-item">
                <label class="layui-form-label">所在单位</label>
                <div class="layui-input-block">
                    <select name="enter_id" id="enter_id" class="layui-select" lay-search>
	                    <?php foreach($enter as $e): ?>
	                    <option value="<?php echo htmlentities($e['id']); ?>"><?php echo htmlentities($e['enter_name']); ?></option>
	                   <?php endforeach; ?>
	                </select>
                </div>
            </div>
            
            <hr>
            
            <div class="layui-form-item">
            	<div class="layui-col-md3">
	            	<label class="layui-form-label">车位号</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="car_parking" autocomplete="off" class="layui-input">
	                </div>
            	</div>
            	<div class="layui-col-md3">
	                <label class="layui-form-label">车牌号</label>
	                <div class="layui-input-inline">
	                     <input type="text"  name="car_no" autocomplete="off" class="layui-input">
	                </div>
                </div>
            </div>
            
            <div class="layui-form-item">
            	<div class="layui-col-md3">
	            	<label class="layui-form-label">车辆名称</label>
	                <div class="layui-input-inline">
	                     <input type="text" name="car_name" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
            	</div>
            	<div class="layui-col-md3">
	                <label class="layui-form-label">车辆类型</label>
	                <div class="layui-input-inline">
	                    <select name="car_type" id="car_type" class="layui-select" lay-search>
	                		<option value="1">蓝色车牌</option>
	                		<option value="2">黄色车牌</option>
	                		<option value="3">绿色车牌</option>
	                    </select>
	                </div>
                </div>
            </div>
           
            <div class="layui-form-item">
        		<div class="layui-col-md3">
        			<label class="layui-form-label">车主名称</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="car_username" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
        		</div>
        		<div class="layui-col-md3">
        			<label class="layui-form-label">联系电话</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="car_tel" lay-verify="required|phone" autocomplete="off" class="layui-input">
	                </div>
        		</div>
            </div>
            
            <div class="layui-form-item">
        		<div class="layui-col-md3">
        			<label class="layui-form-label">登记时间</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="car_start_time" id="start" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
        		</div>
        		<div class="layui-col-md3">
        			<label class="layui-form-label">到期时间</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="car_end_time" id="end" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
        		</div>
            </div>
            
            <hr>
            
            <div class="layui-form-item">
                <label class="layui-form-label">车辆图片</label>
                <div class="layui-input-block">
                    <div class="fc-files" style="float:left;" onclick="xadmin.open('添加车辆','/admin/widget.images/index/fodder/image.html',600,400)">
                    	<i class="layui-icon layui-icon-picture ivu-icon" style="font-size: 20px;"></i>
                    </div>
                    <div id="img" style="float:left;">
	                	
	                </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button style="margin-left: 30%" class="layui-btn" lay-submit="" lay-filter="toSubmit">提交</button>
                    <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" charset="utf-8">
	function changeIMG(obj,src){
		$img_str = '<div class="layui-image"><img src="'+src+'" alt="'+src+'" /><input type="hidden" name="car_pic[]" value="'+src+'" /></div>';
		layui.use(['jquery'], function(){
		   	var $ = layui.jquery;
		   	$('#img').append($img_str);
	    })
	}
</script>


</body>
</html>