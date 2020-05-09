<?php /*a:2:{s:69:"/www/wwwroot/pt.mbacms.com/application/admin/view/sales/seeOrder.html";i:1584529381;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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

<div class="layui-fluid layui-anim layui-anim-upbit" id="print_body">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="layui-col-md12" style="height:80px;line-height:80px;text-align:center;font:bold 18px 黑体;"><h2><?php echo htmlentities($site_config['site_name']); ?>出库单详情</h2></div>
                    <form class="layui-form layui-col-space8" method="post" id="lotus-sigle-edit-form" lay-filter="lotus-form-filter">
                        <div class="layui-row">
                            <div class="layui-inline">
                            <label class="layui-form-label">职员名称：</label>
                            <div class="layui-input-inline" style="width:120px;">
                                <input type="text" class="layui-input" readonly="readonly" name="member_name" style="border:0;">
                        </div>
                    </div>
                            
                        <div class="layui-inline">
                            <label class="layui-form-label">出库仓库：</label>
                        <div class="layui-input-inline" style="width:120px;">
                            <input type="text" class="layui-input" readonly="readonly" name="house_name" style="border:0;">
                        </div>
                    </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">操作人员：</label>
                            <div class="layui-input-inline" style="width:120px;">
                            <input type="text" class="layui-input" readonly="readonly" name="fullname" style="border:0;">
                        </div>
                        </div>
                    </div>
                    <div class="layui-row">
                            <div class="layui-inline">
                            <label class="layui-form-label">出库单号：</label>
                            <div class="layui-input-inline" style="width:150px;">
                            <input type="text" name="or_id" autocomplete="off" class="layui-input" value="<?php echo htmlentities($or_id); ?>" readonly="readonly" style="border:0;">
                        </div>
                    </div>
                            
                        <div class="layui-inline">
                            <label class="layui-form-label">日期：</label>
                        <div class="layui-input-inline" style="width:120px;">
                            <input class="layui-input" name="or_create_time" readonly="readonly" style="border:0;">
                        </div>
                    </div>
                    <div class="layui-inline">
                            <label class="layui-form-label">备注：</label>
                        <div class="layui-input-inline" style="width:120px;">
                             <input type="text" class="layui-input" name="or_comment" readonly="readonly" style="border:0;">
                        </div>
                    </div>
                    
                    <!--div class="layui-inline">
                            <label class="layui-form-label">状态：</label>
                        <div class="layui-input-inline" style="width:120px;">
                            <input class="layui-input" name="verify_status" readonly="readonly" style="border:0;">
                        </div>
                    </div-->
                    </div>
                    
                    </form>
                </div>

                <div class="layui-card-body layui-table-body layui-table-main layui-col-md12">
                    <table class="layui-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>资产名称</th>
                                <th>单位</th>
                                <th>规格</th>
                                <th>数量</th>
                                <th>单价</th>
                                <th>金额</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if(is_array($items) || $items instanceof \think\Collection || $items instanceof \think\Paginator): $i = 0; $__LIST__ = $items;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <tr>
                                <td><?php echo htmlentities($vo['id']); ?></td>
                                <td><?php echo htmlentities($vo['goodsname']); ?></td>
                                <td><?php echo htmlentities($vo['unit']); ?></td>
                                <td><?php echo htmlentities($vo['spec']); ?></td>
                                <td><?php echo htmlentities($vo['it_number']); ?></td>
                                <td>￥<?php echo htmlentities(number_format($vo['it_price'],1)); ?></td>
                                <td>￥<?php echo htmlentities(number_format($vo['it_number']*$vo['it_price'],2)); ?></td>
                            </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr>
                            <td colspan="2" style="text-align:right;">合计：</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><?php echo htmlentities($totals[0]['numbers']); ?></td>
                            <td>&nbsp;</td>
                            <td>￥<?php echo htmlentities(number_format($totals[0]['moneys'],2)); ?></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="layui-col-md12" style="margin-left:10%;line-height:200%;">打印日期：<?php echo htmlentities($print_date); ?></div>
            </div>
        </div>
    </div>
</div>
<div class="layui-inline ipt layui-col-md12" style="text-align:right;margin-top:20px;margin-right:60px;">
    <a class="layui-btn print" class="ipt" href="javascript:void();" onclick="print();"><i class="iconfont icon-font-61d"></i>打印</a>
</div>
<script>
    var lotusFormVal = {
        'fullname':"<?php echo htmlentities($data['fullname']); ?>",
        'member_name':"<?php echo htmlentities($data['member_name']); ?>",
        'or_delivery':"<?php echo htmlentities($delivery); ?>",
        'verify_status':"<?php echo htmlentities($verify_status); ?>",
        'house_name':"<?php echo htmlentities($data['house_name']); ?>",
        'or_create_time':"<?php echo htmlentities($data['or_create_time']); ?>"
    }
    lotus.editSingleForm(lotusFormVal);
</script>


</body>
</html>