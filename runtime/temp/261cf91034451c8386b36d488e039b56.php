<?php /*a:2:{s:72:"/www/wwwroot/pt.mbacms.com/application/admin/view/member/editMember.html";i:1583136284;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
    
<script src="/static/lib/city-selector/area.js" type="text/javascript"></script>
<script src="/static/lib/city-selector/select.js" type="text/javascript"></script>

    
    
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
        <form class="layui-form layui-form-pane"  lay-filter="lotus-form-filter" id="lotus-edit-form" action="editMember" method="post">

            <input type="hidden" name="id">

            <div class="layui-form-item">
                <label class="layui-form-label">职员名称</label>
                <div class="layui-input-block">
                    <input type="text"  name="member_name" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">前台登陆用户</label>
                <div class="layui-input-block">
                    <input type="text"  name="member_user" lay-verify="required" autocomplete="off"  class="layui-input" size="18">
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password"  name="member_password" autocomplete="off"  class="layui-input" size="18">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">身份证号</label>
                <div class="layui-input-block">
                    <input type="text"  name="member_card" lay-verify="required" autocomplete="off"  class="layui-input" size="18">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">手机号码</label>
                <div class="layui-input-block">
                    <input type="text"  name="member_phone" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">职员代码</label>
                <div class="layui-input-block">
                    <input type="text"  name="member_code" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">职员简称</label>
                <div class="layui-input-block">
                    <input type="text"  name="member_sname" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属部门</label>
                <div class="layui-input-block">
                    <select lay-filter="aihao" name="member_category" lay-verify="required">
                        <option value="0">顶级分类</option>
                        <?php if(is_array($mcategory) || $mcategory instanceof \think\Collection || $mcategory instanceof \think\Paginator): $i = 0; $__LIST__ = $mcategory;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo htmlentities($vo['id']); ?>"><?php echo htmlentities(str_repeat('丨--',$vo['level']-1)); ?><?php echo htmlentities($vo['mcategory_name']); ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属楼宇</label>
                <div class="layui-input-block">
                    <select lay-filter="aihao" name="member_shop" lay-verify="required">
                        <option value="">所属楼宇</option>
                        <?php if(is_array($shop) || $shop instanceof \think\Collection || $shop instanceof \think\Paginator): $i = 0; $__LIST__ = $shop;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                            <option value="<?php echo htmlentities($vo['id']); ?>"><?php echo htmlentities($vo['shop_name']); ?></option>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
            <label class="layui-form-label">请选择地区</label>
                <div class="layui-inline" style="width:150px;">
                    <select name="province" id="province" lay-verify="required" lay-search lay-filter="province" autocomplete="off">
                        <option value="">省份</option>
                    </select>
                </div>
                <div class="layui-inline" style="width:150px;">
                    <select name="city" id="city" lay-verify="required" lay-search lay-filter="city">
                        <option value="">地级市</option>
                    </select>
                </div>
                <div class="layui-inline" style="width:150px;">
                    <select name="area" id="area" lay-verify="required" lay-search>
                        <option value="">县/区</option>
                    </select>
                </div>
        </div>

            <div class="layui-form-item">
                <label class="layui-form-label">街道</label>
                <div class="layui-input-block">
                    <input type="text"  name="member_address" autocomplete="off"  class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">个人网站</label>
                <div class="layui-input-block">
                    <input type="text"  name="member_site" autocomplete="off"  class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    是否启用
                </label>
                <div class="layui-input-block">
                    <select lay-filter="aihao" name="member_status">
                        <option value="1">启用</option>
                        <option value="0">禁止</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">职员概况</label>
                <div class="layui-input-block">
                    <textarea  name="comment" style="height:80px;" class="layui-input"></textarea>
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
    var lotusFormVal = {
        'id':"<?php echo htmlentities($data['id']); ?>",
        'member_name':"<?php echo htmlentities($data['member_name']); ?>",
        'member_user':"<?php echo htmlentities($data['member_user']); ?>",
        'member_card':"<?php echo htmlentities($data['member_card']); ?>",
        'member_phone':"<?php echo htmlentities($data['member_phone']); ?>",
        "member_code":"<?php echo htmlentities($data['member_code']); ?>",
        "member_sname":"<?php echo htmlentities($data['member_sname']); ?>",
        "member_site":"<?php echo htmlentities($data['member_site']); ?>",
        "member_category":"<?php echo htmlentities($data['member_category']); ?>",
        "member_address":"<?php echo htmlentities($data['member_address']); ?>",
        'member_status':"<?php echo htmlentities($data['member_status']); ?>",
        'member_shop':"<?php echo htmlentities($data['member_shop']); ?>",
        'province':"<?php echo htmlentities($data['province']); ?>",
        'city':"<?php echo htmlentities($data['city']); ?>",
        'area':"<?php echo htmlentities($data['area']); ?>",
        'comment':"<?php echo htmlentities($data['comment']); ?>"
    }
    lotus.editForm(lotusFormVal);
</script>


</body>
</html>