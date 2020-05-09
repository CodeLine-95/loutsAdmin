<?php /*a:2:{s:73:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/tools/index.html";i:1588990555;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
                            <input type="text" name="tools_name" placeholder="企业/名称/标识" style="width:300px;" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
	                        <input class="layui-input" autocomplete="off" placeholder="起始时间" name="start_time" id="start">
	                    </div>
	                    <div class="layui-inline layui-show-xs-block">
	                    	<input class="layui-input" autocomplete="off" placeholder="结束时间" name="end_time" id="end">
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
                            <th lay-data="{field:'tools_name',unresize:true,align:'left',width:'10%',templet:'#tools_name'}">名称</th>
                            <th lay-data="{field:'enter_name',unresize:true,align:'left'}">企业单位</th>
                            <th lay-data="{field:'current_period',unresize:true,align:'left',width:'8%',templet:'#current_period'}">本期账单</th>
                            <th lay-data="{field:'previous_period',unresize:true,align:'left',width:'8%',templet:'#previous_period'}">上期账单</th>
                            <th lay-data="{field:'dosage',unresize:true,align:'left',width:'8%',templet:'#dosage'}">用量</th>
                            <th lay-data="{field:'cycle',unresize:true,align:'center',width:'5%',templet:'#cycle'}">周期</th>
                            <th lay-data="{field:'property_fee',unresize:true,align:'left',width:'10%',templet:'#property_fee'}">物业/冷气/暖气费</th>
                            <th lay-data="{field:'extra_price',unresize:true,align:'center',width:'6%'}">额加费用</th>
                            <th lay-data="{field:'current_totalPrice',unresize:true,align:'center',width:'8%'}">应收费用（元）</th>
                            <th lay-data="{field:'start_time',unresize:true,align:'center',templet:'#start_time',width:'7%'}">起始时间</th>
                            <th lay-data="{field:'end_time',unresize:true,align:'center',templet:'#end_time',width:'7%'}">结束时间</th>
                            <th lay-data="{field:'id',unresize:true,templet:'#actionTpl',width:'8%',fixed:'right'}">操作</th>
                        </tr>
                        </thead>
                    </table>
                    
                    <script type="text/html" id="toolbarDemo">
                        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加','add.html',800,600)">添加</button>
                    </script>

                    <script type="text/html" id="tools_name">
                        <h4>{{d.tools_name}}</h4>
                        <p style="font-size:12px;">{{d.unique_id}}</p>
					</script>
					
					<script type="text/html" id="property_fee">
    
                        <p><span style="font-size:12px;">物业费: </span><b>{{ d.property_fee }}</b></p>
                        <p><span style="font-size:12px;">冷气费: </span><b>{{ d.air_fee }}</b></p>
                        <p><span style="font-size:12px;">暖气费: </span><b>{{ d.heating_fee }}</b></p>
					</script>
					
					<script type="text/html" id="current_period">
                        {{# var current_period = JSON.parse(d.current_period); }}
    
                        <p><span style="font-size:12px;">电表数: </span><b>{{ current_period[0] }}</b></p>
                        <p><span style="font-size:12px;">水表数: </span><b>{{ current_period[1] }}</b></p>
                        <p><span style="font-size:12px;">气表数: </span><b>{{ current_period[2] }}</b></p>
					</script>
					
					<script type="text/html" id="previous_period">
                        {{# var previous_period = JSON.parse(d.previous_period); }}
    
                        <p><span style="font-size:12px;">电表数: </span><b>{{ previous_period[0] }}</b></p>
                        <p><span style="font-size:12px;">水表数: </span><b>{{ previous_period[1] }}</b></p>
                        <p><span style="font-size:12px;">气表数: </span><b>{{ previous_period[2] }}</b></p>
					</script>
					
					<script type="text/html" id="dosage">
                        {{# var dosage = JSON.parse(d.dosage); }}
    
                        <p><span style="font-size:12px;">电表数: </span><b>{{ dosage[0] }}</b></p>
                        <p><span style="font-size:12px;">水表数: </span><b>{{ dosage[1] }}</b></p>
                        <p><span style="font-size:12px;">气表数: </span><b>{{ dosage[2] }}</b></p>
					</script>
					
					<script type="text/html" id="cycle">
                        {{# if(d.cycle == 0){ }}
                        	每日
                        {{# } }}
                        
                        {{# if(d.cycle == 1){ }}
                        	每周
                        {{# } }}
                        
                        {{# if(d.cycle == 2){ }}
                        	每月
                        {{# } }}
                        
                        {{# if(d.cycle == 3){ }}
                        	每季
                        {{# } }}
                        
                        {{# if(d.cycle == 4){ }}
                        	每年
                        {{# } }}
					</script>
					
					<script type="text/html" id="start_time">
                        <b style="color:blue">{{ layui.util.toDateString(d.start_time * 1000,"yyyy-MM-dd") }}</b>
                    </script>
                    <script type="text/html" id="end_time">
	                    <b style="color:red">{{ layui.util.toDateString(d.end_time * 1000,"yyyy-MM-dd") }}</b>
                    </script>
                    <script type="text/html" id="actionTpl">
                        <button onclick="xadmin.open('编辑: {{d.unique_id}}','edit.html?id={{d.id}}',800,600)" class="layui-btn layui-btn-xs">编辑</button>
                        <button onclick="lotus.del('{{d.id}}','0','/admin/estate.tools/del')" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
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
            start_time:$('input[name=start_time]').val(),
            end_time:$('input[name=end_time]').val(),
        };
        lotus.table(where);
    })
</script>



</body>
</html>