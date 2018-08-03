<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <a href="javascript:;" id="index">代理商员工</a>
            </li>
            <li>
                <a href="javascript:;">添加代理商员工</a>
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
                            <h4 class="widget-title lighter">添加代理商员工流程</h4>
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
                                            <span class="title">设置账号</span>
                                        </li>

                                        <li data-target="#step3">
                                            <span class="step">3</span>
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
                                                       for="agentsStaffId">
                                                    代理商员工联系人编号：</label>
                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="agentsStaffId" placeholder="输入代理商员工联系人编号"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="agentStaffaddress">代理商员工联系地址： </label>

                                                <div class="col-sm-9">
                                                    <input type="text" id="agentStaffaddress" placeholder="输入代理商联系地址"
                                                           class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="form-field-1-1-1">代理商员工联系人性别: </label>
                                                <div class="col-sm-9">
                                                    <div>
                                                        <label class="line-height-1 blue">
                                                            <input name="agentStaffsex" id="form-field-1-1-1" value="0"
                                                                   type="radio" class="ace" checked/>
                                                            <span class="lbl"> 男</span>
                                                        </label>
                                                        <label class="line-height-1 blue">
                                                            <input name="agentStaffsex" value="1" type="radio"
                                                                   class="ace"/>
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
                                                        <input type="tel" id="agentStaffphone" name="phone"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="agentStaffemail">代理商员工邮箱:</label>

                                                <div class="col-xs-12 col-sm-9">
                                                    <div class="clearfix">
                                                        <input type="email" name="email" id="agentStaffemail"
                                                               class="col-xs-12 col-sm-6"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="agentStaffQq">QQ： </label>
                                                <div class="col-sm-9">
                                                    <input type="text" autocomplete="off" id="agentStaffQq"
                                                           placeholder="输入QQ"
                                                           class="col-xs-10 col-sm-5"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="agentStaffName">代理商员工联络人： </label>
                                                <div class="col-sm-9">
                                                    <input type="text" autocomplete="off" id="agentStaffName"
                                                           placeholder="输入代理商员工联络人"
                                                           class="col-xs-10 col-sm-5"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="agentStaffMessage">代理商员工其它信息：</label>
                                                <div class="col-sm-9">
                                                    <div class="pos-rel">
                                                <textarea class="form-control limited autosize-transition"
                                                          id="agentStaffMessage" maxlength="50"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="step-pane" id="step2">
                                        <div>
                                            <form class="form-horizontal " id="" method="get">
                                                <div class="form-group">
                                                    <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                           for="userName">
                                                        账号：</label>
                                                    <div class="col-lg-9 col-sm-9">
                                                        <input type="text" id="userName" placeholder="输入账号"
                                                               class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                           for="chineseName">
                                                        名称：</label>
                                                    <div class="col-lg-9 col-sm-9">
                                                        <input type="text" id="chineseName" placeholder="输入名称"
                                                               class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                           for="oldpassWord">
                                                        密码：</label>
                                                    <div class="col-lg-9 col-sm-9">
                                                        <input type="password" id="oldpassWord" placeholder="输入密码"
                                                               class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                           for="passWord">
                                                        再次输入密码：</label>
                                                    <div class="col-lg-9 col-sm-9">
                                                        <input type="password" id="passWord" placeholder="输入密码"
                                                               class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="step-pane" id="step3">
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

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {
        function isrepeat(a, b, c) {
            var is;
            $.ajax({
                url: "isAgencystaffrepeat.do",
                data: {
                    agentsStaffId: a,
                    agentStaffphone: b
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

        function add() {
            var is;
            $.ajax({
                url: "addAgencystaff.do",
                data: {
                    agentsStaffId: $("#agentsStaffId").val(),
                    agentStaffaddress: $("#agentStaffaddress").val(),
                    agentStaffsex: $("[name='agentStaffsex']:checked").val(),
                    agentStaffphone: $("#agentStaffphone").val(),
                    agentStaffemail: $("#agentStaffemail").val(),
                    agentStaffQq: $("#agentStaffQq").val(),
                    agentStaffName: $("#agentStaffName").val(),
                    agentStaffMessage: $("#agentStaffMessage").val(),
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

        function isadd() {
            if ($("#agentsStaffId").val() != '' && $("#agentsStaffId").val() != null) {
                return isrepeat($("#agentsStaffId").val(), null, null);
            }
            if ($("#agentStaffphone").val() != '' && $("#agentStaffphone").val() != null) {
                return isrepeat(null, $("#agentStaffphone").val(), null);
            }
        }

        var $validation = false;
        $('#fuelux-wizard')
            .ace_wizard({
                //step: 2 //optional argument. wizard will jump to step "2" at first
            }).unbind()
            .on('change', function (e, info) {
                if (info.step == 1) {
                    $("#chineseName").val($("#agentStaffName").val());
                    if (isadd() == false) {
                        return isadd();
                    }
                }
                if (info.step == 2) {
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
                            is1 = data;

                        },
                        error: function (errMsg) {
                        }
                    });
                    return is1;
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
                    $('#workstation').load("toagencyStaff.do");
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
            e.preventDefault();//this will prevent clicking and selecting steps
        });
    })
</script>