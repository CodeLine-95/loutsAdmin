<?php /*a:2:{s:79:"/www/wwwroot/pt.mbacms.com/application/admin/view/moduls/moduls_cars/index.html";i:1584238462;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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
    
<link href="/static/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="/static/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="/static/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/lib/layui/layui.all.js" charset="utf-8"></script>
<link href="/system/css/layui-admin.css" rel="stylesheet">
<link href="/system/frame/css/style.min.css" rel="stylesheet">
<script>
    window.controlle="moduls.moduls_cars";
    window.module="admin";
    </script>

    
    
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

<div class="layui-fluid" style="background: #fff;">
    <div class="layui-tab layui-tab-brief" lay-filter="tab">
        <ul class="layui-tab-title">
            <li lay-id="list" <?php if($status == '1'): ?>class="layui-this" <?php endif; ?> >
                <a href="<?php if($status == '1'): ?>javascript:;<?php else: ?><?php echo Url('index',['status'=>1]); ?><?php endif; ?>">可借用车辆(<?php echo htmlentities($onrest); ?>)</a>
            </li>
            <li lay-id="list" <?php if($status == '2'): ?>class="layui-this" <?php endif; ?>>
                <a href="<?php if($status == '2'): ?>javascript:;<?php else: ?><?php echo Url('index',['status'=>2]); ?><?php endif; ?>">使用中车辆(<?php echo htmlentities($onuse); ?>)</a>
            </li>
            <li lay-id="list" <?php if($status == '3'): ?>class="layui-this" <?php endif; ?>>
                <a href="<?php if($status == '3'): ?>javascript:;<?php else: ?><?php echo Url('index',['status'=>3]); ?><?php endif; ?>">维修中车辆(<?php echo htmlentities($onrepair); ?>)</a>
            </li>
            <li lay-id="list" <?php if($status == '4'): ?>class="layui-this" <?php endif; ?>>
                <a href="<?php if($status == '4'): ?>javascript:;<?php else: ?><?php echo Url('index',['status'=>4]); ?><?php endif; ?>">预约中车辆(<?php echo htmlentities($onappoint); ?>)</a>
            </li>
			<li lay-id="list" <?php if($status == '0'): ?>class="layui-this" <?php endif; ?>>
			    <a href="<?php if($status == '0'): ?>javascript:;<?php else: ?><?php echo Url('index',['status'=>0]); ?><?php endif; ?>">已禁用车辆(<?php echo htmlentities($onstop); ?>)</a>
			</li>
        </ul>
    </div>
    <div class="layui-row layui-col-space15"  id="app">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <form class="layui-form layui-form-pane" action="">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">车辆名称</label>
                                <div class="layui-input-block">
                                    <input type="text" name="car_name" class="layui-input" placeholder="请输入车辆名称,牌号">
                                    <input type="hidden" name="status" value="<?php echo htmlentities($status); ?>">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <button class="layui-btn layui-btn-sm layui-btn-normal" lay-submit="search" lay-filter="search">
                                        <i class="layui-icon layui-icon-search"></i>搜索</button>
                                    <!--button class="layui-btn layui-btn-primary layui-btn-sm export"  lay-submit="export" lay-filter="export">
                                        <i class="fa fa-floppy-o" style="margin-right: 3px;"></i>导出</button-->
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--产品列表-->
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <div class="layui-btn-container">
                        <?php switch($status): case "1": ?>
                                <button class="layui-btn layui-btn-sm" onclick="layList.createModalFrame(this.innerText,'<?php echo Url('add'); ?>',{h:520,w:800})">添加车辆</button>
                            <?php break; case "0": ?>
                                <button class="layui-btn layui-btn-sm" data-type="show">批量启用</button>
                            <?php break; ?>
                        <?php endswitch; ?>
                    </div>
                    <table class="layui-hide" id="List" lay-filter="List"></table>
                    <!--图片-->
                    <script type="text/html" id="image">
                        <img style="cursor: pointer" lay-event="open_image" src="{{d.image}}">
                    </script>
                    <!--启用|禁用-->
                    <script type="text/html" id="checkboxstatus">
                        <input type='checkbox' name='id' lay-skin='switch' value="{{d.car_id}}" lay-filter='status' lay-text='启用|禁用'  {{ d.car_status == 1 ? 'checked' : '' }}>
                    </script>
                    <!--收藏-->
                    <script type="text/html" id="car_buy">
                        <span>{{layui.util.toDateString(d.car_buy * 1000,"yyyy-MM-dd")}}</span>
                    </script>
                    <!--产品名称-->
                    <script type="text/html" id="car_name">
                        <h4>{{d.car_name}}</h4>
                        <p>车牌号:
						{{# if(d.car_type==1){ }}
							<button class="btn btn-xs btn-primary">{{d.car_no}}</button>
						{{# }else if(d.car_type==2){ }}
							<button class="btn btn-xs btn-warning">{{d.car_no}}</button>
						{{# }else if(d.car_type==3){ }}
							<button class="btn btn-xs btn-success" style="background:green">{{d.car_no}}</button>
						{{# } }}
						</p>
                        <!--p>购买日期:{{ layui.util.toDateString(d.car_buy * 1000,"yyyy-MM-dd") }}</p>
                        <p>保养时间:{{ layui.util.toDateString(d.car_upkeep * 1000,"yyyy-MM-dd") }}</p-->
                    </script>
					<!--金额-->
					<script type="text/html" id="money">
						￥{{ d.money.toFixed(2)}}
					</script>
                    <!--操作-->
                    <script type="text/html" id="act">
						<div class="dropdown">
						  <button class="btn btn-xs btn-primary dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    操作
						    <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
							  <li>
								  <a href="javascript:void(0);" onclick="layList.createModalFrame('{{d.car_name}}-编辑','<?php echo Url('edit'); ?>?id={{d.car_id}}',{h:520,w:800})">
							     <i class="fa fa-pencil"></i> 车辆编辑</a>
							  </li>
							<?php switch($status): case "1": ?>
						    <li>
						        <a href="javascript:void(0);" class="" onclick="xadmin.open('{{d.car_name}}-用车','<?php echo Url('use'); ?>?id={{d.car_id}}&method=use',500,500)">
						            <i class="fa fa-car"></i> 派车用车</a>
						    </li>
							<li>
							    <a href="javascript:void(0);" onclick="xadmin.open('{{d.car_name}}-维修','<?php echo Url('use'); ?>?id={{d.car_id}}&method=repair',500,500)">
							    <i class="fa fa-gears"></i> 车辆维修</a>
							</li>
							<li>
							    <a href="javascript:void(0);" onclick="xadmin.open('{{d.car_name}}-预约用车','<?php echo Url('use'); ?>?id={{d.car_id}}&method=appointment',500,500)">
							    <i class="fa fa-clock-o"></i> 预约用车</a>
							</li>
							<?php break; case "2": ?>
							<li>
							    <a href="javascript:void(0);" class="" onclick="xadmin.open('{{d.car_name}}-使用回收','<?php echo Url('back'); ?>?id={{d.car_id}}&method=use')">
							        <i class="fa fa-car"></i> 使用回收</a>
							</li>
							<?php break; case "3": ?>
							<li>
							    <a href="javascript:void(0);" class="" onclick="xadmin.open('{{d.car_name}}-维修取回','<?php echo Url('back'); ?>?id={{d.car_id}}&method=repair')">
							        <i class="fa fa-car"></i> 维修取回</a>
							</li>
							<?php break; case "4": ?>
							<li>
							    <a href="javascript:void(0);" class="" onclick="xadmin.open('{{d.car_name}}-预约取回','<?php echo Url('back'); ?>?id={{d.car_id}}&method=appointment')">
							        <i class="fa fa-car"></i> 预约取回</a>
							</li>
							<?php break; ?>
							<?php endswitch; ?>
						    
						    <li>
						        <a href="javascript:void(0);" onclick="xadmin.open('{{d.car_name}}-保险购买','<?php echo Url('buy'); ?>?id={{d.car_id}}',500,500)">
						            <i class="fa fa-cc-visa"></i> 保险购买</a>
						    </li>
						    <li>
						        <a href="<?php echo Url('list'); ?>?product_id={{d.car_id}}">
						            <i class="fa fa-warning"></i> 记录查看
						        </a>
						    </li>
						  </ul>
						</div>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/static/lib/requirejs/require.js"></script>
<script>
    window.test=1;
    var hostname = location.hostname;
    if(location.port) hostname += ':' + location.port;
    requirejs.config({
        map: {
            '*': {
                'css': '/static/lib/requirejs/require-css.js'
            }
        },
        shim:{
            'iview':{
                deps:['css!iviewcss']
            },
            'layer':{
                deps:['css!layercss']
            }
        },
        baseUrl:'//'+hostname+'/',
        paths: {
            'static':'static',
            'system':'system',
            'vue':'static/lib/vue/dist/vue.min',
            'axios':'static/lib/axios.min',
            'iview':'static/lib/iview/dist/iview.min',
            'iviewcss':'static/lib/iview/dist/styles/iview',
            'lodash':'static/lib/lodash',
            'layer':'static/lib/layer/layer',
            'layercss':'static/lib/layer/theme/default/layer',
            'jquery':'static/lib/jquery/jquery.min',
            'moment':'static/lib/moment',
            'sweetalert':'static/lib/sweetalert2/sweetalert2.all.min'

        },
        basket: {
            excludes:['system/js/index','system/util/mpVueComponent','system/util/mpVuePackage']
//            excludes:['system/util/mpFormBuilder','system/js/index','system/util/mpVueComponent','system/util/mpVuePackage']
        }
    });
</script>
<script src="/system/js/layuiList.js"></script>
<script>
    var status=<?=$status?>;
    //实例化form
    layList.form.render();
    //加载列表
    layList.tableList('List',"<?php echo Url('listJson',['status'=>$status]); ?>",function (){
        var join=new Array();
                join=[
                    {field: 'car_sort', title: '排序',width:'6%'},                    
                //    {field: 'car_id', title: 'ID', sort: true,event:'car_id',width:'6%'},
                    {field: 'image', title: '车辆图片',templet:'#image',width:'9%'},
                    {field: 'car_name', title: '车辆名称',templet:'#car_name',width:'15%'},
                   // {field: 'car_no', title: '车牌号',width:'8%'},
                    {field: 'car_mileage', title: '总里程数',width:'10%'},
                    {field: 'record_oil',title: '剩余油电量',templet:'#record_oil',width:'8%'},
                    {field: 'car_buy', title: '购买日期',templet:'#car_buy',width:'10%'},
                    {field: 'car_upkeep', title: '保养日期',templet:'<div>{{ layui.util.toDateString(d.car_upkeep * 1000,"yyyy-MM-dd") }}</div>',width:'10%'},
                    {field: 'car_status', title: '状态',templet:"#checkboxstatus",width:'8%'},
					{field: 'money', title: '总消耗',templet:"#money",width:'8%'},
                    {field: 'right', title: '操作',align:'center',toolbar:'#act',width:'12%'},
                ];
        return join;
    })
    //excel下载
   //layList.search('export',function(where){
    //    location.href=layList.U({c:'moduls.moduls_cars',a:'index',q:{
  //              car_name:where.car_name,
	//			car_no:where.car_name,
    //            excel:1
    //        }});
  //  })
    
    //启用禁用车辆
    layList.switch('status',function (odj,value) {
        if(odj.elem.checked==true){
            layList.baseGet(layList.Url({c:'moduls.moduls_cars',a:'set_show',p:{status:1,id:value}}),function (res) {
                layList.msg(res.msg);
            });
        }else{
            layList.baseGet(layList.Url({c:'moduls.moduls_cars',a:'set_show',p:{status:0,id:value}}),function (res) {
                layList.msg(res.msg);
            });
        }
    });
    //点击事件绑定
    layList.tool(function (event,data,obj) {
        switch (event) {
            case 'delstor':
                var url=layList.U({c:'goods.goods_list',a:'delete',q:{id:data.id}});
                if(data.status==4) var code = {title:"操作提示",text:"确定恢复产品操作吗？",type:'info',confirmButtonText:'是的，恢复该产品',cancelButtonText: "再考虑一下…",showCancelButton: true,confirmButtonColor: "#DD6B55"};
                else var code = {title:"操作提示",text:"确定将该产品移入回收站吗？",type:'info',confirmButtonText:'是的，移入回收站',cancelButtonText: "再考虑一下…",showCancelButton: true,confirmButtonColor: "#DD6B55"};
                requirejs(['sweetalert','axios'],function(swal,axios){
				swal(code).then(function(){
                    axios.get(url).then(function(res){
                        if(res.status == 200 && res.data.code == 200) {
                            swal('success',res.data.msg);
                            obj.del();
							layList.table.reload('#List');;
                        }else
                            return Promise.reject(res.data.msg || '删除失败')
                    }).catch(function(err){
                        swal('error',err);
                    });
                })
				})
                break;
            case 'open_image':
                layList.openImage(data.image);
                break;
        }
    })
    //排序
    layList.sort(function (obj) {
        var type = obj.type;
        switch (obj.field){
            case 'id':
                layList.reload({order: layList.order(type,'p.car_id')},true,null,obj);
                break;
        }
    });
    //查询
    layList.search('search',function(where){
        layList.reload(where);
    });
    //自定义方法
    var action={
        set_product:function(field,id,value){
            layList.baseGet(layList.Url({c:'moduls.moduls_cars',a:'set_car',q:{field:field,id:id,value:value}}),function (res) {
                layList.msg(res.msg);
            });
        },
        show:function(){
            var ids=layList.getCheckData().getIds('id');
            if(ids.length){
                layList.basePost(layList.Url({c:'moduls.moduls_cars',a:'car_show'}),{ids:ids},function (res) {
                    layList.msg(res.msg);
                    layList.reload();
                });
            }else{
                layList.msg('请选择要启用的车辆');
            }
        },
		updated:function(){
		   layui.use(['form'], function(){
		      form.render();
		   });
		}
    };
    //多选事件绑定
    $('.layui-btn-container').find('button').each(function () {
        var type=$(this).data('type');
        $(this).on('click',function(){
            action[type] && action[type]();
        })
    });
</script>


</body>
</html>