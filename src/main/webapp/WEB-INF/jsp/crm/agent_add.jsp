<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                                       for="agentaddress">代理商联系地址： </label>

                                                <div class="col-sm-9">
                                                    <input type="text" id="agentaddress" placeholder="输入代理商联系地址"
                                                           class=" col-xs-10 col-sm-5" autocomplete="off"/>
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
                                                       for="agentName">代理商联络人： </label>
                                                <div class="col-sm-9">
                                                    <input type="text" autocomplete="off" id="agentName"
                                                           placeholder="输入代理商联络人"
                                                           class="col-xs-10 col-sm-5"/>
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
                                                        <input type="text" id="chineseName" placeholder="输入名称"
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
    window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
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
        function add() {
            $.ajax({
                url: "addCrmagentsinfo.do",
                data: {
                    agentsId:$("#agentsId").val(),
                    agentaddress:$("#agentaddress").val(),
                    agentsex:$("[name='agentsex']:checked").val(),
                    agentphone:$("#agentphone").val(),
                    agentemail:$("#agentemail").val(),
                    agentQq:$("#agentQq").val(),
                    agentName:$("#agentName").val(),
                    agentMessage:$("#agentMessage").val()
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data) {
                        alert("新增成功！");
                        container.parent().modal('hide');
                        $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                    } else {
                        alert("新增失败！");
                    }
                },
                error: function (errMsg) {
                }
            });
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
                $("#zy").hide();
            }
        });

        var $validation = false;
        var is=true;
        $('#fuelux-wizard')
            .ace_wizard({
                //step: 2 //optional argument. wizard will jump to step "2" at first
            }).unbind()
            .on('change', function (e, info) {
                if (info.step == 1 && $validation) {
                    if (!$('#validation-form').valid()) return false;
                }
                if (info.step == 1 && is) {
                    if (${user.roleId}==1
                )
                    {
                        $("#zj").show();
                        getUser(2, "zj");
                        is=false;

                    }
                else
                    if (${user.roleId}==2 && is
                )
                    {
                        $("#jl").show();
                        getUser(3, "jl");
                        is=false;
                    }
                else
                    if (${user.roleId}==3 && is
                )
                    {
                        $("#zy").show();
                        getUser(4, "zy");
                        is=false;
                    }
                else
                    {
                        $("#zy").show();
                        $("#zy select").empty();
                        $("#zy select").append('<option value="${user.userArrangement} "> ${user.chineseName} </option>');
                        $("#zy select").attr("disabled","disabled");
                    }
                }
            })
            .on('finished', function (e) {
                bootbox.dialog({
                    message: "你的订单已经生成，请注意出票和登机时间。",
                    buttons: {
                        "success": {
                            "label": "确定并关闭",
                            "className": "btn-sm btn-primary"
                        }
                    }
                });
            }).on('stepclick', function (e) {
            e.preventDefault();//this will prevent clicking and selecting steps
        });
    })
</script>