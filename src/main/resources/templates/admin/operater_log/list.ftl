<!--操作日志ftl-->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="All Rights Reserved, Copyright (C) 2020, 杨杨吖, Ltd." />
<title>后台管理主页</title>
<link rel="stylesheet" type="text/css" href="/admin/easyui/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="/admin/easyui/css/wu.css" />
<link rel="stylesheet" type="text/css" href="/admin/easyui/css/icon.css" />
<script type="text/javascript" src="/admin/easyui/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/admin/easyui/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/admin/easyui/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<style>

.dialog-button { padding: 5px; text-align: center; };
</style>

<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
		    <a href="javascript:void(0);"  class="easyui-linkbutton" iconCls="icon-cross" onclick="remove();" plain="true">删除</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<#include "../common/footer.ftl"/>
<!-- End of easyui-dialog -->
<script type="text/javascript">

	//删除操作日志
	function remove(){
		var item = $('#data-datagrid').datagrid('getSelections');
		if(item == null || item.length <= 0){
			$.messager.alert('信息提示','请至少选择一条您要删除的操作日志数据！','info');
			return;
		}
		$.messager.confirm('信息提示','确定要删除这些记录？', function(result){
			if(result){
			var ids = "";
			for(var i=0;i<item.length;i++)
			{
				ids += item[i].id;
				ids += ",";
			}
			ids = ids.substring(0,ids.length-1);
			$.ajax({
					url:'/admin/operater_log/delete',
					dataType:'json',
					type:'post',
					data:{ids:ids},
					success:function(data){
						if(data.code == 0){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
						$("#data-datagrid").datagrid('clearSelections');
					}
				});
				
			}	
		});
	}
	



	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'/admin/operater_log/list',
		rownumbers:true,
		singleSelect:false,
		pageSize:30,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'operator',title:'操作者',width:100},
			{ field:'content',title:'操作内容',width:300},
			{ field:'createTime',title:'操作时间',width:100}
		]]
	});
</script>