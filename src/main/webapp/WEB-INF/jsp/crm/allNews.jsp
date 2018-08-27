<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!-- /section:basics/sidebar -->
<link rel="stylesheet" href="assets/css/jquery-ui.min.css"/>
<div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb col-lg-12">
            <li class="col-lg-12">
                <div class="col-lg-8">
                    <i class="ace-icon fa fa-desktop home-icon"></i>
                    <a href="javascript:;">提醒</a></div>
            </li>
        </ul><!-- /.breadcrumb -->
        <!-- /section:basics/content.searchbox -->
    </div>

    <div class="page-content-area">

        <div class="col-xs-12">
            <div class="row" style="margin-top: 20px">
                <div class="col-lg-6">
                    <div class="col-lg-4">
                        <button class="btn btn-sm btn-info col-lg-10" id="yd"><i
                                class="fa fa-mail-forward"></i>全部标记为已读
                        </button>
                    </div>
                    <div class="col-lg-3">
                        <button class="btn btn-sm btn-danger col-lg-10" id="del"><i
                                class="fa fa-mail-forward"></i>清除所有
                        </button>
                    </div>
                </div>
            </div>
            <!-- PAGE CONTENT BEGINS -->
            <div class="row">
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
<script type="text/javascript">
    $(function () {
        /*$("#breadcrumbs").find("#add").on("click", function () {
            $('#reserveModal').load("addAgent.do", {}, function (a, b, c) {
                $('#reserveModal').modal('show');
            });
        });*/

    });

    jQuery(function ($) {
        var container = $('#select-product-p1123');
        $("#yd").click(function(){
            del(2);
            getMation();
            container.find('#table').bootstrapTable('refresh');
        });
        $("#del").click(function(){
            del(3);
            getMation();
            container.find('#table').bootstrapTable('refresh');
        });
        function del(mationStatus) {
            $.ajax({
                url: "upAllNewsStatus.do",
                data: {
                    mationStatus: mationStatus
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
        function initTable() {
            container.find('#table').bootstrapTable('destroy');
            var options = {
                url: '/allNews.do', //请求后台的URL（*）
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
                    field: 'title',
                    title: '提醒',
                    align: 'left',
                    formatter: function (value, row, index) {
                        var sex = null;
                        if (row.mationStatus == "1") {
                            sex = '<a href="javascript:;" data-id1="' + row.mationId + '" data-id="' + row.customerId + '" class="ck"><span class="pink" style="font-weight:bold "><i class="ace-icon fa  fa-envelope-o"></i>' + value + '</span></a><span style="float:right">' + row.createTime + '</span>';
                        } else if (row.mationStatus == "2") {
                            sex = '<a href="javascript:;" data-id="' + row.customerId + '" class="ck"><span class="pink">' + value + '</span></a><span style="float:right">' + row.createTime + '</span>';
                        }
                        return sex;
                    }
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


        function getMation() {
            $.ajax({
                url: "getMation.do",
                data: {},
                async: false,
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if(data.length>8){
                        $("#fa").text(8);
                        $("#fa1").text(8);
                    }else {
                        $("#fa").text(data.length);
                        $("#fa1").text(data.length);
                    }
                    $("#ru").empty();
                    var _html='';
                    $(data).each(function (i) {
                        if(i<8){
                            _html+='<li>\n' +
                                '                                    <a href="javascript:;" data-id="'+this.customerId+'" data-url="tofollowUpDeltail.do"\n' +
                                '                                       class="toDetailed" data-id1="'+this.mationId+'">\n' +
                                '                                            <span class="msg-body">\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t<span class="msg-title">\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t警告:您负责的<span class="blue">'+this.title+'</span>\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t</span>\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t</span>\n' +
                                '                                    </a>\n' +
                                '                                </li>'
                        }
                    });
                    $("#ru").append(_html);
                    rep();
                },
                error: function (errMsg) {
                }
            });

        }
        function init() {
            $(".ck").unbind().click(function () {
                $('#workstation').load("tofollowUpDeltail.do", {
                    id: $(this).attr("data-id"),
                    id1: $(this).attr("data-id1")
                }, function () {
                    getMation();
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