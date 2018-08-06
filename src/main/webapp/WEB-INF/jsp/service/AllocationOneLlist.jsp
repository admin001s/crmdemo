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
                服务
            </li>
            <li>
                分配
            </li>
        </ul><!-- /.breadcrumb -->
    </div>

    <div style="margin: 25px">
        <button type="button" class="btn btn-info btn-lg allopen" value="all"><font
                style="vertical-align: inherit;"><font style="vertical-align: inherit;">全部</font></font></button>
        <button type="button" class="btn btn-info btn-lg allopen" value="yi"><font
                style="vertical-align: inherit;"><font style="vertical-align: inherit;">已分配</font></font></button>
        <button type="button" class="btn btn-info btn-lg allopen" value="wei"><font
                style="vertical-align: inherit;"><font style="vertical-align: inherit;">未分配</font></font></button>
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
                    </div><!-- /.row -->


                    <div id="modal-table" class="modal fade" tabindex="-1">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header no-padding">
                                    <div class="table-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            <span class="white">&times;</span>
                                        </button>
                                        客服人员
                                    </div>
                                </div>

                                <div class="modal-body no-padding" id="select-product">
                                    <h4 style="margin: 5px">查找:<input type="text" value="" id="allname">
                                        <button type="button" class="btn btn-success btn-xs add"><font
                                                style="vertical-align: inherit;"><font style="vertical-align: inherit;">添加</font></font>
                                        </button>
                                    </h4>
                                    <table id="tabletwo">


                                    </table>
                                </div><!-- end of panel -->


                            </div>

                            <div class="modal-footer no-margin-top">

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

        //显示已开通服务的客户
        function initTable(name) {
            container.find('#table').bootstrapTable('destroy');
            var options = {
                url: '/yesOpenserviceall', //请求后台的URL（*）
                method: 'post', //请求方式（*）
                contentType: "application/x-www-form-urlencoded",
                dataType: "json", //数据类型
                striped: false, //是否显示行间隔色
                pagination: false, //是否显示分页（*）
                queryParamsType: '',
                queryParams: function (param) {
                    var params = {
                        fen: name
                    };
                    return params;
                },

                clickToSelect: true,
                undefinedText: "",
                pagination: true,//是否开启分页（*）
                locale: 'zh-CN',//中文支持
                pageNumber: 1,//初始化加载第一页，默认第一页
                pageSize: 10,//每页的记录行数（*）
                pageList: [5, 10, 20],//可供选择的每页的行数（*）
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                showRefresh: true,//刷新按钮
                search: true,//是否显示表格搜索，此搜索是客户端搜索，不会进服务端
                // sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
                // pageSize : 20,
                // pageList : [ 10, 20, 50 ], //可供选择的每页的行数（*）
                clickToSelect: true, //是否启用点击选中行
                height: 650, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "", //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                //     exportTypes : [ 'excel' ], //导出文件类型
                columns: [{
                    field: 'i',
                    title: '序号',
                    align: 'center'
                }, {
                    field: 'crmcustomersinfoid',
                    title: '客户编号',
                    align: 'center'
                }, {
                    field: 'customersName',
                    title: '客户姓名',
                    align: 'center'
                }
                    , {
                        field: 'isopen',
                        title: '是否开通',
                        align: 'center',
                        formatter: function (value) {
                            var bb = null;
                            if (value == "1") {
                                bb = "已开通";
                            }
                            return bb;
                        }
                    }, {
                        field: 'openserviceTypeall',
                        title: '服务类型',
                        align: 'center'
                    }, {
                        field: 'cuname',
                        title: '客服',
                        align: 'center'
                    },
                    {
                        field: 'caozuo',
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            return '<i class="glyphicon glyphicon-pencil caozuo"  data-id="' + row.crmcustomersinfoid + '" style="cursor: pointer;" title="操作"></i>';
                        }
                    },
                    {
                        field: 'delfu',
                        title: '删除',
                        align: 'center',
                        formatter: function (value, row, index) {
                            return '<i class="glyphicon glyphicon-remove delfu"  data-id="' + row.crmcustomersinfoid + '" style="cursor: pointer;" title="操作"></i>';
                        }
                    }],
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

        initTable(null);

        //查看服务人员
        var container2 = $('#select-product');

        function initTable2(name) {
            container2.find('#tabletwo').bootstrapTable('destroy');
            var options = {
                url: '/getCustomerservice', //请求后台的URL（*）
                method: 'post', //请求方式（*）
                contentType: "application/x-www-form-urlencoded",
                dataType: "json", //数据类型
                striped: false, //是否显示行间隔色
                pagination: false, //是否显示分页（*）
                queryParamsType: '',
                queryParams: function (param) {
                    var params = {
                        name: name
                    };
                    return params;
                },

                clickToSelect: true,
                undefinedText: "",
                pagination: true,//是否开启分页（*）
                locale: 'zh-CN',//中文支持
                pageNumber: 1,//初始化加载第一页，默认第一页
                pageSize: 10,//每页的记录行数（*）
                pageList: [5, 10, 20],//可供选择的每页的行数（*）
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                showRefresh: true,//刷新按钮
                search: true,//是否显示表格搜索，此搜索是客户端搜索，不会进服务端
                clickToSelect: true, //是否启用点击选中行
                // height: 650, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "", //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                //     exportTypes : [ 'excel' ], //导出文件类型
                columns: [{
                    field: 'i',
                    title: '序号',
                    align: 'center'
                }, {
                    field: 'name',
                    title: '客服名字',
                    align: 'center'
                },
                    {
                        field: 'del',
                        title: '删除',
                        align: 'center',
                        formatter: function (value, row, index) {
                            return '<i class="glyphicon glyphicon-remove delpeo"  data-id="' + row.id + '" style="cursor: pointer;" title="删除"></i>';
                        }
                    }],
                onDblClickRow: function (row) {

                    $.ajax({
                        url: "/updateOpenserService",
                        data: {
                            customerservice: row.id,
                            id: $("#id").val()
                        },
                        type: "post",
                        dataType: "JSON",
                        success: function (data) {
                            if (data) {
                                $('#modal-table').modal('hide');
                                initTable(null);
                                toastr.success("添加成功！");

                            } else {
                                toastr.error("添加失败！");
                            }
                        },
                        error: function (errMsg) {
                        }
                    });
                },

                onPostBody: function (data, row) {
                    container2.find('.fixed-table-toolbar').hide();
                    container2.find('.bootstrap-table').height('350');
                },
            }
            container2.find('#tabletwo').bootstrapTable(options);
            setTimeout(function () {
                var table_div = container2.find('.bootstrap-table');
                var width = table_div.parent().width();
                table_div.height('350');
                table_div.width(width);
            }, 300);
        }

        //模糊查询服务人员
        $("#allname").keyup(function () {
            var name = $("#allname").val();
            initTable2(name);
        })
        //查看服务
        $(document).on("click", ".caozuo", function () {
            var id = $(this).attr("data-id");
            $("#id").val(id);
            initTable2(null);
            $('#modal-table').modal({
                show: true,
                keyboard: false
            });
        });
        //添加客服
        $(".add").click(function () {
            var name = $("#allname").val()
            $.ajax({
                url: "/insertCustomerservice",
                data: {
                    name: $("#allname").val(),
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data) {
                        initTable2(null);
                        toastr.success("添加成功！");

                    } else {
                        toastr.error("客服已存在！");
                    }

                },
                error: function (errMsg) {
                }
            });
        })
       //删除客服人员
        $(document).on("click", ".delpeo", function () {
            var id = $(this).attr("data-id");
            $.ajax({
                url: "/delCustomerservice",
                data: {
                    id: id
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data) {
                        initTable2(null);
                        toastr.success("删除成功！");
                    } else {
                        toastr.error("删除失败！");
                    }
                },
                error: function (errMsg) {
                }
            });
        });
        //为客户删除客服人员
        $(document).on("click", ".delfu", function () {
            var id = $(this).attr("data-id");
            var customerservice = '';
            $.ajax({
                url: "/updateOpenserService",
                data: {
                    customerservice: customerservice,
                    id: id
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data) {
                        $('#modal-table').modal('hide');
                        initTable(null);
                        toastr.success("删除成功！");

                    } else {
                        toastr.error("删除失败！");
                    }
                },
                error: function (errMsg) {
                }
            });

        });
        //查看所有用户 查看已开通服务用户 查看没有开通服务用户
        $(".allopen").click(function () {
            var open = $(this).val();
            initTable(open);
        })


    })


</script>
