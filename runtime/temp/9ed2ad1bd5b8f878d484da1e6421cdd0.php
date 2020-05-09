<?php /*a:2:{s:74:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/safety/index.html";i:1588942161;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
                            <input type="text" name="tools_name" placeholder="企业/用户名/标识/电话" style="width:300px;" autocomplete="off" class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <a class="layui-btn lotus-search-btn" lay-filter="search">
                                <i class="layui-icon">&#xe615;</i></a>
                        </div>
                    </form>
                </div>

                <div class="layui-card-body layui-table-body layui-table-main">
                    <table id="lotus-table"  lay-data="{page:true,limits:[10,20,30,40,50,60,70,80,90,100,200,300,400,500],loading:true,url:'listJson',hash:''}"  class="layui-table layui-hide" lay-filter="lotus-table">
                        <thead>
                        <tr>
                            <th lay-data="{field:'member_name',unresize:true,align:'left',width:'8%',templet:'#member_name'}">巡更人</th>
                            <th lay-data="{field:'tel',unresize:true,align:'center',width:'8%'}">电话</th>
                            <th lay-data="{field:'patrol_name',unresize:true,align:'left'}">计划</th>
                            <th lay-data="{field:'code_name',unresize:true,align:'left'}">标识</th>
                            <th lay-data="{field:'pic',unresize:true,align:'left',width:'8%',templet:'#pic'}">标识二维码</th>
                            <th lay-data="{field:'remark',unresize:true,align:'left'}">描述</th>
                            <th lay-data="{field:'create_time',unresize:true,align:'center',templet:'#create_time',width:'7%'}">时间</th>
                        </tr>
                        </thead>
                    </table>
                    
                    <script type="text/html" id="toolbarDemo">
                        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加','add.html',800,600)">添加</button>
                    </script>

                    <script type="text/html" id="member_name">
                        <h4>{{d.member_name}}</h4>
					</script>
					
					<script type="text/html" id="pic">
                    	{{# if(d.pic != null){ }}
                        	<img src="{{d.pic}}" />
                        {{# } }}
					</script>
					
					<script type="text/html" id="create_time">
                        <b style="color:blue">{{ layui.util.toDateString(d.create_time * 1000,"yyyy-MM-dd") }}</b>
                    </script>
                    <script type="text/html" id="actionTpl">
                        <button onclick="xadmin.open('编辑','edit.html?id={{d.id}}',800,600)" class="layui-btn layui-btn-xs">编辑</button>
                        <button onclick="lotus.del('{{d.id}}','0','/admin/estate.safety/del')" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('.lotus-search-btn').on('click',function () {
        var where = {
            tools_name:$('input[name=tools_name]').val(),
        };
        lotus.table(where);
    })
</script>



</body>
</html>