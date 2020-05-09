<?php /*a:2:{s:72:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/tools/edit.html";i:1588909836;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
        <form class="layui-form layui-form-pane" id="lotus-edit-form" action="edit" method="post">
        	<input type="hidden" name="id" value="<?php echo htmlentities($field['id']); ?>" />
            <div class="layui-form-item">
                <label class="layui-form-label">初始数据</label>
                <div class="layui-input-block">
                    <select name="default_id" id="default_id" lay-verify="required" class="layui-select" lay-search>
	                    <?php foreach($tools_default as $t): ?>
	                    <option value="<?php echo htmlentities($t['id']); ?>" <?php if($field['default_id'] == $t['id']): ?> selected <?php endif; ?>><?php echo htmlentities($t['tools_name']); ?></option>
	                   <?php endforeach; ?>
	                </select>
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">企业单位</label>
                <div class="layui-input-block">
                    <select name="enter_id" id="enter_id" lay-verify="required" class="layui-select" lay-search>
	                    <?php foreach($enterprise as $e): ?>
	                    <option value="<?php echo htmlentities($e['id']); ?>" <?php if($field['enter_id'] == $e['id']): ?> selected <?php endif; ?>><?php echo htmlentities($e['enter_name']); ?></option>
	                   <?php endforeach; ?>
	                </select>
                </div>
            </div>
            
            <hr>
            
            <div class="layui-form-item">
	            <label class="layui-form-label">工具名称</label>
                <div class="layui-input-block">
                    <input type="text" name="tools_name" value="<?php echo htmlentities($field['tools_name']); ?>" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">周期</label>
                <div class="layui-input-block">
                    <input type="radio" name="cycle" value="0" title="每日" <?php if($field['cycle'] == 0): ?> checked <?php endif; ?>>
                    <input type="radio" name="cycle" value="1" title="每周" <?php if($field['cycle'] == 1): ?> checked <?php endif; ?>>
                    <input type="radio" name="cycle" value="2" title="每月" <?php if($field['cycle'] == 2): ?> checked <?php endif; ?>>
                    <input type="radio" name="cycle" value="3" title="每季" <?php if($field['cycle'] == 3): ?> checked <?php endif; ?>>
                    <input type="radio" name="cycle" value="4" title="每年" <?php if($field['cycle'] == 4): ?> checked <?php endif; ?>>
                    <input type="radio" name="cycle" value="5" title="无周期" <?php if($field['cycle'] == 5): ?> checked <?php endif; ?>>
                </div>
            </div>
            
            <div class="layui-form-item">
	            <label class="layui-form-label">上期账单</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="previous_period[]" lay-verify="required" placeholder="电表数" autocomplete="off" value="<?php echo htmlentities($field['previous_period'][0]); ?>" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="previous_period[]" lay-verify="required" placeholder="水表数" autocomplete="off" value="<?php echo htmlentities($field['previous_period'][1]); ?>" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="previous_period[]" lay-verify="required" placeholder="气表数" autocomplete="off" value="<?php echo htmlentities($field['previous_period'][2]); ?>" class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
	            <label class="layui-form-label">本期账单</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="current_period[]" lay-verify="required" placeholder="电表数" autocomplete="off" value="<?php echo htmlentities($field['current_period'][0]); ?>" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="current_period[]" lay-verify="required" placeholder="水表数" autocomplete="off" value="<?php echo htmlentities($field['current_period'][1]); ?>" class="layui-input">
                </div>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="current_period[]" lay-verify="required" placeholder="气表数" autocomplete="off" value="<?php echo htmlentities($field['current_period'][2]); ?>" class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
	            <label class="layui-form-label">额外费用</label>
                <div class="layui-input-block">
                    <input type="number" step="0.01" value="<?php echo htmlentities($field['extra_price']); ?>" name="extra_price" lay-verify="required" autocomplete="off" value="0.00" class="layui-input">
                </div>
            </div>
            <?php if($field['cycle'] == 5): ?>
	        	<div class="layui-form-item" id="times" style="display:block;">
	        		<div class="layui-col-md3">
	        			<label class="layui-form-label">开始时间</label>
		                <div class="layui-input-inline">
		                    <input type="text" name="start_time" id="start" lay-verify="required" autocomplete="off" value="<?php echo htmlentities($field['start_time']); ?>" class="layui-input">
		                </div>
	        		</div>
	        		<div class="layui-col-md3">
	        			<label class="layui-form-label">结束时间</label>
		                <div class="layui-input-inline">
		                    <input type="text" name="end_time" id="end" lay-verify="required" autocomplete="off" value="<?php echo htmlentities($field['end_time']); ?>" class="layui-input">
		                </div>
	        		</div>
	        		
	        		<input type="hidden" id="time_chushi" value="<?php echo date('Y-m-d'); ?>" />
	            </div>
	            
	        <?php else: ?>
	        
	        	<div class="layui-form-item" id="times" style="display:none;">
	        		<div class="layui-col-md3">
	        			<label class="layui-form-label">开始时间</label>
		                <div class="layui-input-inline">
		                    <input type="text" name="start_time" id="start" lay-verify="required" autocomplete="off" value="<?php echo htmlentities($field['start_time']); ?>" class="layui-input">
		                </div>
	        		</div>
	        		<div class="layui-col-md3">
	        			<label class="layui-form-label">结束时间</label>
		                <div class="layui-input-inline">
		                    <input type="text" name="end_time" id="end" lay-verify="required" autocomplete="off" value="<?php echo htmlentities($field['end_time']); ?>" class="layui-input">
		                </div>
	        		</div>
	        		
	        		<input type="hidden" id="time_chushi" value="<?php echo date('Y-m-d'); ?>" />
	            </div>
            
            <?php endif; ?>
            
            <hr>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="toSubmit">提交</button>
                    <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
    
    <script type="text/javascript">
    	layui.use(['form','jquery'],function(){
    		var form = layui.form,$ = layui.jquery;
    		var cycle = $('input[name=cycle]:checked').val();
			if(cycle == 5){
				// $('input[name=start_time]').val('');
				// $('input[name=end_time]').val('');
				$('#times').show();
			}else{
				// $('input[name=start_time]').val($('#time_chushi').val());
				// $('input[name=end_time]').val($('#time_chushi').val());
				$('#times').hide();
			}
    		form.on('radio(cycle)',function(data){
    			if(data.value == 5){
    				// $('input[name=start_time]').val('');
    				// $('input[name=end_time]').val('');
    				$('#times').show();
    			}else{
    				// $('input[name=start_time]').val($('#time_chushi').val());
    				// $('input[name=end_time]').val($('#time_chushi').val());
    				$('#times').hide();
    			}
    		})
    	})
    </script>
</div>


</body>
</html>