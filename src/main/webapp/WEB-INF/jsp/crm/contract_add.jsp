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
                <a href="javascript:;" id="index">签单</a>
            </li>
            <li>
                <a href="javascript:;">新建签单</a>
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
                            <h4 class="widget-title lighter">新建签单</h4>
                        </div>

                        <div class="widget-body">
                            <div class="widget-main">
                                <!-- #section:plugins/fuelux.wizard -->
                                <div id="fuelux-wizard" data-target="#step-container">
                                    <!-- #section:plugins/fuelux.wizard.steps -->
                                    <ul class="wizard-steps">
                                        <li data-target="#step1" class="active">
                                            <span class="step">1</span>
                                            <span class="title">填写信息</span>
                                        </li>

                                        <li data-target="#step4">
                                            <span class="step">2</span>
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
                                                       for="orderId">
                                                    签单编号：</label>
                                                <div class="col-lg-9 col-sm-9">
                                                    <input type="text" id="orderId" placeholder="输入签单编号"
                                                           class="col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="orderName">签单名称： </label>

                                                <div class="col-sm-9">
                                                    <input type="text" id="orderName" placeholder="输入签单名称"
                                                           class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="customersId">对应客户: </label>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <select class="form-control" id="customersId">
                                                            <option value="0">请选择对应客户</option>
                                                            <c:forEach items="${crmcustomersinfos}" var="crmcustomer">
                                                                <option value="${crmcustomer.id}">${crmcustomer.customersName}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /section:elements.form -->

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="money">本次成交金额： </label>

                                                <div class="col-sm-9">
                                                    <input type="text" id="money" placeholder="输入成交金额"
                                                           class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="signingtypeId">签单类型: </label>
                                                <div class="col-sm-3">
                                                    <div>
                                                        <select class="form-control" id="signingtypeId">
                                                            <option value="0">请选择签单类型</option>
                                                            <option value="1">直销类型</option>
                                                            <option value="2">代理类型</option>
                                                            <option value="3">采购类型</option>
                                                            <option value="4">服务类型</option>
                                                            <option value="5">其他</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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

<!-- inline scripts related to this page -->
<script type="text/javascript">
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

        function add() {
            var is;
            $.ajax({
                url: "contract_add.do",
                data: {
                    orderId:$("#orderId").val(),
                    customersId:$("#customersId").val(),
                    orderName:$("#orderName").val(),
                    money:$("#money").val(),
                    signingtypeId:$("#signingtypeId").val(),
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
            var iss=true;
            if ($("#agentsId").val() != '' && $("#agentsId").val() != null) {
                if(!isrepeat($("#agentsId").val(), null, null)){
                    return false;
                }
            }
            if ($("#agentphone").val() != '' && $("#agentphone").val() != null) {
                if(!isrepeat(null, $("#agentphone").val(), null)){
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
                    /*if (isadd() == false) {
                        return isadd();
                    }*/
                }
                if (info.step == 1 && is) {

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