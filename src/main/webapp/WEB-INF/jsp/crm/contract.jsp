<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!-- /section:basics/sidebar -->
<link rel="stylesheet" href="assets/css/jquery-ui.min.css"/>
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css"/>
<div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb col-lg-12">
            <li class="col-lg-12">
                <div class="col-lg-8">
                    <i class="ace-icon fa fa-desktop home-icon"></i>
                    <a href="javascript:;">签单</a></div>
                <div class="col-lg-3">
                <span>
												<button class="btn btn-sm btn-success" id="add">新建签单</button>
											</span></div>
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
                                    全部签单
                                </a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" href="#home" id="my">
                                    <i class="green ace-icon fa fa-home bigger-120"></i>
                                    我的签单
                                </a>
                            </li>
                            <li class="">
                                <a data-toggle="tab" href="#home" id="sh">
                                    <i class="green ace-icon fa fa-home bigger-120"></i>
                                    未通过审核签单
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
                                            <label class="col-lg-4">负责人：</label><input type="text" class="col-lg-6"
                                                                                       autocomplete="off"
                                                                                       id="agentphone"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" style="margin-top: 20px">
                                        <div class="col-lg-4">
                                            <label class="col-lg-4">对应客户：</label><input type="text" class="col-lg-6"
                                                                                        autocomplete="off"
                                                                                        id="agentQq"/>
                                        </div>
                                        <div class="col-lg-5">
                                            <label class="col-lg-3">日期：</label>
                                            <div class="input-daterange input-group col-lg-9">
                                                <input type="text" class="form-control" name="start" id="indate"/>
                                                <span class="input-group-addon">
													<i class="fa fa-exchange"></i>
												</span>

                                                <input type="text" class=" form-control" name="end" id="outdate"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12" style="margin-top: 20px" id="tj">
                                        <div class="col-lg-3">
                                            <label class="col-lg-6">已选<span style="color: #0000FF" id="size">0</span>份签单</label>
                                            <button class="btn btn-sm btn-light col-lg-5" id="transfer"><i
                                                    class="fa fa-mail-forward"></i>再次提交
                                            </button>
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
    $(function () {
        /*$("#breadcrumbs").find("#add").on("click", function () {
            $('#reserveModal').load("addAgent.do", {}, function (a, b, c) {
                $('#reserveModal').modal('show');
            });
        });*/

        $("#add").click(function () {
            $('#workstation').load("toContract_add.do");
        });


    });

    jQuery(function ($) {
        var container = $('#select-product-p1123');
        var userId = null;
        var status = null;
        $("#tj").hide();
        $("#sh").click(function () {
            $("#tj").show();
            status = 2;
            userId =${user.userId};
            container.find('#table').bootstrapTable('refresh');
        });
        $("#my").click(function () {
            $("#tj").hide();
            userId =${user.userId};
            status = null;
            container.find('#table').bootstrapTable('refresh');
        });
        $("#all").click(function () {
            $("#tj").hide();
            userId = null;
            status = null;
            container.find('#table').bootstrapTable('refresh');
        });
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
        $("#transfer").click(function () {
            var agents = container.find('#table').bootstrapTable('getSelections');
            if (agents.length > 0) {
                var arr = [];
                $(agents).each(function () {
                    arr.push(this.id);
                });
                $.ajax({
                    url: "agains.do",
                    data: {
                        id: arr,
                        status: 1,
                    },
                    async: false,
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        if (data) {
                            container.find('#table').bootstrapTable('refresh');
                        } else {
                            alert("失败");
                        }
                    },
                    error: function (errMsg) {
                    }
                });
            }
        });
        $("#home input").keyup(function () {
            container.find('#table').bootstrapTable('refresh');
        });

        function initTable() {
            container.find('#table').bootstrapTable('destroy');

            var options = {
                url: '/contract.do', //请求后台的URL（*）
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
                        customersName: $("#agentQq").val(),
                        indate: $("#indate").val(),
                        outdate: $("#outdate").val(),
                        userId: userId,
                        signingStatus: status,
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
                    checkbox: true
                }, {
                    field: 'orderId',
                    title: '签单编号',
                    align: 'center'
                }, {
                    field: 'orderName',
                    title: '签单名称',
                    align: 'center'
                }, {
                    field: 'crminfo.chineseName',
                    title: '负责人',
                    align: 'center'
                }, {
                    field: 'crmcustomersinfo.customersName',
                    title: '对应客户',
                    align: 'center'
                }, {
                    field: 'signingStatus',
                    title: '签单状态',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var sex = null;
                        if (value == "1") {
                            sex = "待审核";
                        } else if (value == "2") {
                            sex = '不通过<button button class="btn btn-sm btn-primary zctj" data-id="' + row.id + '">再次提交</button>';
                        } else if (value == "3") {
                            sex = "通过";
                        }
                        return sex;
                    }
                }, {
                    field: 'signingtypeId',
                    title: '签单类型',
                    align: 'center',
                    formatter: function (value) {
                        var sex = null;
                        if (value == "1") {
                            sex = "直销类型";
                        } else if (value == "2") {
                            sex = "代理类型";
                        } else if (value == "2") {
                            sex = "采购类型";
                        } else if (value == "4") {
                            sex = "服务类型";
                        } else if (value == "5") {
                            sex = "其他";
                        }
                        return sex;
                    }
                }, {
                    field: 'money',
                    title: '金额',
                    align: 'center'
                }, {
                    field: 'signingTime',
                    title: '创建时间',
                    align: 'center'
                }, {
                    field: 'updates',
                    title: '',
                    align: 'center',
                    formatter: function (value, row, index) {
                        return '<i class="glyphicon glyphicon-pencil bianji" data-id="' + row.id + '" style="cursor: pointer;" data-status="'+row.signingStatus+'" title="修改"></i>';
                    }
                }, {
                    field: 'del',
                    title: '',
                    align: 'center',
                    formatter: function (value, row, index) {
                        return '<i class="glyphicon glyphicon-trash shanchu" data-id="' + row.id + '" style="cursor: pointer;" data-status="'+row.signingStatus+'" title="删除 "></i>';
                    }
                }],
                onPostBody: function (data, row) {
                    container.find('.fixed-table-toolbar').hide();
                    init();
                    container.find('.bootstrap-table').height('350');
                }, onCheck: function () {
                    var agents = container.find('#table').bootstrapTable('getSelections');
                    $("#size").text(agents.length);
                }, onUncheck: function () {
                    var agents = container.find('#table').bootstrapTable('getSelections');
                    $("#size").text(agents.length);
                }, onCheckAll: function () {
                    var agents = container.find('#table').bootstrapTable('getSelections');
                    $("#size").text(agents.length);
                }, onUncheckAll: function () {
                    var agents = container.find('#table').bootstrapTable('getSelections');
                    $("#size").text(agents.length);
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

        function del(id) {
            $.ajax({
                url: "delcrmcustomerorder.do",
                data: {
                    id: id
                },
                async: false,
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data) {
                        alert("成功");
                    } else {
                        alert("失败");
                    }
                },
                error: function (errMsg) {
                }
            });
        }

        function init() {
            $(".bianji").unbind().click(function () {
                if($(this).attr("data-status")=="2"){
                    $('#reserveModal').load('toContractUpdate.do', {id: $(this).attr("data-id")}, function (a, b, c) {
                        $('#reserveModal').modal('show');
                    });
                }else {
                    alert("不可修改!");
                }
            });

            $(".zctj").unbind().click(function () {
                $.ajax({
                    url: "again.do",
                    data: {
                        id: $(this).attr("data-id"),
                        status: 1,
                    },
                    async: false,
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        if (data) {
                            container.find('#table').bootstrapTable('refresh');
                        } else {
                            alert("失败");
                        }
                    },
                    error: function (errMsg) {
                    }
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
            $(".shanchu").unbind().click(function (e) {
                var _this = $(this);

                if ($(this).attr("data-status")=="2") {
                    e.preventDefault();
                    $("#dialog-confirm").removeClass('hide').dialog({
                        resizable: false,
                        modal: true,
                        title: "<div class='widget-header'><h4 class='smaller'><i class='ace-icon fa fa-exclamation-triangle red'></i>提示</h4></div>",
                        title_html: true,
                        buttons: [
                            {
                                html: "<i class='ace-icon fa fa-trash-o bigger-110'></i>&nbsp; 删除",
                                "class": "btn btn-danger btn-xs",
                                click: function () {
                                    del(_this.attr("data-id"));
                                    $(this).dialog("close");
                                    $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                                }
                            }
                            ,
                            {
                                html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
                                "class": "btn btn-xs",
                                click: function () {
                                    $(this).dialog("close");
                                }
                            }
                        ]
                    });
                } else {
                    alert("不能删除！");
                }
            });
        }
    })
</script>