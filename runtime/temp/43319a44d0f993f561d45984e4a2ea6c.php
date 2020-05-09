<?php /*a:2:{s:72:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/caller/add.html";i:1588822910;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
	            <div class="layui-col-md3">
	                <label class="layui-form-label">参访单位</label>
	                <div class="layui-input-inline">
	                    <select name="caller_enter_id" id="caller_enter_id" class="layui-select" lay-search>
		                    <?php foreach($enter as $e): ?>
		                    <option value="<?php echo htmlentities($e['id']); ?>"><?php echo htmlentities($e['enter_name']); ?></option>
		                   <?php endforeach; ?>
		                </select>
	                </div>
	            </div>
	            <div class="layui-col-md3">
	            	<label class="layui-form-label">被访人姓名</label>
	                <div class="layui-input-inline">
	                     <input type="text" name="caller_ename" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
            	</div>
            </div>

            <div class="layui-form-item">
	            <div class="layui-col-md3">
	            	<label class="layui-form-label">访客姓名</label>
	                <div class="layui-input-inline">
	                     <input type="text" name="caller_name" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
            	</div>
            	<div class="layui-col-md3">
	            	<label class="layui-form-label">手机号码</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="caller_phone" autocomplete="off" class="layui-input">
	                </div>
            	</div>
            </div>
            
            <div class="layui-form-item">
	            <div class="layui-col-md3">
	            	<label class="layui-form-label">身份证号</label>
	                <div class="layui-input-inline">
	                     <input type="text" name="caller_cardid" lay-verify="required|identity" autocomplete="off" class="layui-input">
	                </div>
            	</div>
            	<div class="layui-col-md3">
	            	<label class="layui-form-label">工作单位</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="caller_work" autocomplete="off" class="layui-input">
	                </div>
            	</div>
            </div>
            
            <div class="layui-form-item">
            	<div class="layui-col-md3">
	                <label class="layui-form-label">是否开车</label>
	                <div class="layui-input-inline">
	                 	 <input type="radio" name="is_on_car" value="0" lay-filter="is_on_car" title="否" checked class="layui-input">
	                 	 <input type="radio" name="is_on_car" value="1" lay-filter="is_on_car" title="是" class="layui-input">
	                </div>
                </div>
                <div class="layui-col-md3" id="car_no">
	                <label class="layui-form-label">车牌号</label>
	                <div class="layui-input-inline">
	                     <input type="text" name="caller_car_no" lay-verify="caller_car_no" autocomplete="off" class="layui-input">
	                </div>
                </div>
            </div>
            
            <div class="layui-form-item">
        		<div class="layui-col-md3">
        			<label class="layui-form-label">到访时间</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="caller_on_time" id="start" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
        		</div>
        		<div class="layui-col-md3">
        			<label class="layui-form-label">离开时间</label>
	                <div class="layui-input-inline">
	                    <input type="text"  name="caller_out_time" id="end" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
        		</div>
            </div>
            
            <div class="layui-form-item">
	            <label class="layui-form-label">访问事由</label>
	            <div class="layui-input-block">
		            <textarea name="caller_remark" id="caller_remark" class="layui-textarea"></textarea>
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
	
	layui.use(['form','jquery'],function(){
		var form = layui.form,$ = layui.jquery;
		var is_on_car = $('input[name=is_on_car]:checked').val();
		if(is_on_car == 0){
			$('#car_no').hide();
			$('input[name=caller_car_no]').val('');
		}else{
			$('#car_no').show();
			$('input[name=caller_car_no]').val('');
		}
		
		form.on('radio(is_on_car)',function(data){
			if(data.value == 0){
			$('#car_no').hide();
			$('input[name=caller_car_no]').val('');
		}else{
			$('#car_no').show();
			$('input[name=caller_car_no]').val('');
		}

		})
	});
</script>


</body>
</html>