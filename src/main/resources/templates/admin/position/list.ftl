<!--职位列表ftl-->
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
        	职位状态查询：
	  		<select id="search-state" name="search-state" class="easyui-combobox" panelHeight="auto" data-options="editable:false" style="width:150px">
	                <option value="0">请选择</option>
	    			<option value="1">有效</option>
	    			<option value="2">待审核</option>
	    			<option value="3">已下线</option>
	        </select>
	         <a href="javascript:void(0);" id="search-btn" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>&nbsp;&nbsp;
	         <a href="javascript:void(0);" id="update-state-btn" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="changeState();">更改职位状态</a>
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
                <td width="60" align="right">职位类别:</td>
                <td><input type="text" id="edit-type" name="type"  readonly="readonly" class="wu-text " /></td>
            </tr>
            <tr>
                <td width="60" align="right">职位名称:</td>
                <td><input type="text" id="edit-name" name="name"  readonly="readonly" class="wu-text " /></td>
            </tr>
            <tr>
                <td width="60" align="right">职位状态:</td>
                <td>
                	<select id="edit-state" name="state" class="easyui-combobox" data-options="editable:false" panelHeight="auto" style="width:268px">
		    			 <option value="effective">有效</option>
		    			 <option value="wait">待审核</option>
		    			 <option value="out">已下线</option>
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
            	$("#edit-type").val(item.type);
            	$("#edit-name").val(item.name);
            }
        });
	}	
	
	
	//执行改变职位状态操作
	function change(){
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'/admin/position/change_state',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.code == 0){
					$.messager.alert('信息提示','改变职位状态成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
				$("#data-datagrid").datagrid('clearSelections');
			}
		});
	}

	
	//搜索按钮监听
	$("#search-btn").click(function(){
	    var search_value = $('#search-state').combobox('getValues');
	    var state = "";
	    if(search_value == "1"){
			state = "effective";
		}
		if(search_value == "2"){
			state = "wait";
		}
		if(search_value == "3"){
			state = "out";
		}
		$('#data-datagrid').datagrid('reload',{
			state:state
		});
		$("#data-datagrid").datagrid('clearSelections');
	});
	
	
	
	//载入数据
	$('#data-datagrid').datagrid({
		url:'/admin/position/list',
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

			{ field:'company.name',title:'公司名称',width:150,formatter:function(value,row,index){
				return row.company.name;
			}},
			{ field:'name',title:'职位名称',width:100},
			{ field:'type',title:'职位类别',width:100},
			{ field:'workType',title:'工作性质',width:50},
			{ field:'address',title:'工作地址',width:230},
			{ field:'degree',title:'学历要求',width:50},
			{ field:'minMoney',title:'职位薪资',width:60,formatter:function(value,row,index){
				var money_range = "";
				money_range += row.minMoney;
				money_range += "k-";
				money_range += row.maxMoney;
				money_range += "k";
				return money_range;
			}},
			{ field:'state',title:'职位状态',width:50,formatter:function(value,row,index){
				if(value == 'wait'){
					return '待审核';
				}
				if(value == 'out'){
					return '已下线';
				}
				if(value == 'effective'){
					return '有效';
				}
				return value;
			}},
			{ field:'updateTime',title:'职位上一次更新时间',width:100}
		]]
	});
</script>