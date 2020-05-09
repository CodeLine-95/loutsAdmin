<?php /*a:2:{s:77:"/www/wwwroot/pt.mbacms.com/application/admin/view/moduls/moduls_cars/buy.html";i:1582812009;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
        <form class="layui-form layui-form-pane" id="lotus-add-form" action="buy" method="post">
        <input type="hidden" name="car_id" value="<?php echo htmlentities($cars['car_id']); ?>">
            <div class="layui-form-item">
                <label class="layui-form-label">车牌号码</label>
                <div class="layui-input-block">
                    <input type="text" name="car_no" readonly="readonly" class="layui-input" value="<?php echo htmlentities($cars['car_no']); ?>">
                </div>
            </div>
			
			<div class="layui-form-item">
			    <label class="layui-form-label">保险名称</label>
			    <div class="layui-input-block">
			        <input type="text" name="record_reason" class="layui-input">
			    </div>
			</div>

            <div class="layui-form-item">
                    <label class="layui-form-label">经手人</label>
                    <div class="layui-input-block">
                        <select lay-filter="aihao" name="record_people" lay-search lay-verify="required">
                            <option value="">选择经手人</option>
                            <?php if(is_array($members) || $members instanceof \think\Collection || $members instanceof \think\Paginator): $i = 0; $__LIST__ = $members;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo htmlentities($vo['id']); ?>"><?php echo htmlentities($vo['member_name']); ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">购买日期</label>
                <div class="layui-input-block">
                    <input type="text" name="record_time" id="record_time" readonly="readonly" class="layui-input">
                </div>
            </div>
			
			<div class="layui-form-item">
			    <label class="layui-form-label">到期日期</label>
			    <div class="layui-input-block">
			        <input type="text" lay-verify="required" placeholder="yyyy-MM-dd" name="record_end_time" id="record_end_time" autocomplete="off"  class="layui-input">
			    </div>
			</div>
			
			<div class="layui-form-item">
			        <label class="layui-form-label">资金类型</label>
			        <div class="layui-input-block">
			            <select lay-filter="aihao" name="record_type" lay-verify="required">
			                <option value="0">付款</option>
			            </select>
			        </div>
			</div>
			
			<div class="layui-form-item">
			    <label class="layui-form-label">金额</label>
			    <div class="layui-input-block">
			        <input type="text" name="record_money" lay-verify="required" class="layui-input" value="0">
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
<script>
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	laydate.render({
	  elem: '#record_time'
	  ,trigger: 'click'
	  ,type: 'date'
	});
	laydate.render({
	  elem: '#record_end_time'
	  ,trigger: 'click'
	  ,type: 'date'
	});
	})
</script>


</body>
</html>