<?php /*a:2:{s:68:"/www/wwwroot/pt.mbacms.com/application/admin/view/user/editRole.html";i:1566110242;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
        <form class="layui-form layui-form-pane"  lay-filter="lotus-form-filter"   id="lotus-edit-form"  method="post">

            <input name="id" type="hidden">

            <div class="layui-form-item">
                <label class="layui-form-label">角色名</label>
                <div class="layui-input-block">
                    <input type="text" id="title"    name="title" lay-verify="required" autocomplete="off" placeholder="请输入角色名" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">
                    状态
                </label>
                <div class="layui-input-block">
                    <select lay-filter="status" name="status" id='status'>
                        <option value="1">启用</option>
                        <option value="0">禁用</option>
                    </select>
                </div>
            </div>


            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">
                    权限节点
                </label>
                <div style="border:solid 1px  #e6e6e6 "  class="layui-input-block zTreeDemoBackground left">
                    <ul id="tree" class="ztree"></ul>
                </div>
            </div>
        </form>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="submit_btn" style="margin-left: 30%" class="layui-btn" lay-submit="" lay-filter="toSubmit">提交</button>
            </div>
        </div>

    </div>
</div>
<link rel="stylesheet" href="/static/lib/ztree/css/metroStyle/metroStyle.css" type="text/css">
<script type="text/javascript" src="/static/lib/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="/static/lib/ztree/js/jquery.ztree.excheck.js"></script>
<script>
        var checked_ids,auth_rule_ids = [];
        var tree = $("#tree");
        var zTree;
        var setting = {
            check: {
                enable: true
            },
            view: {
                dblClickExpand: true,
                showLine: true,
                showIcon: true,
                selectedMulti: false
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pid",
                    rootpid: ""
                },
                key: {
                    name: "title"
                }
            }
        };
        //加载树形菜单
        $.ajax({
            url: "<?php echo url('admin/user/getJson'); ?>",
            type: "post",
            dataType: "json",
            cache: false,
            data: {
                id: '<?php echo htmlentities($authGroup['id']); ?>'
            },
            success: function (data){
                zTree = $.fn.zTree.init(tree, setting, data);
                //遍历节点展开节点(如不需要请屏蔽)
                var treeObj =   $.fn.zTree.getZTreeObj("tree");
                var nodes =     treeObj.getNodes();
                checked_ids =   treeObj.getCheckedNodes();
                $.each(checked_ids, function (index, item) {
                    auth_rule_ids.push(item.id);
                });
                for (var i = 0; i < nodes.length; i++) { //设置节点展开
                    treeObj.expandNode(nodes[i], true, false, true);
                }
            }
        });

    $("#submit_btn").click(function(event){
        var checked_ids,auth_rule_ids = [];
        checked_ids = zTree.getCheckedNodes(); // 获取当前选中的checkbox
        $.each(checked_ids, function (index, item) {
            auth_rule_ids.push(item.id);
        });
        console.log(auth_rule_ids);
        var title   =  $('input[name=title]').val();
        var status  =  $('select[name=status]').val();
        $.ajax({
            url: "<?php echo url('admin/user/editRole'); ?>",
            type: 'post',
            dataType: 'json',
            data: {
                id     : '<?php echo htmlentities($authGroup['id']); ?>',
                title  : title,
                status : status,
                rules  : auth_rule_ids,
            },
        })
            .done(function(data) {
                if(data.code==0){
                    layer.msg(data.msg,{icon:2,time:1000});
                }else{
                    layer.msg(data.msg,{icon:1,time:500},function(){
                        $("#reset").click();
                        lotus.reload();
                    });
                }
            })
    });

    var lotusFormVal = {
        'id':"<?php echo htmlentities($authGroup['id']); ?>",
        'title':"<?php echo htmlentities($authGroup['title']); ?>",
        'status':"<?php echo htmlentities($authGroup['status']); ?>"
    }
    lotus.editForm(lotusFormVal);



</script>


</body>
</html>