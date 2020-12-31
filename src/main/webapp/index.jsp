<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>
<%  pageContext.setAttribute("ctf",request.getContextPath()); %>
    <script type="text/javascript" src="${ctf}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${ctf}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctf}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 员工修改模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">修改员工</h4>
      </div>
      <div class="modal-body">
      
 <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_update_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static"  id="empName_update_text"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@gmail.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">

                            </select>
                        </div>
                    </div>
                </form>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update">更新</button>
      </div>
    </div>
  </div>
</div>

<!-- 员工新增模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增员工</h4>
      </div>
      <div class="modal-body">
      
 <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email@gmail.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">

                            </select>
                        </div>
                    </div>
                </form>


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save">保存</button>
      </div>
    </div>
  </div>
</div>

<div class="container">
	<!--    标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>SSM-CRUD</h1>
		</div>
	</div>
	
	<!-- 	按钮 -->
	<div class="row">
		<div class="col-md-4 col-md-offset-8">
			<button class="btn btn-primary" id="emp_add_btn">新增</button>
			<button  class="btn btn-danger" id="emp_delete_all_btn">删除</button>
		</div>
	</div>
	
	<!-- 	表格数据 -->
	<div class="row" class="col-md-12">
		<table class="table table-hover" id="emps_table">
			<thead>
			<tr>
				<th><input type="checkbox" id="check_all"/></th>
				<th>#</th>
				<th>empName</th>
				<th>gender</th>
				<th>email</th>
				<th>departName</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			
			</tbody>

		</table>
	</div>
	
	<!-- 	分页信息 -->
	<div class="row" >
		<div class="col-md-6" id="page_info_area"></div>
		<div class="col-md-6" id="page_nav_area">

		</div>
	</div>
</div>

