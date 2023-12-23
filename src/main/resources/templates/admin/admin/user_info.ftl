<!--用户管理ftl-->
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

</div>
<#include "../common/footer.ftl"/>
<!-- End of easyui-dialog -->
<script type="text/javascript">
	
	//删除用户
	function remove(){
		var item = $('#data-datagrid').datagrid('getSelections');
		if(item == null || item.length != 1){
			$.messager.alert('信息提示','请选择一条您要删除的用户数据！','info');
			return;
		}
		$.messager.confirm('信息提示','确定要删除该用户吗？如果删除，有关该用户所有信息将被删除！', function(result){
			if(result){
				$.ajax({
					url:'/admin/user/delete',
					dataType:'json',
					type:'post',
					data:{id:item[0].id},
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
	
	
	
	
	//载入数据
	$('#data-datagrid').datagrid({
		url:'/admin/user/user_info_list',
		rownumbers:true,
		singleSelect:false,
		pageSize:10,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    fit:true,
		columns:[[
			{ field:'chk',checkbox:true},

			{ field:'username',title:'用户名',width:100,sortable:true},
			{ field:'email',title:'邮箱',width:100},
			{ field:'password',title:'密码',width:100},
			{ field:'sex',title:'性别',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '未知';
					}
					case 1:{
						return '男';
					}
					case 2:{
						return '女';
					}
				}
				return value;
			}},
			{ field:'type',title:'用户身份',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '应聘者';
					}
					case 1:{
						return '招聘者';
					}
				
				}
				return value;
			}},
			{ field:'mobile',title:'手机号',width:100},
			{ field:'updateTime',title:'上一次用户更新时间',width:100}
		]]
	});
</script>