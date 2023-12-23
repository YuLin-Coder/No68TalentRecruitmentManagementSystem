<!--我的信息ftl-->
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
		   <a href="javascript:void(0);"  class="easyui-linkbutton" iconCls="icon-edit" onclick="openEdit();" plain="true">修改</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>


            <tr>
                <td width="60" align="right">用户名:</td>
                <td><input type="text" id="edit-adminName" name="adminName" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写用户名'" /></td>
            </tr>
              <tr>
                <td width="60" align="right">密码:</td>
                <td><input type="text" id="edit-password" name="password" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写密码'" /></td>
            </tr>
           
            <tr>
                <td width="60" align="right">性别:</td>
                <td>
                	<select id="edit-sex" name="sex" class="easyui-combobox" panelHeight="auto" style="width:268px" data-options="editable:false">
		                <option value="0">未知</option>
            			<option value="1">男</option>
            			<option value="2">女</option>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">手机号:</td>
                <td><input type="text" id="edit-mobile" name="mobile" class="wu-text easyui-validatebox" /></td>
            </tr>
            <tr>
                <td width="60" align="right">邮箱:</td>
                <td><input type="text" id="edit-email" name="email" class="wu-text easyui-validatebox" /></td>
            </tr>
        </table>
    </form>
</div>
<div id="process-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-upload',title:'正在上传图片'" style="width:450px; padding:10px;">
<div id="p" class="easyui-progressbar" style="width:400px;" data-options="text:'正在上传中...'"></div>
</div>
<input type="file" id="photo-file" style="display:none;" onchange="upload()">
<#include "../common/footer.ftl"/>

<!-- End of easyui-dialog -->
<script type="text/javascript">
	//进度条
	function start(){
			var value = $('#p').progressbar('getValue');
			if (value < 100){
				value += Math.floor(Math.random() * 10);
				$('#p').progressbar('setValue', value);
			}else{
				$('#p').progressbar('setValue',0)
			}
	};
	//上传图片
	function upload(){
		if($("#photo-file").val() == '')return;
		//new FormData():异步上传二进制文件。
		var formData = new FormData();
		//取出所选图片中的第一张
		formData.append('photo',document.getElementById('photo-file').files[0]);
		//进度条会话框打开
		$("#process-dialog").dialog('open');
		//每隔0.2s执行一次start方法
		var interval = setInterval(start,200);
		$.ajax({
			url:'/upload/upload_photo',
			type:'post',
			data:formData,
			//用ajax上传文件时候，必须设置contentType:false,processData:false
			contentType:false,
			processData:false,
			success:function(data){
				//上传完把定时器清除
				clearInterval(interval);
				//进度条会话框关闭
				$("#process-dialog").dialog('close');
				if(data.code == 0){
					$("#edit-preview-photo").attr('src','/photo/view?filename=' + data.data);
					$("#edit-photo").val(data.data);
				}else{
					$.messager.alert("消息提醒",data.msg,"warning");
				}
			},
			error:function(data){
				clearInterval(interval);
				$("#process-dialog").dialog('close');
				$.messager.alert("消息提醒","上传失败!请上传正确格式或者大小的文件！","warning");
			}
		});
	}
	
	function uploadPhoto(){
		$("#photo-file").click();
		
	}
	
	
	
	//修改记录
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'/admin/admin/edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.code == 0){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	
	

	
	/**
	* 打开修改窗口
	*/
	function openEdit(){
		//$('#edit-form').form('clear');
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
            title: "修改管理员信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#edit-id").val(item.id);
            	$("#edit-preview-photo").attr('src','/photo/view?filename='+item.headPic);
				$("#edit-photo").val(item.headPic);
            	$("#edit-adminName").val(item.adminName);
            	$("#edit-password").val(item.password);
            	$("#edit-sex").combobox('setValue',item.sex);
            	$("#edit-mobile").val(item.mobile);
            	$("#edit-email").val(item.email);
            }
        });
	}	
	
	
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'/admin/admin/my_info_list',
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

			{ field:'adminName',title:'用户名',width:100,sortable:true},
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
			{ field:'mobile',title:'手机号',width:100},
			{ field:'email',title:'邮箱',width:100}
		]]
	});
</script>