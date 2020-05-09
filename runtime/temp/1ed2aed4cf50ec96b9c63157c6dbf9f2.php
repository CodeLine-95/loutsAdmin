<?php /*a:2:{s:71:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/car/index.html";i:1587542452;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
                            <input class="layui-input" autocomplete="off" placeholder="开始日" name="car_start_time" id="start"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="car_end_time" id="end"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="car_name" placeholder="车牌号/车位号/客户名称/客户单位" style="width:300px;" autocomplete="off" class="layui-input"></div>
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
                            <th lay-data="{field:'id',sort: true,align:'center',width:'10%'}">车辆编号</th>
                            <th lay-data="{field:'car_pic',align:'center',width:'12%'}">车辆图片</th>
                            <th lay-data="{field:'car_name',align:'left',width:'9%',templet:'#car_name'}">车辆名称</th>
                            <th lay-data="{field:'car_username',align:'center',width:'8%'}">车主名称</th>
                            <th lay-data="{field:'car_tel',align:'center',width:'11%'}">车主电话</th>
                            <th lay-data="{field:'enter_name',align:'center'}">所在单位</th>
                            <th lay-data="{field:'car_start_time',align:'center',templet:'#car_start_time',width:'9%'}">启用时间</th>
                            <th lay-data="{field:'car_end_time',align:'center',templet:'#car_end_time',width:'9%'}">到期时间</th>
                            <th lay-data="{field:'id',templet:'#actionTpl',width:'15%',fixed:'right'}">操作</th>
                        </tr>
                        </thead>
                    </table>
                    
                    <script type="text/html" id="toolbarDemo">
                        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加车辆','add.html',900,650)">添加车辆</button>
                    </script>

                    <script type="text/html" id="car_name">
                        <h4>{{d.car_name}}</h4>
                        <p>{{d.car_no }}</p>
                        <p>{{d.car_parking}}</p>
					</script>
                    <script type="text/html" id="car_start_time">
                        {{ layui.util.toDateString(d.car_start_time * 1000,"yyyy-MM-dd") }}
                    </script>
                    <script type="text/html" id="car_end_time">
                        {{ layui.util.toDateString(d.car_end_time * 1000,"yyyy-MM-dd") }}
                    </script>
                    <script type="text/html" id="actionTpl">
                    	<button onclick="xadmin.open('查看车辆: {{d.car_name}}','show.html?id={{d.id}}',900,650)" class="layui-btn layui-btn-xs">查看</button>
                        <button onclick="xadmin.open('编辑车辆: {{d.car_name}}','edit.html?id={{d.id}}',900,650)" class="layui-btn layui-btn-xs">编辑</button>
                        <button onclick="lotus.del('{{d.id}}','0','/admin/estate.car/del')" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('.lotus-search-btn').on('click',function () {
        var where = {
            car_name:$('input[name=car_name]').val(),
            car_start_time:$('input[name=car_start_time]').val(),
            car_end_time:$('input[name=car_end_time]').val(),
        };
        lotus.table(where);
    })
</script>



</body>
</html>