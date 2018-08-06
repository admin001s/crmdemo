<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!-- /section:basics/sidebar -->
<div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb col-lg-12">
            <li class="col-lg-12">
                <div class="col-lg-8">
                    <i class="ace-icon fa fa-user home-icon"></i>
                    <a href="javascript:;">客户</a></div>
                <div class="col-lg-3">
                <span>
												<button class="btn btn-sm btn-success" id="add">添加客户</button>
											</span></div>
            </li>
        </ul><!-- /.breadcrumb -->


        <!-- /section:basics/content.searchbox -->
    </div>
    <div class="page-content-area">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
                <div class="col-xs-12" id="select-product-p1123">
                    <table id="table" style="text-align: center;">
                    </table>
                </div><!-- /.span -->
            </div><!-- /.row -->
        </div>
    </div>
</div>
<div class="modal fade bs-example-modal-lg" id="reserveModal"></div>

<!-- /.main-content -->
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/js/bootstrap-table.js"></script>
<script src="assets/js/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">
    $(function () {
        $("#breadcrumbs").find("#add").on("click", function () {
            $('#workstation').load("addcustomer.do");
        });
    });

    jQuery(function ($) {
        var container = $('#select-product-p1123');

        function initTable(name) {
            container.find('#table').bootstrapTable('destroy');
            var options = {
                url: '/getCustomersList.do', //请求后台的URL（*）
                method: 'post', //请求方式（*）
                contentType: "application/x-www-form-urlencoded",
                dataType: "json", //数据类型
                striped: false, //是否显示行间隔色
                pagination: true, //是否显示分页（*）
                queryParamsType: '',
                queryParams: function (param) {
                    var params = {
                        productName: name
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
                // sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
                // pageSize : 20,
                // pageList : [ 10, 20, 50 ], //可供选择的每页的行数（*）
                clickToSelect: false, //是否启用点击选中行
                height: 600, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "", //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                //     exportTypes : [ 'excel' ], //导出文件类型
                columns: [{
                    checkbox: true
                }, {
                    field: 'customersId',
                    title: '用户编号',
                    align: 'center'
                }, {
                    field: 'customersName',
                    title: '用户名称',
                    align: 'center',
                    formatter: function (value) {
                        return '<a href="#">' + value + '</a>';
                    }
                }, {
                    field: 'customersSex',
                    title: '性别',
                    align: 'center',
                    formatter: function (value) {
                        var sex = null;
                        if (value == "0") {
                            sex = "男";
                        } else if (value == "1") {
                            sex = "女";
                        }
                        return sex;
                    }
                }, {
                    field: 'provinceName',
                    title: '地区',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var provinceName = row.provinceName + "-" + row.cityName + "-" + row.mainsalesarea;
                        return provinceName;
                    }
                }, {
                    field: 'telephone',
                    title: '电话号码',
                    align: 'center'
                }, {
                    field: 'qq',
                    title: '联系QQ',
                    align: 'center'
                }, {
                    field: 'customerStatus',
                    title: '客户状态',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (value == "1") {
                            return '未分配<button class="btn btn-sm btn-primary fp" id="fp" data-id="' + row.id + '">分配</button>';
                        } else if (value == "2") {
                            return "已分配";
                        }
                    }
                }, {
                    field: 'crminfo.chineseName',
                    title: '跟进人',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (row.customerStatus == "1") {
                            return "暂无分配"
                        } else {
                            return row.crminfo.chineseName;
                        }
                    }
                }, {
                    field: 'crmcustomerdetailsList',
                    title: '最新跟进记录',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (row.crmcustomerdetailsList[0] != null) {
                            return '<i class="gj" data-id="' + row.id + '">' + row.crmcustomerdetailsList[0].remarks + '<button class="btn btn-sm btn-primary gja" data-name="' + row.customersName + '" data-id="' + row.id + '">+写跟进</button></i>';
                        } else {
                            return '<i class="gj" data-id="' + row.id + '">暂无跟进记录<button class="btn btn-sm btn-primary gja" data-name="' + row.customersName + '"  data-id="' + row.id + '">+写跟进</button></i>';
                        }
                    }
                }, {
                    field: 'crmcustomerdetailsList',
                    title: '跟进状态',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (row.crmcustomerdetailsList[0] != null) {
                            if (row.crmcustomerdetailsList[0].followupStatus == "1") {
                                return "初步接触";
                            } else if (row.crmcustomerdetailsList[0].followupStatus == "2") {
                                return "意向客户";
                            } else if (row.crmcustomerdetailsList[0].followupStatus == "3") {
                                return "报价客户";
                            } else if (row.crmcustomerdetailsList[0].followupStatus == "4") {
                                return "成交客户";
                            } else if (row.crmcustomerdetailsList[0].followupStatus == "5") {
                                return "搁置客户";
                            }
                        } else {
                            return "暂无跟进记录";
                        }
                    }
                }, {
                    field: 'isVip',
                    title: '用户类型',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (value == "0") {
                            return "黄金VIP";
                        } else if (value == "1") {
                            return "普通用户";
                        }
                    }
                }, {
                    field: 'email',
                    title: '联系邮箱',
                    align: 'center'
                }, {
                    field: 'customerSource',
                    title: '客户来源',
                    align: 'center'
                }, {
                    field: 'customerUrlSource',
                    title: '客户网址来源',
                    align: 'center'
                }, {
                    field: 'companywebsite',
                    title: '公司名称',
                    align: 'center'
                }, {
                    field: 'companyAddress',
                    title: '公司地址',
                    align: 'center'
                }, {
                    field: 'companydetails',
                    title: '公司详情',
                    align: 'center'
                }, {
                    field: 'createTime',
                    title: '创建时间',
                    align: 'center'
                }, {
                    field: 'updates',
                    title: '',
                    align: 'center',
                    formatter: function (value, row, index) {
                        return '<i class="glyphicon glyphicon-pencil bianji" data-id="' + row.id + '" style="cursor: pointer;" title="修改"></i>';
                    }
                }, {
                    field: 'del',
                    title: '',
                    align: 'center',
                    formatter: function (value, row, index) {
                        return '<i class="glyphicon glyphicon-trash shanchu" data-id="' + row.id + '" style="cursor: pointer;" title="删除"></i>';
                    }
                }],
                onPostBody: function (data, row) {
                    container.find('.fixed-table-toolbar').hide();

                    container.find('.bootstrap-table').height('350');
                }, onPostHeader: function (data) {

                }, onPostBody: function (data) {
                    initButton();
                }

            }
            container.find('#table').bootstrapTable(options);

            function initButton() {
                if (${user.roleId} == "1" || ${user.roleId} == "2" || ${user.roleId} == "3" || ${user.roleId} == "4"
            )
                {
                    $(".bianji").on("click", function () {
                        $('#reserveModal').load("updateCustomer.do", {
                            id: $(this).attr("data-id")
                        }, function (a, b, c) {
                            $('#reserveModal').modal('show');
                        });
                    });
                }
                ;
                $(".shanchu").on("click", function () {
                    if (${user.roleId} == "1" || ${user.roleId} == "2" || ${user.roleId} == "3" || ${user.roleId} == "4"
                )
                    {
                        $.ajax({
                            url: "deleteCustomer.do",
                            data: {
                                id: $(this).attr("data-id")
                            },
                            type: "post",
                            dataType: "JSON",
                            success: function (data) {
                                if(data){
                                    container.find('#table').bootstrapTable('refresh');
                                }
                            },
                            error: function (errMsg) {
                            }
                        });
                    }
                });
                $(".gja").hide();
                gj();
                $(".fp").unbind().on("click", function () {
                    alert($(this).attr("data-name"));
                    $('#reserveModal').load("toChoice.do", {
                        id: $(this).attr("data-id")
                    }, function (a, b, c) {
                        $('#reserveModal').modal('show');
                    });
                });

                $(".gj").unbind().hover(function () {
                    $(this).children(".gja").show();
                }, function () {
                    $(this).children(".gja").hide();
                })
            }

            function gj() {
                $(".gja").unbind().click(function () {
                    $('#reserveModal').load("followup.do", {
                        id: $(this).attr("data-id"),
                        customersName: $(this).attr("data-name")
                    }, function (a, b, c) {
                        $('#reserveModal').modal('show');
                    });
                    $(this).children(".gja").hide();
                });
            }

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


    })
</script>