var table;
		
		$(document).ready(function() {			
			$('.date-picker').datepicker({
        language: 'zh-CN',
        autoclose: true,
        todayHighlight: true
    });
	
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
	
	$('#approvalFile').fileinput({
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
	
	$('#manageFile').fileinput({
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
	
	var hasNoCom = true;
	
	$("#applyBtn").click(function(){
		var form = $('#addform')[0];
		var data = new FormData(form);
		
		var proName = $("#proName").val();
		var type = $("#type").val();

		var proFile = $("#proFile").val();

		var approvalFile = $("#approvalFile").val();
		var approvalInfoName = $("#approvalInfoName").val();
		var manageFile = $("#manageFile").val();
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

		if(isNil(proFile)){
			return layer.msg('请上传产品图片', function() {
				//关闭后的操作
			});
		}
		
		if(isNil(approvalFile) && hasNoCom){
			return layer.msg('请上传销售许可扫描件', function() {
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
		
		if(isNil(manageFile)  && hasNoCom){
			return layer.msg('请上传营业执照', function() {
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
	
	var brands =[];
	$.ajax({
        type: "GET",
        url: 'brand/brands',
        cache : false,  //禁用缓存
        dataType: "json",
        success: function(result) {
        	brands = result;
        	var optionstring = "";
            for (var j = 0; j < result.length; j++) {
                optionstring += "<option value=\"" + result[j].id + "\" >" + result[j].name + "</option>";
            }
            $("#brandSel").html("<option value='0'>请选择...</option> "+optionstring);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("查询失败");
        }
    });
	
	$("#brandSel").on("change",function(e){
		var s = _.find(brands,['id',_.toNumber($("#brandSel").val())]);
		$("#brandName").val(s.name);
		$("#brandStatus").val(s.status);
		$("#brandNum").val(s.num);
		$("#brandAuthor").val(s.author);
	});
	
	
	var producers =[];
	$.ajax({
        type: "GET",
        url: 'producer/producers',
        cache : false,  //禁用缓存
        dataType: "json",
        success: function(result) {
        	producers = result;
        	var optionstring = "";
            for (var j = 0; j < result.length; j++) {
                optionstring += "<option value=\"" + result[j].id + "\" >" + result[j].name + "</option>";
            }
            $("#producerSel").html("<option value='0'>请选择...</option> "+optionstring);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("查询失败");
        }
    });
	
	$("#producerSel").on("change",function(e){
		var s = _.find(producers,['id',_.toNumber($("#producerSel").val())]);
		$("#producerName").val(s.name);
		$("#producerCreditCode").val(s.creditCode);
		$("#producerStartDt").val(s.startDt);
		$("#producerEndDt").val(s.endDt);
		$("#producerPermit").val(s.permit);
	});
	
	
	var managements =[];
	$.ajax({
        type: "GET",
        url: 'management/managements',
        cache : false,  //禁用缓存
        dataType: "json",
        success: function(result) {
        	managements = result;
        	var optionstring = "";
            for (var j = 0; j < result.length; j++) {
                optionstring += "<option value=\"" + result[j].id + "\" >" + result[j].name + "</option>";
            }
            if(managements.length>0){
            	hasNoCom = false;
                $("#managementSel").html(optionstring);
                $("#managementSel").attr("readonly",true);
                var data = managements[0];
                $("#managementSel").val(data.id);
                $("#managementName").val(data.name).attr("disabled","disabled");
        		$("#managementCreditCode").val(data.creditCode).attr("disabled","disabled");
        		$("#managementStartDt").val(data.startDt).attr("disabled","disabled");
        		$("#managementEndDt").val(data.endDt).attr("disabled","disabled");
        		$("#managementPermit").val(data.permit).attr("disabled","disabled");
        		$(".tr_manageFile").css("display","none");
            }

        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("查询失败2");
        }
    });
	
	$.ajax({
        type: "GET",
        url: 'management/approvalInfo',
        cache : false,  //禁用缓存
        dataType: "json",
        success: function(data) {	
            if(!_.isNil(data) && !_.isNil(data.id)){
            	$("#approvalInfoId").val(data.id);
              $("#approvalInfoName").val(data.name).attr("disabled","disabled");
        		$("#approvalInfoAuditNum").val(data.auditNum).attr("disabled","disabled");
        		$("#approvalInfoDtTerm").val(data.dtTerm).attr("disabled","disabled");
        		$("#approvalInfoApprovOrg").val(data.approvOrg).attr("disabled","disabled");
        		$(".tr_file").css("display","none");
            }

        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("查询失败");
        }
    });
	
	
	var inslength=1;
	$("#addInsBtn").on("click",function(e){
	    $("#ins_table").append('<tr id="ins_tr_'+inslength+'">'
	               +'<td width="32%" height="38" class="td_gray01"><input type="text" name="inspectionInfos['+inslength+'].content"></td>'
	               +'<td width="45%" height="38" class="td_gray01"><input type="text" name="inspectionInfos['+inslength+'].inspOrg"></td>'
	               +'<td width="13%" height="38" class="td_gray01"><input type="text" name="inspectionInfos['+inslength+'].result"></td>'
	               +'<td width="10%" height="38" class="td_gray01"><input type="button" value="删除" class="deleteBtn" ></td>'
	         +'</tr>');
	    inslength++;
	});
	$("#ins_table").on('click',".deleteBtn",function(){
		$(this).parent().parent().remove();
	    inslength--;
	    });
});