<script type="text/javascript">
	
	var totalRecord,currentPage;
	$(function(){
		to_page(1);
	})
	//页面加载完成后，发送ajax请求，得到json分页数据
	function to_page(pn){
		$.ajax({
			url:"${ctf}/emps",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				build_emp_table(result);
				build_page_info(result);
				build_page_nav(result);
			}
			
		});
	}
	//1.装填分页表格数据
	function build_emp_table(result){
		
	     $("#emps_table tbody").empty();
	     
	     
		var emps=result.extend.pageInfo.list;
		
		$.each(emps,function(index,item){
			var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
			var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
            .append("编辑");
            editBtn.attr("edit-id",item.empId);
            
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
            .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
            .append("删除");
            delBtn.attr("del-id",item.empId);
            
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            
			$("<tr></tr>").append(checkBoxTd).append(empIdTd)
			.append(empNameTd)
            .append(genderTd)
            .append(emailTd)
            .append(deptNameTd)
            .append(btnTd)
            .appendTo("#emps_table tbody");;
		})
	}
	//2.装填分页信息
	function build_page_info(result){
		
		$("#page_info_area").empty();
		
		$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总"+result.extend.pageInfo.pages+"页，总"+result.extend.pageInfo.total+"条记录");
		
		totalRecord=result.extend.pageInfo.total;
		currentPage=result.extend.pageInfo.pageNum;
	}
	//3.装填分页条
	function build_page_nav(result){
		
		$("#page_nav_area").empty();
		var ul=$("<ul></ul>").addClass("pagination");
		var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
		//如果是首页，则将首页和上一页按钮禁用，否则激活
		if(!result.extend.pageInfo.hasPreviousPage){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}else{
			  firstPageLi.click(function () {
	                to_page(1);
	            });
	            prePageLi.click(function () {
	                to_page(result.extend.pageInfo.pageNum - 1);
	            });
		}
		ul.append(firstPageLi).append(prePageLi);
		
		var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
		//如果是末页，则将末页和下一页按钮禁用，否则激活
		        if (!result.extend.pageInfo.hasNextPage) {
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        };
		//遍历当前页的size页数并装填到分页条
		 $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
	            var numLi = $("<li></li>")
	                .append($("<a></a>").append(item));
	            if (result.extend.pageInfo.pageNum == item) {
	                numLi.addClass("active");
	            }
	            numLi.click(function () {
	                to_page(item)
	            });
	            ul.append(numLi);
	        });
		 
		 ul.append(nextPageLi).append(lastPageLi);
		 
		 var navEle = $("<nav></nav>").append(ul);
	        $("#page_nav_area").append(navEle);
	}
	//点击新增按钮
	$("#emp_add_btn").click(function(){
		
		 reset_form("#empAddModal form");
		//发送ajax请求获得部门信息
		 getDepts("#dept_add_select");
		
		
		//弹出模态框
			$("#empAddModal").modal({
				backdrop:"static"
			});
	})
	
	//获得下拉列表部门信息
	function getDepts(ele){
		$(ele).empty();
		$.ajax({
			url:"${ctf}/depts",
			type:"GET",
			success:function(result){
				$.each(result.extend.depts,function(){
					
					var eachOption= $("<option></option>").append(this.deptName).attr("value", this.deptId);
					$(ele).append(eachOption);
				});	
			}
		});	
	}
	//保存按钮单击事件
	$("#emp_save").click(function(){
		
		if(!validate_add_form()){
 			return false;
 		}
		
		  if ($(this).attr("ajax-va") == "error") {
 	            return false;
 	        }
		
		$.ajax({
			url:"${ctf}/emp",
			data:$("#empAddModal form").serialize(),
			type:"POST",
			success:function(result){
				
				if(result.code==100){
					$("#empAddModal").modal("hide");
					
					to_page(totalRecord);
				}else{
					if(undefined!=result.extend.errorFields.empName){
						show_validate_msg("#empName_add_input", "error",
								result.extend.errorFields.empName);
					}
					if(undefined!=result.extend.errorFields.email){
						show_validate_msg("#email_add_input", "error",
								result.extend.errorFields.email);
					}
				}
				
			}
			
			
		});
	})
	
	//前端校验
	function validate_add_form(){

        var empName = $("#empName_add_input").val();
        var regName = /(^[A-Za-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input", "error",
                "名字必须是2-5个中文或者6-16位英文数字组合");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "邮箱格式输入错误");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        return true; 
	}
	
	   function show_validate_msg(ele, status, msg) {
	        $(ele).parent().removeClass("has-success has-error");
	        $(ele).next("span").text("");
	        if ("success" == status) {
	            $(ele).parent().addClass("has-success");
	        } else if ("error" == status) {
	            $(ele).parent().addClass("has-error");
	        }
	        $(ele).next("span").text(msg);
	    }

	    $("#empName_add_input").change(function () {
	        var empName = this.value;
	        $.ajax({
	            url: "${ctf}/checkuser",
	            data: "empName=" + empName,
	            type: "POST", 
	            success: function (result) {
	                if (result.code == 100) {
	                    show_validate_msg("#empName_add_input", "success", "用户名可用");
	                    $("#emp_save").attr("ajax-va", "success");
	                } else {
	                    show_validate_msg("#empName_add_input", "error", result.extend.va_msg);
	                    $("#emp_save").attr("ajax-va", "error");
	                }
	            }
	        });
	    })
	   //重置表单
	       function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has_success");
        $(ele).find(".help-block").text("");
    }
	
	    
	    //单击编辑按钮，弹出员工修改模态框，并显示员工信息
	    $(document).on("click",".edit_btn",function(){
	    	reset_form("#empUpdateModal form");
	    	//查出员工信息
	    	getEmp($(this).attr("edit-id"));
	    	
	    	//查出部门信息
	    	getDepts("#dept_update_select");
	    	
	    	//弹出模态框
	    	$("#emp_update").attr("edit-id",$(this).attr("edit-id"));
	    	$("#empUpdateModal").modal({
				backdrop:"static"
			});
	    })
	    
	    function getEmp(id){
	    	$.ajax({
	    		url:"${ctf}/emp/"+id,
	    		type:"GET",
	    		success:function(result){
	    			var empData=result.extend.emp;
	    			$("#empName_update_text").text(empData.empName);
	    			$("#email_update_input").val(empData.email);
	    			$("#empUpdateModal input[name=gender]").val([empData.gender]);
	    			$("#empUpdateModal select").val([empData.dId]);
	    			
	    			
	    		}
	    		
	    	})
	    }
	    //点击更新按钮，保存修改后的员工数据
	    $("#emp_update").click(function(){
	    	
	    	
	    	//校验邮箱格式
	    	var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "邮箱格式输入错误");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }
	    	//发送ajax请求，保存修改后的员工
	    	
	    	
	    	$.ajax({
	    		url:"${ctf}/emp/"+$(this).attr("edit-id"),
	    		data:$("#empUpdateModal form").serialize(),
	    		type:"PUT",
	    		success:function(result){
	    			$("#empUpdateModal").modal("hide");
	    	    	to_page(currentPage);
	    		}
	    	})
	    	
	    	
	    	
	    })
	    
	    //点击删除按钮，发送删除请求
	      $(document).on("click",".delete_btn",function(){
	    	  var empName=$(this).parents("tr").find("td:eq(1)").text();
	    	  if(confirm("确认删除【"+empName+"】吗？")){
	    		  
	    		  $.ajax({
	    			  url:"${ctf}/emp/"+$(this).attr("del-id"),
	    			  type:"DELETE",
	    			  success:function(result){
	    				  to_page(currentPage);
	    			  }
	    		  })
	    	  }
	    	  
	      })
	    
	      //全选、全不选功能
	      $("#check_all").click(function(){
	    	  $(".check_item").prop("checked",$(this).prop("checked"))
	      })
	      
	      $(document).on("click",".check_item",function(){
	    	  var flag=$(".check_item:checked").length==$(".check_item").length;
	    	  $("#check_all").prop("checked",flag);
	      })
	      var empNames="";
	      var ids="";
	      $("#emp_delete_all_btn").click(function(){
	    	  $.each($(".check_item:checked"),function(){
	    		  empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
	    		  ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
	    	  })
	    	  empNames=empNames.substring(0,empNames.length-1);
	    	  ids=ids.substring(0,ids.length-1);
	    	  if(confirm("确认要删除【"+empNames+"】 吗？")){
	    		  $.ajax({
	    			  url:"${ctf}/emp/"+ids,
	    			  type:"DELETE",
	    			  success:function(result){
	    				  alert(result.msg);
	    				  to_page(currentPage);
	    			  }
	    		  })
	    	  }
	      })
	</script>
</body>
</html>