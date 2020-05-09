<?php /*a:2:{s:70:"/www/wwwroot/pt.mbacms.com/application/admin/view/goods/toolsList.html";i:1588756779;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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

<div class="layui-fluid layui-anim layui-anim-upbit" >
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table id="lotus-table"  lay-data="{page:true,limits:[10,20,100],loading:true,toolbar:'#toolbarDemo',url:'toolsListJson',hash:''}"  class="layui-table layui-hide" >
                        <thead>
                        <tr>
	                        <th lay-data="{field:'id',sort:true,width:'10%'}">编号</th>
	                        <th lay-data="{field:'tools_name',width:'15%'}">名称</th>
                            <th lay-data="{field:'electricity_fee',width:'10%'}">电费：度/元</th>
                            <th lay-data="{field:'water_rate',width:'10%'}">水费：元/吨</th>
                            <th lay-data="{field:'gas_bill',width:'10%'}">气费：元/立方</th>
                            <th lay-data="{field:'heating_fee'}">暖气费</th>
                            <th lay-data="{field:'air_fee'}">冷气费</th>
                            <th lay-data="{field:'month_num'}">可变月份</th>
                            <th lay-data="{field:'property_fee'}">物业费</th>
                            <th lay-data="{width:'12%',field:'id',templet:'#actionTpl'}">操作</th>
                        </tr>
                        </thead>
                    </table>

                    <script type="text/html" id="toolbarDemo">
                        <div class = "layui-btn-container" >
                            <button class="layui-btn layui-btn-sm" onclick="xadmin.open('添加','addTools.html')"><i class="layui-icon"></i>添加</button>
                        </div >
                    </script>
                    <script type="text/html" id="actionTpl">
                        <button onclick="xadmin.open('编辑','editTools.html?id={{d.id}}')" class="layui-btn  layui-btn-xs">编辑</button>
                        <button onclick="lotus.del('{{d.id}}','delTools')" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>