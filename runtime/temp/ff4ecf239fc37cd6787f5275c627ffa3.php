<?php /*a:2:{s:74:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/caller/index.html";i:1588822910;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
                            <input class="layui-input" autocomplete="off" placeholder="来访时间" name="caller_on_time" id="start"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="离开时间" name="caller_out_time" id="end"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="caller_name" placeholder="访客姓名/身份证号/手机号/车牌号/参访单位" style="width:300px;" autocomplete="off" class="layui-input"></div>
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
                            <th lay-data="{field:'id',sort: true,align:'center',width:'10%'}">访客编号</th>
                            <th lay-data="{field:'caller_name',align:'center',width:'12%',templet:'#caller_name'}">访客姓名</th>
                            <th lay-data="{field:'caller_work',align:'center',width:'15%'}">工作单位</th>
                            <th lay-data="{field:'caller_cardid',align:'left',width:'10%'}">身份证号</th>
                            <th lay-data="{field:'caller_phone',align:'center',width:'8%'}">手机号</th>
                            <th lay-data="{field:'enter_name',align:'center'}">参访单位</th>
                            <th lay-data="{field:'caller_on_time',align:'center',templet:'#caller_on_time',width:'9%'}">来访时间</th>
                            <th lay-data="{field:'caller_out_time',align:'center',templet:'#caller_out_time',width:'9%'}">离开时间</th>
                            <th lay-data="{field:'id',templet:'#actionTpl',width:'15%',fixed:'right'}">操作</th>
                        </tr>
                        </thead>
                    </table>
                    
                    <script type="text/html" id="toolbarDemo">
                        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加','add.html',900,650)">添加</button>
                    </script>

                    <script type="text/html" id="caller_name">
                        <h4>{{d.caller_name}}</h4>
                        {{#  if(d.caller_car_no != ''){ }}
                        	<p><span style="background:#0092DC;color:#fff;padding:5px;border-radius:5px;font-size:12px">{{d.caller_car_no}}</span></p>
                        {{#  } }}
					</script>
                    <script type="text/html" id="caller_on_time">
                        {{ layui.util.toDateString(d.caller_on_time * 1000,"yyyy-MM-dd") }}
                    </script>
                    <script type="text/html" id="caller_out_time">
                        {{ layui.util.toDateString(d.caller_out_time * 1000,"yyyy-MM-dd") }}
                    </script>
                    <script type="text/html" id="actionTpl">
<!--                     	<button onclick="xadmin.open('查看: {{d.caller_name}}','show.html?id={{d.id}}',900,650)" class="layui-btn layui-btn-xs">查看</button> -->
                        <button onclick="xadmin.open('编辑: {{d.caller_name}}','edit.html?id={{d.id}}',900,650)" class="layui-btn layui-btn-xs">编辑</button>
                        <button onclick="lotus.del('{{d.id}}','0','/admin/estate.caller/del')" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('.lotus-search-btn').on('click',function () {
        var where = {
            caller_name:$('input[name=caller_name]').val(),
            caller_on_time:$('input[name=caller_on_time]').val(),
            caller_out_time:$('input[name=caller_out_time]').val(),
        };
        lotus.table(where);
    })
</script>



</body>
</html>