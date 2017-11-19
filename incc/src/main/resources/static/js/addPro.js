﻿var table;
		
		$(document).ready(function() {	
			
			$('.date-picker').datepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
    })
	
	$('#proFile').fileinput({
        language: 'zh', //设置语言
        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀,
        maxFileCount: 1,
        enctype: 'multipart/form-data',
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式             
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>", 
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
    });
	
	$('#insFile').fileinput({
        language: 'zh', //设置语言
        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀,
        maxFileCount: 1,
        enctype: 'multipart/form-data',
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式             
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>", 
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
    });
	
	function isNil(item){
		return item ==""||item==undefined||item==null;
	}
	
	$("#applyBtn").click(function(){
		var form = $('#addform')[0];
		var data = new FormData(form);
		
		var proName = $("#proName").val();
		var type = $("#type").val();
		var productstartDt = $("#productstartDt").val();
		var proFile = $("#proFile").val();
		var approvalInfoName = $("#approvalInfoName").val();
		var approvalInfoDtTerm = $("#approvalInfoDtTerm").val();
		var approvalInfoAuditNum = $("#approvalInfoAuditNum").val();
		var approvalInfoApprovOrg = $("#approvalInfoApprovOrg").val();
		var insFile = $("#insFile").val();
		var managementName = $("#managementName").val();
		var managementCreditCode = $("#managementCreditCode").val();
		var managementPermit = $("#managementPermit").val();
		var managementStartDt = $("#managementStartDt").val();
		var managementEndDt = $("#managementEndDt").val();
		var brandName = $("#brandName").val();
		var brandStatus = $("#brandStatus").val();
		var brandNum = $("#brandNum").val();
		var brandAuthor = $("#brandAuthor").val();
		var producerName = $("#producerName").val();
		var producerCreditCode = $("#producerCreditCode").val();
		var producerPermit = $("#producerPermit").val();
		var producerStartDt = $("#producerStartDt").val();
		var producerEndDt = $("#producerEndDt").val();
		if (isNil(proName)) {
			return layer.msg('请填写商品名称', function() {
				//关闭后的操作
			});
		}
		if(isNil(type) ){
			return layer.msg('请填写商品类型', function() {
				//关闭后的操作
			});
		}
		if(isNil(productstartDt) ){
			return layer.msg('请填写商品有效期', function() {
				//关闭后的操作
			});
		}
		if(isNil(proFile)){
			return layer.msg('请上传产品图片', function() {
				//关闭后的操作
			});
		}
		
		if(isNil(approvalInfoName) || isNil(approvalInfoDtTerm) ||
				isNil(approvalInfoAuditNum)||isNil(approvalInfoApprovOrg)){
			return layer.msg('审批信息填写不完整', function() {
				//关闭后的操作
			});
		}
		if(isNil(insFile)){
			return layer.msg('请上传检测报告', function() {
				//关闭后的操作
			});
		}
		if(isNil(managementName)||isNil(managementCreditCode)||isNil(managementPermit)||isNil(managementStartDt)||
				isNil(managementEndDt)){
			return layer.msg('经营主体填写不完整', function() {
				//关闭后的操作
			});
		}
		
		if(isNil(brandName)||isNil(brandStatus)||isNil(brandNum)||isNil(brandAuthor)){
			return layer.msg('品牌信息填写不完整', function() {
				//关闭后的操作
			});
		}
		
		if(isNil(producerName)||isNil(producerCreditCode)||isNil(producerPermit)|isNil(producerStartDt)||isNil(producerEndDt)){
			return layer.msg('生产主体填写不完整', function() {
				//关闭后的操作
			});
		}
		
		$("#applyBtn").attr("disabled",true); 
		$("#query_hint").css('display','block');
		
		$.ajax({
			cache : false,
			enctype : "multipart/form-data",
			type : "POST",
			url : 'product/save',
			data : data,// 
			processData : false,
			contentType : false,
			success : function(data) {
				if (data == "success") {
					layer.msg('保存成功');
					$("#content").load("productPage");
				} else if (data = "error") {
					layer.msg('申请失败，请联系管理员.');
				} else {

				}
			}
		});
	});

});