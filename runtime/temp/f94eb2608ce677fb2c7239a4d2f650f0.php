<?php /*a:2:{s:78:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/enterprise/index.html";i:1587631160;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
		height: auto;
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
                            <input type="text" name="enter_name" placeholder="请输入企业名称" autocomplete="off" class="layui-input"></div>
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
                            <th lay-data="{field:'id',sort: true,width:'8%',align:'center'}">企业编号</th>
                            <th lay-data="{field:'enter_name',align:'left',templet:'#enter_name'}">企业名称</th>
                            <th lay-data="{field:'enter_people',width:'12%',align:'center'}">联系人</th>
                            <th lay-data="{field:'enter_phone',width:'15%',align:'center'}">联系电话</th>
                            <th lay-data="{field:'enter_time',width:'12%',align:'center',templet:'#enter_time'}">入驻日期</th>
                            <th lay-data="{field:'enter_leave',width:'12%',align:'center',templet:'#enter_leave'}">离场日期</th>
                            <th lay-data="{field:'or_finish',templet:'#checkboxstatus',sort:true,width:'8%',align:'center',fixed:'right'}">状态</th>
                            <th lay-data="{field:'id',templet:'#actionTpl',width:'15%',fixed:'right'}">操作</th>
                        </tr>
                        </thead>
                    </table>
                    
                    <script type="text/html" id="toolbarDemo">
                        <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加企业','add.html',900,650)">添加企业</button>
                    </script>

                    <script type="text/html" id="enter_name">
                        <h4>{{d.enter_name}}</h4>
                        <p>简称：{{d.enter_short}}</p>
					</script>
                    <script type="text/html" id="enter_time">
                        <div>{{ layui.util.toDateString(d.enter_time * 1000,"yyyy-MM-dd") }}</div>
                    </script>
                    <script type="text/html" id="enter_leave">
                        <div>{{ layui.util.toDateString(d.enter_leave * 1000,"yyyy-MM-dd") }}</div>
                    </script>
                    <script type="text/html" id="actionTpl">
                        <button onclick="xadmin.open('编辑企业: {{d.enter_name}}','edit.html?id={{d.id}}',900,650)" class="layui-btn layui-btn-xs">编辑</button>
                        <button onclick="lotus.del('0','{{d.id}}','/admin/estate.enterprise/del')" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
                    </script>
                    <!--启用|禁用-->
                    <script type="text/html" id="checkboxstatus">
                        <input type='checkbox' name='id' lay-skin='switch' value="{{d.id}}" lay-filter='status' lay-text='启用|禁用'  {{ d.enter_status == 1 ? 'checked' : '' }}>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('.lotus-search-btn').on('click',function () {
        var where = {
            enter_name:$('input[name=enter_name]').val(),
            
        };
        lotus.table(where);
    })
    
    layui.use(['form','jquery','layer'], function(){
	   	var form = layui.form,layer = layui.layer,$ = layui.jquery;
	    var status;
	    form.on('switch(status)',function (obj) {
		    console.log(obj)
	        if(obj.elem.checked==true){
		        status = 1;
	        }else{
	            status= 0;
	        }
	        $.post("editStatus",{enter_status:status,id:obj.value},function(res){
			    layer.msg(res.msg)
	        },'json');
	    })
    })
</script>



</body>
</html>