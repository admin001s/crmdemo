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
                <a href="javascript:;" id="index">客户</a>
            </li>
            <li>
                <a href="javascript:;">添加客户</a>
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
                            <h4 class="widget-title lighter">添加客户流程</h4>
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
                                            <span class="title">选择分配代理商</span>
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
                                                       for="customersId"> 客户编号：</label>
                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="customersId" placeholder="输入客户编号"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="customersName">客户名称： </label>

                                                <div class="col-sm-9">
                                                    <input type="text" id="customersName" placeholder="输入客户名称"
                                                           class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">客户性别: </label>
                                                <div class="col-sm-9">
                                                    <div>
                                                        <label class="line-height-1 blue">
                                                            <input name="customersSex" id="form-field-1-1-1" value="0"
                                                                   type="radio" class="ace" checked/>
                                                            <span class="lbl"> 男</span>
                                                        </label>
                                                        <label class="line-height-1 blue">
                                                            <input name="customersSex" value="1" type="radio" class="ace"/>
                                                            <span class="lbl"> 女</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /section:elements.form -->
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="provinceName">地区：</label>
                                                <div class="col-sm-2">
                                                    <div class="pos-rel">
                                                        <select class="form-control" id="provinceName">
                                                            <option value="0">省</option>
                                                            <c:forEach items="${provinces}" var="province">
                                                                <option value="${province.provinceid}">${province.province}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="pos-rel">
                                                        <select class="form-control" id="cityName">
                                                            <option value="0">市</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="pos-rel">
                                                        <select class="form-control" id="mainsalesarea">
                                                            <option value="0">区</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="department">部门： </label>
                                                <div class="col-sm-9">
                                                    <input type="text" autocomplete="off" id="department" placeholder="输入部门"
                                                           class="col-xs-10 col-sm-5"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="position">职位： </label>
                                                <div class="col-sm-9">
                                                    <input type="text" autocomplete="off" id="position" placeholder="输入职位"
                                                           class="col-xs-10 col-sm-5"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="telephone">手机号码:</label>
                                                <div class="col-xs-12 col-sm-9">
                                                    <div class="input-group">
																	<span class="input-group-addon">
																		<i class="ace-icon fa fa-phone"></i>
																	</span>
                                                        <input type="tel" id="telephone" name="phone"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="qq">QQ： </label>
                                                <div class="col-sm-9">
                                                    <input type="text" autocomplete="off" id="qq" placeholder="输入QQ"
                                                           class="col-xs-10 col-sm-5"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">是否VIP: </label>
                                                <div class="col-sm-9">
                                                    <div>
                                                        <label class="line-height-1 blue">
                                                            <input name="isVip" id="isVIP" value="0" type="radio" class="ace"/>
                                                            <span class="lbl"> 是</span>
                                                        </label>
                                                        <label class="line-height-1 blue">
                                                            <input name="isVip" value="1" type="radio" class="ace" checked/>
                                                            <span class="lbl"> 否</span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                                       for="email">邮箱:</label>

                                                <div class="col-xs-12 col-sm-9">
                                                    <div class="clearfix">
                                                        <input type="email" name="email" id="email" class="col-xs-12 col-sm-6"/>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                       for="industryCategory"> 行业大类：</label>

                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="industryCategory" placeholder="输入行业大类"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                       for="industrySubclass"> 行业子类：</label>

                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="industrySubclass" placeholder="输入行业子类"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                       for="customerSource"> 客户来源：</label>

                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="customerSource" placeholder="输入客户来源"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                       for="customerUrlSource"> 客户网址来源：</label>

                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="customerUrlSource" placeholder="输入客户网址来源"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                       for="companywebsite"> 公司名称：</label>

                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="companywebsite" placeholder="输入公司名称"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                       for="companyAddress"> 公司地址：</label>

                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="companyAddress" placeholder="输入公司地址"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="companydetails">公司详情：</label>
                                                <div class="col-sm-9">
                                                    <div class="pos-rel">
                                                <textarea class="form-control limited autosize-transition"
                                                          id="companydetails" maxlength="50"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                                       for="mainproducts"> 主要产品：</label>

                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="mainproducts" placeholder="主要产品"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="step-pane" id="step2">
                                        <div class="alert alert-warning">
                                            <button type="button" class="close" data-dismiss="alert">
                                                <i class="ace-icon fa fa-times"></i>
                                            </button>
                                            <strong>提示</strong>
                                            如果您未将此用户分配到代理商或代理商员工，将跳过此操作！
                                            <br />
                                        </div>
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
                                            <div class="form-group" id="dls">
                                                <label class="col-lg-1">代理商：</label>
                                                <div class="col-lg-3 col-sm-2">
                                                    <div class="pos-rel">
                                                        <select class="form-control">
                                                            <option value="0">------------</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group" id="yg">
                                            <label class="col-lg-1">代理商员工：</label>
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
        $("#tiao").hide();
        function isrepeat(a, b, c) {
            var is;
            $.ajax({
                url: "isCustomerffrepeat.do",
                data: {
                    customersId: a,
                    telephone: b,
                    companywebsite:c
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
        function isadd() {
            var iss=true;
            if ($("#customersId").val() != '' && $("#customersId").val() != null) {
                 if(!isrepeat($("#customersId").val(), null, null)){
                     return false;
                 }
            }
            if ($("#telephone").val() != '' && $("#telephone").val() != null) {
                if(!isrepeat(null, $("#telephone").val(), null)){
                    return false;
                }
            }
            if ($("#companywebsite").val() != '' && $("#companywebsite").val() != null) {
                if(!isrepeat(null, null, $("#companywebsite").val())){
                    return false;
                }
            }
            return iss;
        }
        function add() {
            var isex;
            var fp;
            if($("#yg select").val()!="0"){
                fp=$("#yg select").val();
            }else if($("#dls select").val()!="0"){
                fp=$("#dls select").val();
            }
            $.ajax({
                url: "addCrmcustomersinfo.do",
                data: {
                    customersId: $("#customersId").val(),
                    customersName: $("#customersName").val(),
                    customersSex: $("[name='customersSex']:checked").val(),
                    provinceName: $("#provinceName").val(),
                    cityName: $("#cityName").val(),
                    mainsalesarea: $("#mainsalesarea").val(),
                    department: $("#department").val(),
                    position: $("#position").val(),
                    telephone: $("#telephone").val(),
                    isVip: $("[name='isVip']:checked").val(),
                    email: $("#email").val(),
                    industryCategory: $("#industryCategory").val(),
                    industrySubclass: $("#industrySubclass").val(),
                    customerSource: $("#customerSource").val(),
                    companywebsite: $("#companywebsite").val(),
                    companyAddress: $("#companyAddress").val(),
                    companydetails: $("#companydetails").val(),
                    mainproducts: $("#mainproducts").val(),
                    customerUrlSource: $("#customerUrlSource").val(),
                    qq: $("#qq").val(),
                    fp:fp
                },
                async: false,
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data) {
                        isex=true;
                    } else {
                        isex=false;
                    }
                },
                error: function (errMsg) {
                }
            });
            return isex;
        }


        $("#index").click(function () {
            $('#workstation').load("customer.do");
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

        $("#zj,#jl,#zy,#dls,#yg").hide();

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
                $("#jl").hide();
                $("#zy").hide();
                $("#dls").hide();
                $("#yg").hide();
                $("#jl select").empty();
                $("#jl select").append(_html);
                $("#zy select").empty();
                $("#zy select").append(_html);
                $("#dls select").empty();
                $("#dls select").append(_html);
                $("#yg select").empty();
                $("#yg select").append(_html);
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
                $("#zy").hide();
                $("#dls").hide();
                $("#yg").hide();
                $("#zy select").empty();
                $("#zy select").append(_html);
                $("#dls select").empty();
                $("#dls select").append(_html);
                $("#yg select").empty();
                $("#yg select").append(_html);
            }
        });
        $("#zy select").change(function () {
            if ($(this).val() != '0') {
                $("#dls").show();
                $.ajax({
                    url: "getCusinfo.do",
                    data: {
                        roleId: 5,
                        userArrangement: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">------------</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                        });
                        $("#dls select").empty();
                        $("#dls select").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                var _html = '<option value="0">------------</option>';
                $("#dls").hide();
                $("#yg").hide();
                $("#dls select").empty();
                $("#dls select").append(_html);
                $("#yg select").empty();
                $("#yg select").append(_html);
            }
        });
        $("#dls select").change(function () {
            if ($(this).val() != '0') {
                $("#yg").show();
                $.ajax({
                    url: "getCusinfo.do",
                    data: {
                        roleId: 6,
                        userArrangement: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">------------</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                        });
                        $("#yg select").empty();
                        $("#yg select").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                var _html = '<option value="0">------------</option>';
                $("#yg").hide();
                $("#yg select").empty();
                $("#yg select").append(_html);
            }
        });


        var $validation = false;
        var is = true;
        $('#fuelux-wizard')
            .ace_wizard({
                //step: 2 //optional argument. wizard will jump to step "2" at first
            }).unbind()
            .on('change', function (e, info) {
                if (info.step == 1) {
                    if (isadd() == false) {
                        return isadd();
                    }else{
                        if(${user.roleId}!=6)
                        {
                            $("#tiao").show();
                        }
                    }
                }
                if (info.step == 2) {
                    $("#tiao").hide();
                }
                if (info.step == 1 && is) {
                    if (${user.roleId}==1  && is
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
                   else if(${user.roleId}==4 && is){
                        $("#dls").show();
                        getUser(5, "dls");
                        is = false;
                    }else if(${user.roleId}==5 && is){
                        $("#yg").show();
                        getUser(6, "yg");
                        is = false;
                    }
                else
                    {
                        $("#yg").show();
                        $("#yg select").empty();
                        $("#yg select").append('<option value="${user.userArrangement} "> ${user.chineseName} </option>');
                        $("#yg select").attr("disabled", "disabled");
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
                    $('#workstation').load("customer.do");
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
    $(function () {
        $("#provinceName").change(function () {
            if ($(this).val() != '0') {
                $.ajax({
                    url: "getcities.do",
                    data: {
                        provinceid: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">市</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.cityid + '">' + this.city + '</option>';
                        });
                        $("#cityName").empty();
                        $("#cityName").append(_html);
                        $("#mainsalesarea").empty();
                        $("#mainsalesarea").append('<option value="0">区</option>');
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                $("#cityName").empty();
                $("#cityName").append('<option value="0">市</option>');
                $("#mainsalesarea").empty();
                $("#mainsalesarea").append('<option value="0">区</option>');
            }
        });
        $("#cityName").change(function () {
            if ($(this).val() != '0') {
                $.ajax({
                    url: "getareas.do",
                    data: {
                        cityid: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">区</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.areaid + '">' + this.area + '</option>';
                        });
                        $("#mainsalesarea").empty();
                        $("#mainsalesarea").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                $("#mainsalesarea").empty();
                $("#mainsalesarea").append('<option value="0">区</option>');
            }
        });
    });
</script>