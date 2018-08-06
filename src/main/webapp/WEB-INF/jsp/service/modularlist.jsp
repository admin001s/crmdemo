<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

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
                模块管理
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
                                        添加模板
                                    </div>
                                </div>


                                <div style="padding: 50px 50px 10px;">
                                    <form class="bs-example bs-example-form" role="form">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">模板姓名：</span>
                                            <input type="text" class="form-control" id="modularName" value=""
                                                   placeholder="请输入模板姓名">
                                        </div>
                                        <br>
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon">选择产品：</span>
                                            <div class="form-group">
                                                <select class="form-control" style="height: 50px" id="crmProductServiceId">
                                                    <option value="0" >--请选择--</option>
                                                    <c:forEach var="fff" items="${crmproductList}">
                                                        <option value="${fff.crmProductServiceId}" >${fff.name}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
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
                url: '/selectcrmmodular.do', //请求后台的URL（*）
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
                // exportTypes : [ 'excel' ], //导出文件类型
                columns: [{
                    field: 'i',
                    title: '序号',
                    align: 'center'
                }, {
                    field: 'modularName',
                    title: '模板名称',
                    align: 'center'
                }, {
                    field: 'proname',
                    title: '产品名称',
                    align: 'center'
                },
                    {
                        field: 'caozuo',
                        title: '修改',
                        align: 'center',
                        formatter: function (value, row, index) {
                            return '<i class="glyphicon glyphicon-pencil caozuo" data-id="' + row.crmModularId + '" style="cursor: pointer;" title="修改"></i>';
                        }
                    },
                    {
                        field: 'del',
                        title: '删除',
                        align: 'center',
                        formatter: function (value, row, index) {
                            return '<i class="glyphicon glyphicon-remove del" data-id="' + row.crmModularId + '" style="cursor: pointer;" title="操作"></i>';
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

        initTable();

        //查看服务
        $(document).on("click", ".caozuo", function () {
            var id = $(this).attr("data-id");
            $('#modal-table').modal({show:true, keyboard:false});
            $.ajax({
                url: "/selectcrmmodular.do",
                data: {
                    id: id
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    $("#modularName").val(data[0].modularName);
                    $("#crmProductServiceId").val(data[0].crmProductServiceId);
                    $("#submit").val(data[0].crmModularId);
                },
                error: function (errMsg) {
                }
            });

        });
        //添加产品
        $(".addService").click(function () {
            $('#modal-table').modal("show");
            $("#modularName").val("");
            $("#crmProductServiceId").val("0");
            $("#submit").val("0");
        });
        //删除客服人员
        $(document).on("click", ".del", function () {
            var id = $(this).attr("data-id");
            $.ajax({
                url: "/delcrmmodular.do",
                data: {
                    id: id
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data) {
                        toastr.success("删除成功！");
                        initTable();
                    } else {
                        toastr.error("删除失败！");
                    }
                },
                error: function (errMsg) {
                }
            });
        });

        //添加产品
        $("#submit").click(function () {
            var modularName = $("#modularName").val();
             if(modularName==''){
                 toastr.error("请输入模板名字！");
                 return false;
             }
            var crmProductServiceId = $("#crmProductServiceId").val();
            if(crmProductServiceId=="0"){
                toastr.error("请选择产品！");
                return false;
            }
            var submit = $("#submit").val();
            var url;
            if (submit == "0") {
                url = "/addcrmmodular.do";
            } else {
                url = "/updatecrmmodular.do";
            }
            $.ajax({
                url: url,
                data: {
                    crmModularId: submit,
                    modularName: modularName,
                    crmProductServiceId: crmProductServiceId
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

        })


    })


</script>
