<?php /*a:2:{s:70:"/www/wwwroot/pt.mbacms.com/application/admin/view/estate/car/show.html";i:1587524810;s:64:"/www/wwwroot/pt.mbacms.com/application/admin/view/pub/modal.html";i:1580923564;}*/ ?>
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

<style type="text/css" media="all">
	.layui-image{
		display: inline-block;
	    width: 58px;
	    height: 58px;
	    text-align: center;
	    line-height: 58px;
	    border: 1px solid #c0ccda;
	    border-radius: 4px;
	    overflow: hidden;
	    background: #fff;
	    position: relative;
	    box-shadow: 2px 2px 5px rgba(0,0,0,.1);
	    margin-right: 4px;
	    box-sizing: border-box;
	}
	.layui-image img{
	    height: 100%;
	    display: inline-block;
	    vertical-align: top;
	}
	
	.fc-files {
	    display: inline-block;
	    width: 58px;
	    height: 58px;
	    cursor: pointer;
	    text-align: center;
	    line-height: 58px;
	    border: 1px dashed #c0ccda;
	    border-radius: 4px;
	    overflow: hidden;
	    background: #fff;
	    position: relative;
	    box-shadow: 2px 2px 5px rgba(0,0,0,.1);
	    margin-right: 4px;
	    box-sizing: border-box;
	}
	.ivu-icon {
	    display: inline-block;
	    font-family: Ionicons;
	    speak: none;
	    font-style: normal;
	    font-weight: 400;
	    font-variant: normal;
	    text-transform: none;
	    text-rendering: auto;
	    line-height: 1;
	    -webkit-font-smoothing: antialiased;
	    -moz-osx-font-smoothing: grayscale;
	}
	.layui-input-block,.layui-input-inline{
		line-height: 36px;
	    background-color: #FBFBFB;
	    border-width: 1px;
	    border-style: solid;
	    border-radius: 2px 0 0 2px;
	    border-color: #e6e6e6;
	    padding: 0 15px;
	}
	
	#img{
		height: 58px;
		line-height: 58px;
	    background-color: #FBFBFB;
	    border-width: 1px;
	    border-style: solid;
	    border-radius: 2px 0 0 2px;
	    border-color: #e6e6e6;
	    padding: 15px;
	}
</style>
<div class="layui-fluid lotus-form">
    <div class="layui-row">
        <form class="layui-form layui-form-pane" id="lotus-edit-form" action="edit" method="post">
        	<input type="hidden" name="id" value="<?php echo htmlentities($field['id']); ?>" />

            <div class="layui-form-item">
                <label class="layui-form-label">所在单位</label>
                <div class="layui-input-block">
                    <?php foreach($enter as $e): if($field['enter_id'] == $e['id']): ?> <?php echo htmlentities($e['enter_name']); ?> <?php endif; ?>
	                <?php endforeach; ?>
                </div>
            </div> 
            
            <hr>
            
            <div class="layui-form-item">
            	<div class="layui-col-md6">
	            	<label class="layui-form-label">车位号</label>
	                <div class="layui-input-inline">
	                    <?php echo htmlentities($field['car_parking']); ?>
	                </div>
            	</div>
            	<div class="layui-col-md6">
	                <label class="layui-form-label">车牌号</label>
	                <div class="layui-input-inline">
	                    <?php echo htmlentities($field['car_no']); ?> 
	                </div>
                </div>
            </div>
           
            <div class="layui-form-item">
            	<div class="layui-col-md6">
	            	<label class="layui-form-label">车辆名称</label>
	                <div class="layui-input-inline">
	                    <?php echo htmlentities($field['car_name']); ?>
	                </div>
            	</div>
            	<div class="layui-col-md6">
	                <label class="layui-form-label">车辆类型</label>
	                <div class="layui-input-inline">
	                	<?php if($field['car_type'] == 1): ?> 蓝色车牌 <?php endif; if($field['car_type'] == 2): ?> 黄色车牌 <?php endif; if($field['car_type'] == 3): ?> 绿色车牌 <?php endif; ?>
	                </div>
                </div>
            </div>
            
            <div class="layui-form-item">
        		<div class="layui-col-md6">
        			<label class="layui-form-label">车主名称</label>
	                <div class="layui-input-inline">
	                    <?php echo htmlentities($field['car_username']); ?>
	                </div>
        		</div>
        		<div class="layui-col-md6">
        			<label class="layui-form-label">联系电话</label>
	                <div class="layui-input-inline">
	                    <?php echo htmlentities($field['car_tel']); ?>
	                </div>
        		</div>
            </div>
            
            <div class="layui-form-item">
        		<div class="layui-col-md6">
        			<label class="layui-form-label">登记时间</label>
	                <div class="layui-input-inline">
	                    <?php echo htmlentities($field['car_start_time']); ?>
	                </div>
        		</div>
        		<div class="layui-col-md6">
        			<label class="layui-form-label">到期时间</label>
	                <div class="layui-input-inline">
	                    <?php echo htmlentities($field['car_end_time']); ?>
	                </div>
        		</div>
            </div>
            
            <hr>
            
            <div class="layui-form-item">
                <label class="layui-form-label">车辆图片</label>
                <div class="layui-input-block" id="img">
                    <!--<div class="fc-files" style="float:left;" onclick="xadmin.open('添加车辆','/admin/widget.images/index/fodder/image.html',600,400)">-->
                    <!--	<i class="layui-icon layui-icon-picture ivu-icon" style="font-size: 20px;"></i>-->
                    <!--</div>-->
                    <div style="float:left;">
                    	<?php if(!empty($field['car_pic'])): foreach($field['car_pic'] as $c): ?>
		                	<div class="layui-image">
		                		<img src="<?php echo htmlentities($c); ?>" alt="<?php echo htmlentities($c); ?>" />
		                		<!--<input type="hidden" name="car_pic[]" value="<?php echo htmlentities($c); ?>" />-->
		                	</div>
		                	<?php endforeach; ?>
	                	<?php endif; ?>
	                </div>
                </div>
            </div>
            
            <!--<div class="layui-form-item" style="text-align:center;">-->
            <!--    <button id="reset" type="reset" class="layui-btn layui-btn-primary">返回</button>-->
            <!--</div>-->
        </form>
    </div>
</div>
<script type="text/javascript" charset="utf-8">
	// function changeIMG(obj,src){
	// 	$img_str = '<div class="layui-image"><img src="'+src+'" alt="'+src+'" /><input type="hidden" name="car_pic[]" value="'+src+'" /></div>';
	// 	layui.use(['jquery'], function(){
	// 	   	var $ = layui.jquery;
	// 	   	$('#img').append($img_str);
	//     })
		
	// }
</script>


</body>
</html>