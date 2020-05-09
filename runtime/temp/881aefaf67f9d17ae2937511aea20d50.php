<?php /*a:2:{s:72:"/www/wwwroot/pt.mbacms.com/application/admin/view/goods/editProject.html";i:1587025761;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
        <form class="layui-form layui-form-pane" lay-filter="lotus-form-filter" id="lotus-edit-form" action="editProject" method="post">
	        
	        <input type="hidden" name="id">
            <div class="layui-form-item">
                <label class="layui-form-label">工程名称</label>
                <div class="layui-input-block">
                    <input type="text"  name="project_name" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">负责人</label>
                <div class="layui-input-block">
	                <select name="project_director" class="layui-select" lay-search>
		                <?php foreach($member as $m): ?>
		                <option value="<?php echo htmlentities($m['id']); ?>"><?php echo htmlentities($m['member_name']); ?></option>
		                <?php endforeach; ?>
	                </select>
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-block">
                    <input type="text"  name="project_phone" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">详细地址</label>
                <div class="layui-input-block">
                    <input type="text"  name="project_address" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>
            
            <div class="layui-form-item">
                <label class="layui-form-label">项目概况</label>
                <div class="layui-input-block">
                    <textarea name="comment" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    是否启用
                </label>
                <div class="layui-input-block">
                    <select lay-filter="aihao" name="status">
                        <option value="1">启用</option>
                        <option value="0">禁止</option>
                    </select>
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
        "project_name":"<?php echo htmlentities($data['project_name']); ?>",
        'project_director':"<?php echo htmlentities($data['project_director']); ?>",
        'project_phone':"<?php echo htmlentities($data['project_phone']); ?>",
        'project_address': "<?php echo htmlentities($data['project_address']); ?>",
        'comment':"<?php echo htmlentities($data['comment']); ?>",
        'status':"<?php echo htmlentities($data['status']); ?>"
    }
    lotus.editForm(lotusFormVal);
</script>


</body>
</html>