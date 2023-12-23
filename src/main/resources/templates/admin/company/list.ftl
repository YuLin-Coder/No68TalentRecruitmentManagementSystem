<!--公司列表ftl-->
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
        	公司状态查询：
	  		<select id="search-state" name="search-state" class="easyui-combobox" panelHeight="auto" data-options="editable:false" style="width:150px">
	                <option value="0">请选择</option>
	    			<option value="1">已认证</option>
	    			<option value="2">待审核</option>
	    			<option value="3">未认证</option>
	        </select>
	         <a href="javascript:void(0);" id="search-btn" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>&nbsp;&nbsp;
	         <a href="javascript:void(0);" id="update-state-btn" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="changeState();">更改职位状态</a>&nbsp;&nbsp;
	         <a href="javascript:void(0);"  class="easyui-linkbutton" iconCls="icon-cross" onclick="remove();" plain="true">删除</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
            <tr>
                <td width="60" align="right">公司名称:</td>
                <td><input type="text" id="edit-name" name="name"  readonly="readonly" class="wu-text " /></td>
            </tr>
            <tr>
                <td width="60" align="right">公司状态:</td>
                <td>
                	<select id="edit-state" name="state" class="easyui-combobox" data-options="editable:false" panelHeight="auto" style="width:268px">
			    		  <option value="已认证">已认证</option>
			    		  <option value="待审核">待审核</option>
			    		  <option value="未认证">未认证</option>
		            </select>
                </td>
            </tr>
        </table>
    </form>
</div>
<#include "../common/footer.ftl"/>
<!-- End of easyui-dialog -->
<script type="text/javascript">

	//打开改变职位状态窗口
	function changeState(){
		var item = $('#data-datagrid').datagrid('getSelections');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要修改的数据！','info');
			return;
		}
		if(item.length > 1){
			$.messager.alert('信息提示','请选择一条数据进行修改！','info');
			return;
		}
		item = item[0];
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "改变职位状态",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: change
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
           		$("#edit-id").val(item.id);
            	$("#edit-state").combobox('setValue',item.state);
            	$("#edit-name").val(item.name);
            }
        });
	}	
	
	
	//删除公司
	function remove(){
		var item = $('#data-datagrid').datagrid('getSelections');
		if(item == null || item.length != 1){
			$.messager.alert('信息提示','请选择一条您要删除的公司数据！','info');
			return;
		}
		$.messager.confirm('信息提示','确定要删除该公司吗？如果删除，有关该公司所有信息将被删除！', function(result){
			if(result){
				$.ajax({
					url:'/admin/company/delete',
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
	
	
	
	//执行改变职位状态操作
	function change(){
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'/admin/company/change_state',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.code == 0){
					$.messager.alert('信息提示','改变公司状态成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}

	
	//搜索按钮监听
	$("#search-btn").click(function(){
	    var search_value = $('#search-state').combobox('getValues');
	    var state = "";
	    if(search_value == "1"){
			state = "已认证";
		}
		if(search_value == "2"){
			state = "待审核";
		}
		if(search_value == "3"){
			state = "未认证";
		}
		$('#data-datagrid').datagrid('reload',{
			state:state
		});
		$("#data-datagrid").datagrid('clearSelections');
	});
	
	
	
	//载入数据
	$('#data-datagrid').datagrid({
		url:'/admin/company/list',
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

			{ field:'name',title:'公司名称',width:150},
			{ field:'locale',title:'公司地点',width:150},
			{ field:'territory',title:'公司领域',width:100},
			{ field:'scale',title:'公司规模',width:50},
			{ field:'finance',title:'融资阶段',width:50},
			{ field:'founderName',title:'创始人姓名',width:50},

			{ field:'state',title:'公司状态',width:60},
			{ field:'updateTime',title:'公司上一次更新时间',width:100}
		]]
	});
</script>