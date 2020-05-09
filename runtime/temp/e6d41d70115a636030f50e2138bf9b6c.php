<?php /*a:2:{s:76:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/enterprise/add.html";i:1587631160;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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

<div class="layui-fluid lotus-form">
    <div class="layui-row">
        <form class="layui-form layui-form-pane" id="lotus-add-form" action="add" method="post">

            <div class="layui-form-item">
                <label class="layui-form-label">企业名称</label>
                <div class="layui-input-block">
                    <input type="text" name="enter_name" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
                <div class="layui-col-md3">
                	<label class="layui-form-label">企业简称</label>
                      <div class="layui-input-inline">
                       <input type="text"  name="enter_short" autocomplete="off" class="layui-input">
                     </div>
                </div>
            	
            	<div class="layui-col-md3">
	                <label class="layui-form-label">租赁面积</label>
	                <div class="layui-input-inline">
	                    <div class="layui-input-inline">
                         <input type="text"  name="enter_acreage" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
	                </div>
                </div>
            </div>             
            
            <div class="layui-form-item">
                <div class="layui-col-md3">
                	<label class="layui-form-label">企业管家</label>
                      <div class="layui-input-inline">
                        <select name="enter_butler" class="layui-select">
                        	<?php foreach($member as $m): ?>
                        	<option value="<?php echo htmlentities($m['id']); ?>"><?php echo htmlentities($m['member_name']); ?></option>
                        	<?php endforeach; ?>
                        </select>
                     </div>
                </div>	
            	
            	<div class="layui-col-md3">
	                <label class="layui-form-label">联系人</label>
	                <div class="layui-input-inline">
	                    <div class="layui-input-inline">
                         <input type="text"  name="enter_people" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
	                </div>
                </div>
            </div> 
            
            <div class="layui-form-item">
                <label class="layui-form-label">联系人</label>
                <div class="layui-input-block">
                    <input type="text"  name="enter_people" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-col-md3">
                <label class="layui-form-label">联系手机</label>
                      <div class="layui-input-inline">
                    <input type="text"  name="enter_phone" lay-verify="required" autocomplete="off" class="layui-input">
                     </div>
                </div>	
            	
            	<div class="layui-col-md3">
	                <label class="layui-form-label">公司座机</label>
	                <div class="layui-input-inline">
	                    <div class="layui-input-inline">
                    <input type="text"  name="enter_tel" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
	                </div>
                </div>
            </div> 
            
            <div class="layui-form-item">
                <div class="layui-col-md3">
                <label class="layui-form-label">入驻日期</label>
                      <div class="layui-input-inline">
                    <input type="text"  name="enter_time" id="start" lay-verify="required" autocomplete="off" class="layui-input">
                     </div>
                </div>	
            	
            	<div class="layui-col-md3">
	                <label class="layui-form-label">离场日期</label>
	                <div class="layui-input-inline">
	                    <div class="layui-input-inline">
                    <input type="text"  name="enter_leave" id="end" lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
	                </div>
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">联系地址</label>
                <div class="layui-input-block">
                    <input type="text"  name="enter_address" autocomplete="off" class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">企业简介</label>
                <div class="layui-input-block">
                    <textarea name="enter_comment" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    是否启用
                </label>
                <div class="layui-input-block">
                    <select lay-filter="aihao" name="enter_status">
                        <option value="1">启用</option>
                        <option value="0">禁止</option>
                    </select>
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


</body>
</html>