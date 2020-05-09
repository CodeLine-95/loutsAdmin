<?php /*a:2:{s:69:"/www/wwwroot/pt.mbacms.com/application/admin/view/goods/addTools.html";i:1588756698;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
        <form class="layui-form layui-form-pane" id="lotus-add-form" action="addTools" method="post">
	        <div class="layui-form-item">
                <label class="layui-form-label">名称</label>
                <div class="layui-input-block">
                    <input type="text" name="tools_name" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>
	        <div class="layui-form-item">
                <label class="layui-form-label">地上车位</label>
                <div class="layui-input-block">
                    <input type="number" name="up_car_list" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">地下车位</label>
                <div class="layui-input-block">
                    <input type="number" name="down_car_list" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">电费</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="electricity_fee" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">度/元</div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">水费</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="water_rate" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">元/吨</div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">气费</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="gas_bill" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">元/立方</div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">暖气费</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="heating_fee" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">元/平米/季（层高超4米,按双倍收取）</div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">冷气费</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="air_fee" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">元/平米/四个月</div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">可变月份</label>
                <div class="layui-input-inline">
                    <input type="number" name="month_num" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">仅供冷气/暖气使用</div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">物业费</label>
                <div class="layui-input-inline">
                    <input type="number" step="0.01" name="property_fee" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux"></div>
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