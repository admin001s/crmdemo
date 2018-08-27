<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!-- /section:basics/sidebar -->
<link rel="stylesheet" href="assets/css/jquery-ui.min.css"/>
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css"/>
<div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb col-lg-12">
            <li>
                <i class="ace-icon fa fa-desktop home-icon"></i>
                <a href="javascript:;" id="shi">审批</a>
                <div class="col-lg-3">
                    <span></span></div>
            </li>
            <li>
                <a href="javascript:;">审批记录</a>
            </li>
        </ul><!-- /.breadcrumb -->
        <!-- /section:basics/content.searchbox -->
    </div>

    <div class="page-content-area">

        <div class="col-xs-12">
            <div class="row" style="margin-top: 20px">
                <div class="col-xs-12">
                    <div class="tabbable">
                        <ul class="nav nav-tabs" id="myTab">
                            <li class="active">
                                <a data-toggle="tab" href="#home" id="all">
                                    <i class="green ace-icon fa fa-home bigger-120"></i>
                                    全部审批
                                </a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" href="#home" id="my">
                                    <i class="green ace-icon fa fa-home bigger-120"></i>
                                    我的审批
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content col-lg-12">
                            <div id="home" class="tab-pane fade in active col-lg-12">
                                <ol>
                                    <div class="col-lg-12">
                                        <div class="col-lg-4">
                                            <label class="col-lg-4">签单编号：</label><input type="text" class="col-lg-6"
                                                                                        autocomplete="off"
                                                                                        id="orderId"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="col-lg-4">签单名称：</label><input type="text" class="col-lg-6"
                                                                                        autocomplete="off"
                                                                                        id="orderName"/>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="col-lg-4">审批人：</label><input type="text" class="col-lg-6"
                                                                                       autocomplete="off"
                                                                                       id="agentphone"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" style="margin-top: 20px">
                                        <div class="col-lg-4">
                                            <label class="col-lg-4">审批结果：</label><select class="col-lg-6"
                                                                                         id="recotdStatus">
                                            <option value="0"></option>
                                            <option value="2">未通过</option>
                                            <option value="3">通过</option>
                                        </select>
                                        </div>
                                        <div class="col-lg-5">
                                            <label class="col-lg-3">审批时间：</label>
                                            <div class="input-daterange input-group col-lg-9">
                                                <input type="text" class="form-control" name="start" id="indate"/>
                                                <span class="input-group-addon">
													<i class="fa fa-exchange"></i>
												</span>
                                                <input type="text" class=" form-control" name="end" id="outdate"/>
                                            </div>
                                        </div>
                                    </div>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- PAGE CONTENT BEGINS -->
            <div class="row" style="margin-top: 20px">
                <div class="col-xs-12" id="select-product-p1123">
                    <table id="table" style="text-align: center;">
                    </table>
                </div><!-- /.span -->
            </div><!-- /.row -->
        </div>
    </div>
    <div id="dialog-confirm" class="hide">
        <div class="space-6"></div>
        <p class="bigger-110 bolder center grey">
            <i class="ace-icon fa fa-hand-o-right blue bigger-120"></i>
            你确定要删除吗？
        </p>
    </div><!-- #dialog-confirm -->
</div>
<div class="modal fade bs-example-modal-lg" id="reserveModal"></div>

<!-- /.main-content -->

