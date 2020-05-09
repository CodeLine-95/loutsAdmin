<?php /*a:2:{s:74:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/patrol/index.html";i:1588327584;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
                            <input class="layui-input" autocomplete="off" placeholder="开始时间" name="patrol_start_time" id="start"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="结束时间" name="patrol_end_time" id="end"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="patrol_name" placeholder="计划名称" style="width:300px;" autocomplete="off" class="layui-input"></div>
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
                            <th lay-data="{field:'id',sort: true,align:'center',width:'9%'}">计划编号</th>
                            <th lay-data="{field:'patrol_name',align:'left',templet:'#patrol_name'}">计划名称</th>
                            <th lay-data="{field:'code_name',align:'center',templet:'#code_name'}">标识名称</th>
                            <th lay-data="{field:'patrol_week',align:'center',width:'8%',templet:'#patrol_week'}">计划周期</th>
                            <th lay-data="{field:'patrol_start_time',align:'center',templet:'#patrol_start_time',width:'8%'}">开始时间</th>
                            <th lay-data="{field:'patrol_end_time',align:'center',templet:'#patrol_end_time',width:'8%'}">结束时间</th>
<!--                             <th lay-data="{field:'create_time',align:'center',templet:'#create_time',width:'9%'}">创建时间</th> -->
                            <th lay-data="{field:'id',templet:'#actionTpl',width:'9%',fixed:'right'}">操作</th>
                        </tr>
                        </thead>
                    </table>
                    
                    <script type="text/html" id="toolbarDemo">
                        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加计划','add.html',500,400)">添加</button>
                    </script>

                    <script type="text/html" id="patrol_name">
                        <h4>{{d.patrol_name}}</h4>
					</script>
					<script type="text/html" id="code_name">
                        {{# var arr = d.code_name.split(','); }}
                        {{# for(var i=0;i<arr.length;i++){ }}
                        	<p>{{ arr[i] }}</p>
                        {{# } }}
					</script>
					<script type="text/html" id="patrol_week">
                        {{# if(d.patrol_week == 0){ }}
                        	每日
                        {{# } }}
                        
                        {{# if(d.patrol_week == 1){ }}
                        	每周
                        {{# } }}
                        
                        {{# if(d.patrol_week == 2){ }}
                        	每月
                        {{# } }}
					</script>
                    <script type="text/html" id="patrol_start_time">
                        <b style="color:blue">{{ layui.util.toDateString(d.patrol_start_time * 1000,"yyyy-MM-dd") }}</b>
                    </script>
                    <script type="text/html" id="patrol_end_time">
                        <b style="color: red">{{ layui.util.toDateString(d.patrol_end_time * 1000,"yyyy-MM-dd") }}</b>
                    </script>
                    <script type="text/html" id="create_time">
                        {{ layui.util.toDateString(d.create_time * 1000,"yyyy-MM-dd") }}
                    </script>
                    <script type="text/html" id="actionTpl">
                        <button onclick="xadmin.open('编辑计划: {{d.patrol_name}}','edit.html?id={{d.id}}',900,650)" class="layui-btn layui-btn-xs">编辑</button>
                        <button onclick="lotus.del('{{d.id}}','0','/admin/estate.patrol/del')" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('.lotus-search-btn').on('click',function () {
        var where = {
            patrol_name:$('input[name=patrol_name]').val(),
            patrol_start_time:$('input[name=patrol_start_time]').val(),
            patrol_end_time:$('input[name=patrol_end_time]').val(),
        };
        lotus.table(where);
    })
</script>



</body>
</html>