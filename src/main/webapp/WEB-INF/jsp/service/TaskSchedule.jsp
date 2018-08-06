<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!-- /section:basics/sidebar -->
<div class="main-content">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                首页
            </li>
            <li>
                产品服务线
            </li>
            <li>
                模块任务
            </li>
        </ul><!-- /.breadcrumb -->
    </div>

    <div style="margin: 25px">
        <button type="button" class="btn btn-info btn-lg addService" value="all"><font
                style="vertical-align: inherit;"><font style="vertical-align: inherit;">添加</font></font></button>
    </div>
    <div class="page-content">

        <!-- /section:settings.box -->
        <div class="page-content-area">

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="row">
                        <div class="col-xs-12" id="select-product-p1123">
                            <input type="hidden" value="" id="id">
                            <table id="table">

                            </table>
                        </div><!-- /.span -->
                    </div>
                    <!-- /.row -->


                    <div id="modal-table" class="modal fade" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header no-padding">
                                    <div class="table-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            <span class="white">&times;</span>
                                        </button>
                                        添加模板任务
                                    </div>
                                </div>


                                <div style="padding: 50px 50px 10px;">
                                    <form class="bs-example bs-example-form" role="form" id="from">
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon">选择产品：</span>
                                            <div class="form-group">
                                                <select class="form-control" id="rmProductServiceCId">
                                                    <option value="0">--请选择--</option>
                                                    <c:forEach var="fff" items="${crmproductall}">
                                                        <option value="${fff.crmProductServiceId}">${fff.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon">选择模板：</span>
                                            <div class="form-group">
                                                <select class="form-control" id="crmModularId">
                                                    <option value="0">--请选择--</option>
                                                    <c:forEach var="fff" items="${crmmodulars}">
                                                        <option value="${fff.crmModularId}">${fff.modularName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon">选择用户：</span>
                                            <div class="form-group">
                                                <select class="form-control" id="userId">
                                                    <option value="0">--请选择--</option>
                                                    <c:forEach var="fff" items="${crmcustomersinfo}">
                                                        <option value="${fff.id}">${fff.customersName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon">服务时间：</span>
                                            <input type="date" class="form-control" id="serviceTime"
                                                   placeholder="请输入服务时间">
                                        </div>
                                        <br>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-addon">存在问题：</span>
                                            <textarea class="form-control" rows="10" style="height: 80px"
                                                      id="existQuest"
                                                      placeholder="问题描述..."></textarea>
                                        </div>
                                        <br>
                                    </form>
                                </div>


                                <div class="modal-footer no-margin-top">
                                    <button class="btn btn-sm btn-success pull-left" data-dismiss="modal" id="submit">
                                        <i class="glyphicon glyphicon-ok"></i>
                                        提交
                                    </button>
                                    <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                        <i class="ace-icon fa fa-times"></i>
                                        关闭
                                    </button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content-area -->
    </div>
    <!-- /.page-content -->
</div>
<!-- /.main-content -->


<link rel="stylesheet" href="assets/toastr/toastr.min.css"/>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/js/bootstrap-table.js"></script>
<script src="assets/js/bootstrap-table-zh-CN.js"></script>
<script src="assets/toastr/toastr.min.js"></script>


<script type="text/javascript">
    jQuery(function ($) {
        var container = $('#select-product-p1123');

        //显示产品信息
        function initTable() {
            container.find('#table').bootstrapTable('destroy');
            var options = {
                url: '/getCrmtaskschedulevop.do', //请求后台的URL（*）
                method: 'post', //请求方式（*）
                contentType: "application/x-www-form-urlencoded",
                dataType: "json", //数据类型
                striped: false, //是否显示行间隔色
                pagination: false, //是否显示分页（*）
                queryParamsType: '',
                queryParams: function (param) {
                    var params = {};
                    return params;
                },

                clickToSelect: true,
                undefinedText: "",
                pagination: true,//是否开启分页（*）
                locale: 'zh-CN',//中文支持
                pageNumber: 1,//初始化加载第一页，默认第一页
                pageSize: 10,//每页的记录行数（*）
                pageList: [5, 10, 15],//可供选择的每页的行数（*）
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                showRefresh: true,//刷新按钮
                search: true,//是否显示表格搜索，此搜索是客户端搜索，不会进服务端
                clickToSelect: true, //是否启用点击选中行
                height: 650, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "", //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                // exportTypes : [ 'excel' ], //导出文件类型
                columns: [{
                    field: 'i',
                    title: '序号',
                    align: 'center'
                }, {
                    field: 'pname',
                    title: '产品名称',
                    align: 'center'
                }, {
                    field: 'mname',
                    title: '模板名称',
                    align: 'center'
                }, {
                    field: 'bname',
                    title: '用户',
                    align: 'center'
                }, {
                    field: 'serviceTime',
                    title: '服务时间',
                    align: 'center'
                }, {
                    field: 'confirmTime',
                    title: '确认时间',
                    align: 'center'
                }, {
                    field: 'uname',
                    title: '确认人',
                    align: 'center'
                }, {
                    field: 'existQuest',
                    title: '存在问题',
                    align: 'center'
                }, {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    formatter: function (value) {
                        var status = null;
                        if (value == "0") {
                            status = "待完成";
                        } else if (value == "1") {
                            status = "已完成";
                        }
                        return status;
                    }
                }, {
                    field: 'caozuo',
                    title: '操作',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var status;
                        if (row.status == "0") {
                            status = "";
                        } else if (row.status == "1") {
                            status = "disabled";
                        }
                        return '<button  class="btn btn-success caozuo" ' + status + '  data-id="' + row.crmTaskScheduleId + '" style="cursor: pointer;" title="完成">点击完成</button>';
                    }
                }
                ],
                onPostBody: function (data, row) {
                    container.find('.fixed-table-toolbar').hide();
                    container.find('.bootstrap-table').height('350');
                },
            }
            container.find('#table').bootstrapTable(options);
            setTimeout(function () {
                var table_div = container.find('.bootstrap-table');
                var width = table_div.parent().width();
                table_div.height('350');
                table_div.width(width);
            }, 300);
        }

        initTable();


        //添加产品
        $(".addService").click(function () {
            $('#modal-table').modal({show: true, keyboard: false});
            $("#rmProductServiceCId").val("0");
            $("#crmModularId").val("0");
            $("#userId").val("0");
            $("#serviceTime").val("");
            $("#existQuest").val("");
        });

        //添加模块任务
        $("#submit").click(function () {
            var rmProductServiceCId = $("#rmProductServiceCId").val();
            var crmModularId = $("#crmModularId").val();
            var userId = $("#userId").val();
            var serviceTime = $("#serviceTime").val();
            var existQuest = $("#existQuest").val();
            if (rmProductServiceCId == "0") {
                toastr.error("请选择产品！");
                return false;
            }
            if (crmModularId == "0") {
                toastr.error("请选择模板！");
                return false;
            }
            if (userId == "0") {
                toastr.error("请选择客户！");
                return false;
            }
            if (serviceTime == "") {
                toastr.error("请输入服务时间！");
                return false;
            }
            if (existQuest == "") {
                toastr.error("请填写存在问题！");
                return false;
            }
            $.ajax({
                url: "/addCrmtaskschedule.do",
                data: {
                    rmProductServiceCId: rmProductServiceCId,
                    crmModularId: crmModularId,
                    userId: userId,
                    serviceTime: new Date(serviceTime),
                    existQuest: existQuest,
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data) {
                        $('#modal-table').modal('hide');
                        initTable();
                        toastr.success("操作成功！");
                    } else {
                        toastr.error("模板已存在！");
                    }
                },
                error: function (errMsg) {
                }
            });

        });

        //点击完成
        $(document).on("click", ".caozuo", function () {
            var id = $(this).attr("data-id");
            $.ajax({
                url: "/updateCrmtaskschedule.do",
                data: {
                    crmTaskScheduleId: id
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    toastr.success("操作成功！");
                    initTable();
                },
                error: function (errMsg) {
                }
            });

        });


    })


</script>
