<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="assets/toastr/toastr.min.css"/>
<div id="modal-demo" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">&times;
            </button>
            <div class="modal-header">
                <h3 class="modal-title">修改代理商</h3>
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
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="agentsId">
                                            代理商联系人编号：</label>
                                        <div class="col-lg-9 col-sm-9">
                                            <input readonly="" type="text" id="agentsId" placeholder="输入代理商联系人编号"
                                                value="${agent.agentsId}"   class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="agentName">代理商联络人： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="agentName" placeholder="输入代理商联络人"
                                                   class="col-xs-10 col-sm-5" value="${agent.agentName}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">代理商联系人性别: </label>
                                        <div class="col-sm-9">
                                            <div>
                                                <label class="line-height-1 blue">
                                                    <input name="agentsex" id="form-field-1-1-1" value="0"
                                                           type="radio" class="ace" <c:if test="${agent.agentsex==0}">checked</c:if>  />
                                                    <span class="lbl"> 男</span>
                                                </label>
                                                <label class="line-height-1 blue">
                                                    <input name="agentsex" value="1" type="radio" class="ace" <c:if test="${agent.agentsex==1}">checked</c:if>/>
                                                    <span class="lbl"> 女</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /section:elements.form -->

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                               for="agentphone">代理商联系电话:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="input-group">
 																	<span class="input-group-addon">
 																		<i class="ace-icon fa fa-phone"></i>
 																	</span>
                                                <input type="tel" id="agentphone" name="phone" value="${agent.agentphone}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                               for="agentemail">代理商邮箱:</label>

                                        <div class="col-xs-12 col-sm-9">
                                            <div class="clearfix">
                                                <input type="email" name="email" id="agentemail"
                                                       class="col-xs-12 col-sm-6" value="${agent.agentemail}"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="agentQq">QQ： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="agentQq" placeholder="输入QQ"
                                                   class="col-xs-10 col-sm-5" value="${agent.agentQq}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="agentaddress">代理商联系地址： </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="agentaddress" placeholder="输入代理商联系地址"
                                                   value="${agent.agentaddress}"  class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="agentMessage">代理商其它信息：</label>
                                        <div class="col-sm-9">
                                            <div class="pos-rel">
                                                 <textarea class="form-control limited autosize-transition"
                                                           id="agentMessage" maxlength="50">${agent.agentMessage}</textarea>
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
<script src="assets/toastr/toastr.min.js"></script>
<script type="text/javascript">
    //邮箱
    function
    checkEmail(str){
        var
            re = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
        if(re.test(str)){
            return true;
        }else{
            return false;
        }
    }
    //验证帐号是否合法

    //验证规则：字母、数字、下划线组成，字母开头，4-16位。

    function
    checkUser(str) {
        var
            re = /^[a-zA-z]\w{3,15}$/;
        if (re.test(str)) {
            return true;
        } else {
            return false;
        }
    }

    //手机号码

    //验证规则：11位数字，以1开头。
    function checkMobile(str) {
        var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (myreg.test(str)) {
            return true;
        } else {
            return false;
        }
    }

    // 判断qq

    function qq(str) {
        var myreg = /^[0-9]{5,10}$/;
        if (myreg.test(str)) {
            return true;
        } else {
            return false;
        }
    }
    var container=$("#modal-demo");
    function agentadd() {
        if (container.find("#agentName").val() == "") {
            toastr.error("请填写联系人名称！");
            return false;
        }
        if (container.find("#agentphone").val() == "") {
            toastr.error("请填写联系人电话号码！");
            return false;
        }
        if (container.find("#agentphone").val() != "" && !checkMobile(container.find("#agentphone").val())){
            toastr.error("请填写正确电话号码！");
            return false;
        }
        if(container.find("#agentQq").val() != "" && !qq(container.find("#agentQq").val())){
            toastr.error("请填写正确QQ！");
            return false;
        }
        if(container.find("#agentemail").val() != "" && !checkEmail(container.find("#agentemail").val())){
            toastr.error("请填写正确邮箱！");
            return false;
        }
        return true;
    }
    function isadd() {
        var iss = true;
        if (container.find("#agentphone").val() != '' && container.find("#agentphone").val() != "${agent.agentphone}") {
            if (!isrepeat(null, container.find("#agentphone").val(), null)) {
                toastr.error("已有改电话号码！!")
                return false;
            }
        }
        /*if ($("#agentName").val() != '' && $("#agentName").val() != null) {
            return isrepeat(null, null, $("#agentName").val());
        }*/
        return iss;
    }
    function isrepeat(a, b, c) {
        var is;
        $.ajax({
            url: "isrepeat.do",
            data: {
                agentsId: a,
                agentphone: b/*,
                    agentName: c*/
            },
            async: false,
            type: "post",
            dataType: "JSON",
            success: function (data) {
                if (data) {
                    is = true;
                } else {
                    is = false;
                }
            },
            error: function (errMsg) {
            }
        });
        return is;
    }
    function upate() {
        if(agentadd()){
            if(isadd()){
                $.ajax({
                    url: "updateAgents.do",
                    data: {
                        id:${agent.id},
                        agentaddress:container.find("#agentaddress").val(),
                        agentsex:container.find("[name='agentsex']:checked").val(),
                        agentphone:container.find("#agentphone").val(),
                        agentemail:container.find("#agentemail").val(),
                        agentQq:container.find("#agentQq").val(),
                        agentName:container.find("#agentName").val(),
                        agentMessage:container.find("#agentMessage").val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        if (data) {
                            toastr.success("修改成功！");
                            container.parent().modal('hide');
                            $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                        } else {
                            toastr.error("修改失败！");
                        }
                    },
                    error: function (errMsg) {
                    }
                });
            }
        }

    }

</script>