<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/js/bootstrap-table.js"></script>
<script src="assets/js/bootstrap-table-zh-CN.js"></script>
<!-- page specific plugin scripts -->
<script src="assets/js/jquery-ui.min.js"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
<script type="text/javascript">
    jQuery(function ($) {
        var container = $('#select-product-p1123');
        $("#shi").click(function () {
            $('#workstation').load("toSubject.do");
        });
        var userId = null;
        $('#indate').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            showMeridian: true
        }).on("change", function () {
            container.find('#table').bootstrapTable('refresh');
        });
        $('#outdate').datepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            showMeridian: true
        }).on("change", function () {
            container.find('#table').bootstrapTable('refresh');
        });
        $("#home input").keyup(function () {
            container.find('#table').bootstrapTable('refresh');
        });
        $("#all").click(function () {
            userId = null;
            container.find('#table').bootstrapTable('refresh');
        });
        $("#my").click(function () {
            userId =${user.userId};
            container.find('#table').bootstrapTable('refresh');
        });
        $("#recotdStatus").change(function(){
            container.find('#table').bootstrapTable('refresh');
        });
        function initTable() {
            container.find('#table').bootstrapTable('destroy');

            var options = {
                url: '/auditrecord.do', //请求后台的URL（*）
                method: 'post', //请求方式（*）
                contentType: "application/x-www-form-urlencoded",
                dataType: "json", //数据类型
                striped: false, //是否显示行间隔色
                pagination: false, //是否显示分页（*）
                queryParamsType: '',
                queryParams: function (param) {
                    var params = {
                        orderId: $("#orderId").val(),
                        orderName: $("#orderName").val(),
                        chineseName: $("#agentphone").val(),
                        indate: $("#indate").val(),
                        outdate: $("#outdate").val(),
                        recotdStatus: $("#recotdStatus").val(),
                        userId: userId
                    };
                    return params;
                },

                clickToSelect: true,
                undefinedText: "",
                pagination: true,//是否开启分页（*）
                locale: 'zh-CN',//中文支持
                pageNumber: 1,//初始化加载第一页，默认第一页
                pageSize: 20,//每页的记录行数（*）
                pageList: [],//可供选择的每页的行数（*）
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                showRefresh: false,//刷新按钮
                search: false,//是否显示表格搜索，此搜索是客户端搜索，不会进服务端
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                pageSize: 20,
                // pageList : [ 10, 20, 50 ], //可供选择的每页的行数（*）
                clickToSelect: false, //是否启用点击选中行
// 				height : 400, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "id", //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                //     exportTypes : [ 'excel' ], //导出文件类型
                columns: [{
                    field: 'crminfo.chineseName',
                    title: '审批人',
                    align: 'center'
                }, {
                    field: 'crmcustomerorder.orderName',
                    title: '签单名称',
                    align: 'center'
                }, {
                    field: 'crmcustomerorder.orderId',
                    title: '签单编号',
                    align: 'center'
                }, {
                    field: 'recotdStatus',
                    title: '审批结果',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (row.recotdStatus == 2) {
                            return "未通过";
                        }
                        if (row.recotdStatus == 3) {
                            return "通过";
                        }
                    }
                }, {
                    field: 'createdate',
                    title: '审批时间',
                    align: 'center'
                }],
                onPostBody: function (data, row) {
                    container.find('.fixed-table-toolbar').hide();
                    init();
                    container.find('.bootstrap-table').height('350');
                }
            }
            container.find('#table').bootstrapTable(options);

            function countFoot(value, field) {
                var count = 0;
                $(value).each(function (i) {
                    if (value[i][field] && parseInt(value[i][field])) {
                        count += parseInt(value[i][field]);
                    }
                });
                return count + '' || '';
            }

            setTimeout(function () {
                var table_div = container.find('.bootstrap-table');
                var width = table_div.parent().width();
                table_div.height('350');
                table_div.width(width);
                // initTableFootWidth();
            }, 300);
        }

        initTable(null);
        $(".tbl-search").click(function () {
            $(".table-responsive").slideDown("fast");
        })

        var oTable1 =
            $('#sample-table-2')
                .dataTable({
                    bAutoWidth: false,
                    bInfo: false,
                    "aoColumns": [
                        {"bSortable": false},
                        null,
                        null,
                        null,
                        null,
                        null,
                        {"bSortable": false},
                        null,
                        {"bSortable": false}
                    ],
                    "aaSorting": [],
                });

        $(document).on('click', 'th input:checkbox', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });
        });

        function init() {
            $(".follew").click(function () {
                $('#workstation').load("touserinformation.do", {id: $(this).attr("data-id")}, function () {

                });
            });
            $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
                _title: function (title) {
                    var $title = this.options.title || '&nbsp;'
                    if (("title_html" in this.options) && this.options.title_html == true)
                        title.html($title);
                    else title.text($title);
                }
            }));
        }
    })
</script>