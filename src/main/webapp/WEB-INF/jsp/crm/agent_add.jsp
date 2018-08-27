<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="assets/toastr/toastr.min.css"/>
<style>
    .warning {
        border: 1px solid red;
    }
</style>
<div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-desktop home-icon"></i>
                <a href="javascript:;" id="index">代理商</a>
            </li>
            <li>
                <a href="javascript:;">添加代理商</a>
            </li>
        </ul><!-- /.breadcrumb -->

        <!-- #section:basics/content.searchbox -->

    </div>

    <!-- /section:basics/content.breadcrumbs -->
    <div class="page-content">

        <!-- /section:settings.box -->
        <div class="page-content-area">

            <div class="row">
                <div class="col-xs-12">

                    <div class="widget-box">
                        <div class="widget-header widget-header-blue widget-header-flat">
                            <h4 class="widget-title lighter">添加代理商流程</h4>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <!-- #section:plugins/fuelux.wizard -->
                                <div id="fuelux-wizard" data-target="#step-container">
                                    <!-- #section:plugins/fuelux.wizard.steps -->
                                    <ul class="wizard-steps">
                                        <li data-target="#step1" class="active">
                                            <span class="step">1</span>
                                            <span class="title">基本信息</span>
                                        </li>

                                        <li data-target="#step2">
                                            <span class="step">2</span>
                                            <span class="title">选择分配渠道</span>
                                        </li>

                                        <li data-target="#step3">
                                            <span class="step">3</span>
                                            <span class="title">设置账号</span>
                                        </li>

                                        <li data-target="#step4">
                                            <span class="step">4</span>
                                            <span class="title">确定提交</span>
                                        </li>
                                    </ul>

                                    <!-- /section:plugins/fuelux.wizard.steps -->
                                </div>

                                <hr/>

                                <!-- #section:plugins/fuelux.wizard.container -->
                                <div class="step-content pos-rel" id="step-container">
                                    <div class="step-pane active" id="step1">
                                        <h3 class="lighter block blue">请输入以下信息</h3>

                                        <form class="form-horizontal " id="validation-form" method="get">
                                            <div class="form-group">
                                                <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                       for="agentsId">
                                                    代理商联系人编号：</label>
                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="agentsId" placeholder="输入代理商联系人编号"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="agentName">代理商联络人： </label>
                                                <div class="col-sm-9">
                                                    <input type="text" autocomplete="off" id="agentName"
                                                           placeholder="输入代理商联络人"
                                                           class="col-xs-10 col-sm-5"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="form-field-1-1-1">代理商联系人性别: </label>
                                                <div class="col-sm-9">
                                                    <div>
                                                        <label class="line-height-1 blue">
                                                            <input name="agentsex" id="form-field-1-1-1" value="0"
                                                                   type="radio" class="ace" checked/>
                                                            <span class="lbl"> 男</span>
                                                        </label>
                                                        <label class="line-height-1 blue">
                                                            <input name="agentsex" value="1" type="radio" class="ace"/>
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
                                                        <input type="tel" id="agentphone" name="phone"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="agentemail">代理商邮箱:</label>

                                                <div class="col-xs-12 col-sm-9">
                                                    <div class="clearfix">
                                                        <input type="email" name="email" id="agentemail"
                                                               class="col-xs-12 col-sm-6"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="agentQq">QQ： </label>
                                                <div class="col-sm-9">
                                                    <input type="text" autocomplete="off" id="agentQq"
                                                           placeholder="输入QQ"
                                                           class="col-xs-10 col-sm-5"/>
                                                </div>
                                            </div>


                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="agentaddress">代理商联系地址： </label>

                                                <div class="col-sm-9">
                                                    <input type="text" id="agentaddress" placeholder="输入代理商联系地址"
                                                           class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="agentMessage">代理商其它信息：</label>
                                                <div class="col-sm-9">
                                                    <div class="pos-rel">
                                                <textarea class="form-control limited autosize-transition"
                                                          id="agentMessage" maxlength="50"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="step-pane" id="step2">
                                        <div>
                                            <div class="form-group" id="zj">
                                                <label class="col-lg-1">渠道总监：</label>
                                                <div class="col-lg-3 col-sm-2">
                                                    <div class="pos-rel">
                                                        <select class="form-control">
                                                            <option value="0">------------</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" id="jl">
                                                <label class="col-lg-1">渠道经理：</label>
                                                <div class="col-lg-3 col-sm-2">
                                                    <div class="pos-rel">
                                                        <select class="form-control">
                                                            <option value="0">------------</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" id="zy">
                                                <label class="col-lg-1">渠道专员：</label>
                                                <div class="col-lg-3 col-sm-2">
                                                    <div class="pos-rel">
                                                        <select class="form-control">
                                                            <option value="0">------------</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="step-pane" id="step3">
                                        <div class="center">
                                            <form class="form-horizontal " id="" method="get">
                                                <div class="form-group">
                                                    <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                           for="agentsId">
                                                        账号：</label>
                                                    <div class="col-lg-9 col-sm-9">
                                                        <input type="text" id="userName" placeholder="输入账号"
                                                               class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                           for="agentsId">
                                                        名称：</label>
                                                    <div class="col-lg-9 col-sm-9">
                                                        <input type="text" id="chineseName" placeholder="输入名称" readonly="readonly"
                                                               class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                           for="agentsId">
                                                        密码：</label>
                                                    <div class="col-lg-9 col-sm-9">
                                                        <input type="password" id="oldpassWord" placeholder="输入密码"
                                                               class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                           for="agentsId">
                                                        再次输入密码：</label>
                                                    <div class="col-lg-9 col-sm-9">
                                                        <input type="password" id="passWord" placeholder="输入密码"
                                                               class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="step-pane" id="step4">
                                        <div class="center">
                                            <div class="center">
                                                <h1 class="green">确定提交？</h1>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- /section:plugins/fuelux.wizard.container -->
                                <hr/>
                                <div class="wizard-actions">
                                    <!-- #section:plugins/fuelux.wizard.buttons -->
                                    <button class="btn btn-prev">
                                        <i class="ace-icon fa fa-arrow-left"></i>
                                        上一步
                                    </button>

                                    <button class="btn btn-success btn-next" data-last="提交">
                                        下一步
                                        <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                    </button>
                                    <!-- /section:plugins/fuelux.wizard.buttons -->
                                </div>

                                <!-- /section:plugins/fuelux.wizard -->
                            </div><!-- /.widget-main -->
                        </div><!-- /.widget-body -->
                    </div>


                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content-area -->
    </div><!-- /.page-content -->
