<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="modal-demo" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">&times;
            </button>
            <div class="modal-header">
                <h3 class="modal-title">修改代理商员工</h3>
            </div>
            <form class="form-horizontal" role="form">
                <div class="modal-body">
                    <div class="page-content">
                        <div class="page-content-area">
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- PAGE CONTENT BEGINS -->

                                    <!-- #section:elements.form -->
                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="agentsStaffId">
                                            代理商员工联系人编号：</label>
                                        <div class="col-lg-9 col-sm-9">
                                            <input readonly="" type="text" id="agentsStaffId" placeholder="输入代理商员工联系人编号"
                                                value="${agencystaff.agentsStaffId}"   class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="agentStaffaddress">代理商员工联系地址： </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="agentStaffaddress" placeholder="输入代理商员工联系地址"
                                                   value="${agencystaff.agentStaffaddress}"  class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">代理商员工联系人性别: </label>
                                        <div class="col-sm-9">
                                            <div>
                                                <label class="line-height-1 blue">
                                                    <input name="agentStaffsex" id="form-field-1-1-1" value="0"
                                                           type="radio" class="ace" <c:if test="${agencystaff.agentStaffsex==0}">checked</c:if>  />
                                                    <span class="lbl"> 男</span>
                                                </label>
                                                <label class="line-height-1 blue">
                                                    <input name="agentStaffsex" value="1" type="radio" class="ace" <c:if test="${agencystaff.agentStaffsex==1}">checked</c:if>/>
                                                    <span class="lbl"> 女</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /section:elements.form -->

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                               for="agentStaffphone">代理商员工联系电话:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="input-group">
 																	<span class="input-group-addon">
 																		<i class="ace-icon fa fa-phone"></i>
 																	</span>
                                                <input type="tel" id="agentStaffphone" name="phone" value="${agencystaff.agentStaffphone}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                               for="agentStaffemail">代理商员工邮箱:</label>

                                        <div class="col-xs-12 col-sm-9">
                                            <div class="clearfix">
                                                <input type="email" name="email" id="agentStaffemail"
                                                       class="col-xs-12 col-sm-6" value="${agencystaff.agentStaffemail}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="agentStaffQq">QQ： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="agentStaffQq" placeholder="输入QQ"
                                                   class="col-xs-10 col-sm-5" value="${agencystaff.agentStaffQq}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="agentStaffName">代理商员工联络人： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="agentStaffName" placeholder="输入代理商员工联络人"
                                                   class="col-xs-10 col-sm-5" value="${agencystaff.agentStaffName}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="agentStaffMessage">代理商员工其它信息：</label>
                                        <div class="col-sm-9">
                                            <div class="pos-rel">
                                                 <textarea class="form-control limited autosize-transition"
                                                           id="agentStaffMessage" maxlength="50">${agencystaff.agentStaffMessage}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /.col -->
                            </div><!-- /.row -->
                        </div><!-- /.page-content-area -->
                    </div><!-- /.page-content -->
                </div>
                <div class="modal-footer">
                    <button class="btn btn-info" type="button" onclick="upate()">
                        <i class="ace-icon fa fa-check bigger-110"></i>
                        提交
                    </button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    var container=$("#modal-demo");
    function upate() {
        $.ajax({
            url: "updateAgencystaff.do",
            data: {
                id:${agencystaff.id},
                agentStaffaddress:$("#agentStaffaddress").val(),
                agentStaffsex:$("[name='agentStaffsex']:checked").val(),
                agentStaffphone:$("#agentStaffphone").val(),
                agentStaffemail:$("#agentStaffemail").val(),
                agentStaffQq:$("#agentStaffQq").val(),
                agentStaffName:$("#agentStaffName").val(),
                agentStaffMessage:$("#agentStaffMessage").val()
            },
            type: "post",
            dataType: "JSON",
            success: function (data) {
                if (data) {
                    alert("修改成功！");
                    container.parent().modal('hide');
                    $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                } else {
                    alert("修改失败！");
                }
            },
            error: function (errMsg) {
            }
        });
    }

</script>