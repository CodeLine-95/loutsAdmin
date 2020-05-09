<?php /*a:2:{s:74:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/repair/index.html";i:1588990203;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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

<style type="text/css" media="screen">
	.layui-table-cell{
		height: auto !important;
	}
	h4{
		font-weight: bold;
	}
</style>
<div class="layui-fluid layui-anim layui-anim-upbit" >
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space8" id="ajaxForm" method="get">
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="提交时间" name="repair_create_time" id="start">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                        	<input class="layui-input" autocomplete="off" placeholder="审批时间" name="repair_audit_time" id="end">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
			                <div class="layui-input-linline">
			                    <select name="enter_id" id="enter_id" lay-verify="required" class="layui-select" lay-search>
				                     <option value="">请选择报修单位</option>
				                    <?php foreach($enter as $e): ?>
				                    <option value="<?php echo htmlentities($e['id']); ?>"><?php echo htmlentities($e['enter_name']); ?></option>
				                   <?php endforeach; ?>
				                </select>
			                </div>
			            </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="repair_name" placeholder="报修人/报修电话/维修人" style="width:300px;" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <a class="layui-btn lotus-search-btn" lay-filter="search">
                                <i class="layui-icon">&#xe615;</i></a>
                        </div>
                    </form>
                </div>

                <div class="layui-card-body layui-table-body layui-table-main">
                    <table id="lotus-table"  lay-data="{page:true,limits:[10,20,30,40,50,60,70,80,90,100,200,300,400,500],loading:true,toolbar:'#toolbarDemo',url:'listJson',hash:''}"  class="layui-table layui-hide" lay-filter="lotus-table">
                        <thead>
                        <tr>
                            <th lay-data="{field:'repair_order_id',align:'center',width:'10%'}">报修ID</th>
                            <th lay-data="{field:'repair_user_name',align:'left',width:'10%',templet:'#repair_user_name',width:'8%'}">报修人</th>
                            <th lay-data="{field:'repair_tel',align:'center',width:'10%'}">电话</th>
                            <th lay-data="{field:'enter_name',align:'left',templet:'#enter_name'}">企业单位</th>
                            <th lay-data="{field:'repair_type',align:'center',width:'8%',templet:'#repair_type'}">报修类型</th>
                            <th lay-data="{field:'maintainer',align:'center',templet:'#maintainer',width:'8%'}">维修人</th>
                            <th lay-data="{field:'repair_audit_name',align:'center',templet:'#repair_audit_name',width:'8%'}">审批人</th>
                            <th lay-data="{field:'repair_status',align:'center',templet:'#repair_status',width:'8%'}">审核状态</th>
                            <th lay-data="{field:'repair_create_time',align:'center',templet:'#repair_create_time',width:'8%'}">提交时间</th>
                            <th lay-data="{field:'repair_audit_time',align:'center',templet:'#repair_audit_time',width:'8%'}">审批时间</th>
                            <th lay-data="{field:'id',templet:'#actionTpl',width:'12%',fixed:'right'}">操作</th>
                        </tr>
                        </thead>
                    </table>
                    
                    <script type="text/html" id="toolbarDemo">
                        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加','add.html',600,500)">添加</button>
                    </script>

                    <script type="text/html" id="repair_user_name">
                        <h4>{{d.repair_user_name}}</h4>
					</script>
					<script type="text/html" id="enter_name">
						<b>
                        {{# if(!d.enter_name){ }}
                        	暂无
                        {{# }else{ }}
                        	{{ d.enter_name }}
                        {{# } }}
						</b>
					</script>
					<script type="text/html" id="maintainer">
						<b>
                        {{# if(!d.maintainer){ }}
                        	暂无
                        {{# }else{ }}
                        	{{ d.maintainer }}
                        {{# } }}
						</b>
					</script>
					<script type="text/html" id="repair_audit_name">
						<b>
                        {{# if(!d.repair_audit_name){ }}
                        	暂无
                        {{# }else{ }}
                        	{{ d.repair_audit_name }}
                        {{# } }}
						</b>
					</script>
					<script type="text/html" id="repair_type">
                        {{# if(d.repair_type == 0){ }}
                        	宽带电话
                        {{# } }}
                        
                        {{# if(d.repair_type == 1){ }}
                        	电力系统
                        {{# } }}
                        
                        {{# if(d.repair_type == 2){ }}
                        	水力系统
                        {{# } }}
                        
                        {{# if(d.repair_type == 3){ }}
                        	燃气系统
                        {{# } }}
					</script>
					<script type="text/html" id="repair_status">
                        {{# if(d.repair_status == 0){ }}
                        	未派单
                        {{# } }}
                        
                        {{# if(d.repair_status == 1){ }}
                        	处理中
                        {{# } }}
                        
                        {{# if(d.repair_status == 2){ }}
                        	已完成
                        {{# } }}
					</script>
					<script type="text/html" id="repair_create_time">
                        <b style="color:blue">{{ layui.util.toDateString(d.repair_create_time * 1000,"yyyy-MM-dd") }}</b>
                    </script>
                    <script type="text/html" id="repair_audit_time">
	                    <b style="color:red">
	                    {{# if(!d.repair_audit_time){ }}
                        	暂无
                        {{# }else{ }}
                        	{{ layui.util.toDateString(d.repair_audit_time * 1000,"yyyy-MM-dd") }}
                        {{# } }}
                        </b>
                    </script>
                    <script type="text/html" id="actionTpl">
	                    <button onclick="xadmin.open('审核: {{d.repair_order_id}}','audit.html?id={{d.id}}',600,400)" class="layui-btn layui-btn-xs">审核</button>
                        <button onclick="xadmin.open('编辑: {{d.repair_order_id}}','edit.html?id={{d.id}}',600,500)" class="layui-btn layui-btn-xs">编辑</button>
                        <button onclick="lotus.del('{{d.id}}','0','/admin/estate.repair/del')" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('.lotus-search-btn').on('click',function () {
        var where = {
            repair_name:$('input[name=repair_name]').val(),
            repair_create_time:$('input[name=repair_create_time]').val(),
            repair_audit_time:$('input[name=repair_audit_time]').val(),
            enter_id:$('#enter_id option:selected').val(),
        };
        lotus.table(where);
    })
</script>



</body>
</html>