</div>
<!-- /.main-content -->
<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->


<!-- page specific plugin scripts -->
<script src="assets/js/fuelux/fuelux.wizard.min.js"></script>
<script src="assets/js/jquery.validate.min.js"></script>
<script src="assets/js/additional-methods.min.js"></script>
<script src="assets/js/bootbox.min.js"></script>
<script src="assets/js/jquery.maskedinput.min.js"></script>
<script src="assets/js/select2.min.js"></script>

<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>
<script src="assets/toastr/toastr.min.js"></script>
<!-- inline scripts related to this page -->
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
    jQuery(function ($) {
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
        function userAdd(){
            if($("#userName").val() ==""){
                toastr.error("请填写账号！");
                return false;
            }
            if($("#passWord").val() ==""){
                toastr.error("请填写密码！");
                return false;
            }
            if($("#oldpassWord").val() !="" && $("#oldpassWord").val() != $("#passWord").val()){
                toastr.error("两次密码不相同！");
                return false;
            }
            return true;
        }
        function agentadd() {
            if ($("#agentsId").val() == "") {
                toastr.error("请填写编号！");
                return false;
            }
            if ($("#agentName").val() == "") {
                toastr.error("请填写联系人名称！");
                return false;
            }
            if ($("#agentphone").val() == "") {
                toastr.error("请填写联系人电话号码！");
                return false;
            }
            if ($("#agentphone").val() != "" && !checkMobile($("#agentphone").val())){
                toastr.error("请填写正确电话号码！");
                return false;
            }
            if($("#agentQq").val() != "" && !qq($("#agentQq").val())){
                toastr.error("请填写正确QQ！");
                return false;
            }
            if($("#agentemail").val() != "" && !checkEmail($("#agentemail").val())){
                toastr.error("请填写正确邮箱！");
                return false;
            }
            return true;
        }

        function add() {
            var is;
            $.ajax({
                url: "addCrmagentsinfo.do",
                data: {
                    agentsId: $("#agentsId").val(),
                    agentaddress: $("#agentaddress").val(),
                    agentsex: $("[name='agentsex']:checked").val(),
                    agentphone: $("#agentphone").val(),
                    agentemail: $("#agentemail").val(),
                    agentQq: $("#agentQq").val(),
                    agentName: $("#agentName").val(),
                    agentMessage: $("#agentMessage").val(),
                    character: $("#zy select").val(),
                    userName: $("#userName").val(),
                    passWord: $("#passWord").val(),
                    chineseName: $("#chineseName").val()
                },
                async: false,
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    is = data;
                },
                error: function (errMsg) {
                }
            });
            return is;
        }


        $("#index").click(function () {
            $('#workstation').load("agent.do");
        });

        function getUser(roleId, html) {
            $.ajax({
                url: "getCusinfo.do",
                data: {
                    roleId: roleId
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    var _html = '<option value="0">------------</option>';
                    $(data).each(function () {
                        _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                    });
                    $("#" + html + " select").empty();
                    $("#" + html + " select").append(_html);
                },
                error: function (errMsg) {
                }
            });
        }

        $("#zj,#jl,#zy").hide();

        $("#zj select").change(function () {
            if ($(this).val() != '0') {
                $("#jl").show();
                $.ajax({
                    url: "getCusinfo.do",
                    data: {
                        roleId: 3,
                        userArrangement: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">------------</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                        });
                        $("#jl select").empty();
                        $("#jl select").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                var _html = '<option value="0">------------</option>';
                $("#jl select").empty();
                $("#jl select").append(_html);
                $("#zy select").empty();
                $("#zy select").append(_html);
                $("#jl").hide();
                $("#zy").hide();
            }
        });
        $("#jl select").change(function () {
            if ($(this).val() != '0') {
                $("#zy").show();
                $.ajax({
                    url: "getCusinfo.do",
                    data: {
                        roleId: 4,
                        userArrangement: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">------------</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                        });
                        $("#zy select").empty();
                        $("#zy select").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                var _html = '<option value="0">------------</option>';
                $("#zy select").empty();
                $("#zy select").append(_html);
                $("#zy").hide();
            }
        });

        function isadd() {
            var iss = true;
            if ($("#agentsId").val() != '' && $("#agentsId").val() != null) {
                if (!isrepeat($("#agentsId").val(), null, null)) {
                    toastr.error("已有该编号！");
                    return false;
                }
            }
            if ($("#agentphone").val() != '' && $("#agentphone").val() != null) {
                if (!isrepeat(null, $("#agentphone").val(), null)) {
                    toastr.error("已有改电话号码！!");
                    return false;
                }
            }
            /*if ($("#agentName").val() != '' && $("#agentName").val() != null) {
                return isrepeat(null, null, $("#agentName").val());
            }*/
            return iss;
        }

        var $validation = false;
        var is = true;
        $('#fuelux-wizard')
            .ace_wizard({
                //step: 2 //optional argument. wizard will jump to step "2" at first
            }).unbind()
            .on('change', function (e, info) {
                if (info.step == 1) {
                    if(agentadd()==true){
                        if (isadd() == false) {
                            return false;
                        }
                    }else {
                        return false;
                    }

                }
                if (info.step == 2) {
                    if ($("#zy select").val() == '0') {
                        toastr.error("请选择分配人！");
                        return false;
                    } else {
                        $("#chineseName").val($("#agentName").val());
                    }
                }
                if (info.step == 3) {
                    if(userAdd()==false){
                        return false;
                    }
                    var is1;
                    $.ajax({
                        url: "isUserRepeat.do",
                        data: {
                            userName: $("#userName").val()
                        },
                        async: false,
                        type: "post",
                        dataType: "JSON",
                        success: function (data) {
                            if(data==false){
                                toastr.error("已存在该账号！");
                            }
                            is1 = data;

                        },
                        error: function (errMsg) {
                        }
                    });
                    return is1;
                }

                if (info.step == 1 && is) {


                    if (${user.roleId}==1
                )
                    {
                        $("#zj").show();
                        getUser(2, "zj");
                        is = false;

                    }
                else
                    if (${user.roleId}==2 && is
                )
                    {
                        $("#jl").show();
                        getUser(3, "jl");
                        is = false;
                    }
                else
                    if (${user.roleId}==3 && is
                )
                    {
                        $("#zy").show();
                        getUser(4, "zy");
                        is = false;
                    }
                else
                    {
                        $("#zy").show();
                        $("#zy select").empty();
                        $("#zy select").append('<option value="${user.userArrangement} "> ${user.chineseName} </option>');
                        $("#zy select").attr("disabled", "disabled");
                    }
                }
            })
            .on('finished', function (e) {
                if (add()) {
                    bootbox.dialog({
                        message: "添加成功！",
                        buttons: {
                            "success": {
                                "label": "确定并关闭",
                                "className": "btn-sm btn-primary"
                            }
                        }
                    });
                    $('#workstation').load("agent.do");
                } else {
                    bootbox.dialog({
                        message: "添加失败！",
                        buttons: {
                            "success": {
                                "label": "确定",
                                "className": "btn-sm btn-primary"
                            }
                        }
                    });
                }


            }).on('stepclick', function (e) {
            //e.preventDefault();//this will prevent clicking and selecting steps
        });
    })
</script>