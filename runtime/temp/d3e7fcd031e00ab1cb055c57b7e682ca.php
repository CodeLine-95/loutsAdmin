<?php /*a:2:{s:72:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/patrol/add.html";i:1588322599;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
                <label class="layui-form-label">选择标识</label>
                <div class="layui-input-block">
<!--
                    <select name="code_id" id="code_id" lay-verify="required" class="layui-select" lay-search>
	                    <?php foreach($code as $e): ?>
	                    <option value="<?php echo htmlentities($e['id']); ?>"><?php echo htmlentities($e['code_name']); ?></option>
	                   <?php endforeach; ?>
	                </select>
-->
	                <?php foreach($code as $e): ?>
	                	<input type="checkbox" name="code_id[]" value="<?php echo htmlentities($e['id']); ?>" title="<?php echo htmlentities($e['code_name']); ?>" lay-verify="required" autocomplete="off" class="layui-input">
	                <?php endforeach; ?>
                </div>
            </div>
            
            <hr>
            
            <div class="layui-form-item">
	            <label class="layui-form-label">计划名称</label>
                <div class="layui-input-block">
                    <input type="text" name="patrol_name" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">计划周期</label>
                <div class="layui-input-block">
                    <input type="radio" name="patrol_week" value="0" title="每日">
                    <input type="radio" name="patrol_week" value="1" title="每周" checked="">
                    <input type="radio" name="patrol_week" value="2" title="每月">
                </div>
            </div>
            
            <div class="layui-form-item">
        		<div class="layui-col-md3">
        			<label class="layui-form-label">开始时间</label>
	                <div class="layui-input-block">
	                    <input type="text" name="patrol_start_time" id="start" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
        		</div>
            </div>
            
            <div id="layui-form-item">
            	<div class="layui-col-md3">
        			<label class="layui-form-label">结束时间</label>
	                <div class="layui-input-block">
	                    <input type="text" name="patrol_end_time" id="end" lay-verify="required" autocomplete="off" class="layui-input">
	                </div>
        		</div>
            </div>
            
            <hr>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="toSubmit">提交</button>
                    <button id="reset" type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>


</body>
</html>