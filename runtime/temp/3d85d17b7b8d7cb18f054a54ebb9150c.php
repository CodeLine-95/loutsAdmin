<?php /*a:2:{s:78:"/www/wwwroot/pt.mbacms.com/application/admin/view/moduls/moduls_cars/list.html";i:1584236668;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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

<div class="layui-fluid">
    <div class="layui-row layui-col-space15"  id="app">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">搜索条件</div>
                <div class="layui-card-body">
                    <form class="layui-form layui-col-space8" id="ajaxForm" method="get" action="list">
						<div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="开始日" name="start" id="start"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input" autocomplete="off" placeholder="截止日" name="end" id="end"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <select name="is_finish">
                                <option value="">全部</option>
                                <option value="1">已完成</option>
                                <option value="0">未完成</option>
                            </select>
                        </div>
						<div class="layui-input-inline layui-show-xs-block">
						    <input type="text" name="title" placeholder="车辆名称/牌号" class="layui-input">
						</div>
                        <div class="layui-inline layui-show-xs-block">
                            <a class="layui-btn lotus-search-btn"  lay-filter="search">
                                <i class="layui-icon">&#xe615;</i>搜索</a>
                        </div>
                    </form>
					
                </div>
            </div>
        </div>
        <div class="record-box">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-header">车辆使用记录</div>
                    <div class="layui-card-body layadmin-homepage-list-imgtxt record-content">
                        <table id="lotus-table"  lay-data="{page:true,limits:[25,100],loading:true,toolbar:'#toolbarDemo',url:'RecordList',hash:''}"  class="layui-table layui-hide" >
                            <thead>
                            <tr>
								<th lay-data="{field: 'id', width:'4%'}">ID</th>
								<th lay-data="{field: 'car_no', templet:'#car_no',width:'8%'}">车牌号</th>
								<th lay-data="{field: 'record_reason',width:'25%'}">使用原由</th>
								<th lay-data="{field: 'record_time',templet:'<div>{{ layui.util.toDateString(d.record_time * 1000) }}</div>',width:'12%'}">用车时间</th>
								<th lay-data="{field: 'record_end_time',templet:'#endtime',width:'12%'}">还车时间</th>
								<th lay-data="{field: 'record_mileage',width:'6%'}">里程</th>
								<th lay-data="{field: 'record_oil',width:'6%'}">油电量</th>
								<th lay-data="{field: 'member_name',width:'6%'}">用车人</th>
								<!--th lay-data="{field: 'record_money',templet:'#moneystatus',width:'6%'}">收款</th>
								<th lay-data="{field: 'record_money',templet:'#money1status',width:'6%'}">付款</th-->
								<th lay-data="{field: 'record_finish',templet:'#finish',width:'6%'}">完成</th>
                            </tr>
                            </thead>
                        </table>
						<script type="text/html" id="car_no">
						    <p>
							{{# if(d.car_type==1){ }}
								<button class="btn btn-xs btn-primary">{{d.car_no}}</button>
							{{# }else if(d.car_type==2){ }}
								<button class="btn btn-xs btn-warning">{{d.car_no}}</button>
							{{# }else if(d.car_type==3){ }}
								<button class="btn btn-xs btn-success" style="background:green">{{d.car_no}}</button>
							{{# } }}
							</p>
						</script>
						<script type="text/html" id="moneystatus">
							<p>
							{{# if(d.record_type==0){ }}
								0
							{{# }else{ }}
								{{d.record_money}}
							{{# } }}
							</p>
						</script>
						<script type="text/html" id="endtime">
							{{# if(d.record_end_time>0){ }}
							<div>{{ layui.util.toDateString(d.record_end_time * 1000) }}</div>
							{{# } }}
						</script>
						<script type="text/html" id="money1status">
							<p>
							{{# if(d.record_type==0){ }}
								{{d.record_money}}
							{{# }else{ }}
								0
							{{# } }}
							</p>
						</script>
						<script type="text/html" id="finish">
						    <p>
							{{# if(d.record_finish==1){ }}
								<button class="btn btn-xs btn-success">完成</button>
							{{# }else{ }}
								<button class="btn btn-xs btn-warning">未完成</button>
							{{# } }}
							</p>
						</script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	$('.lotus-search-btn').on('click',function () {
	    var where = {
			start:$('input[name=start]').val(),
			end:$('input[name=end]').val(),
	        title:$('input[name=title]').val(),
			is_finish:$('select[name=is_finish]').val()
	    };
	    lotus.table(where);
	})
</script>


</body>
</html>