<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!-- /section:basics/sidebar -->
<link rel="stylesheet" href="assets/css/jquery-ui.min.css" />
<div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb col-lg-12">
            <li class="col-lg-12">
                <div class="col-lg-8">
                    <i class="ace-icon fa fa-desktop home-icon"></i>
                    <a href="javascript:;">代理商</a></div>
                <div class="col-lg-3">
                <span>
												<button class="btn btn-sm btn-success" id="add">添加代理商</button>
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

        $("#add").click(function(){
            $('#workstation').load("addAgent.do");
        });
    });

    jQuery(function ($) {
        var container = $('#select-product-p1123');

        function initTable(name) {
            container.find('#table').bootstrapTable('destroy');
            var options = {
                url: '/getAgentList.do', //请求后台的URL（*）
                method: 'post', //请求方式（*）
                contentType: "application/x-www-form-urlencoded",
                dataType: "json", //数据类型
                striped: false, //是否显示行间隔色
                pagination: false, //是否显示分页（*）
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
                showRefresh: true,//刷新按钮
                search: true,//是否显示表格搜索，此搜索是客户端搜索，不会进服务端
                // sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
                // pageSize : 20,
                // pageList : [ 10, 20, 50 ], //可供选择的每页的行数（*）
                clickToSelect: true, //是否启用点击选中行
// 				height : 400, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "", //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                //     exportTypes : [ 'excel' ], //导出文件类型
                columns: [ {
                    checkbox: true
                },{
                    field: 'agentsId',
                    title: '代理商编号',
                    align: 'center'
                }, {
                    field: 'agentName',
                    title: '联系人姓名',
                    align: 'center'
                },{
                    field: 'agentsex',
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
                    field: 'agentaddress',
                    title: '地址',
                    align: 'center'
                }, {
                    field: 'agentphone',
                    title: '电话号码',
                    align: 'center'
                }, {
                    field: 'agentQq',
                    title: '联系QQ',
                    align: 'center'
                },  {
                    field: 'agentemail',
                    title: '邮箱',
                    align: 'center'
                }, {
                    field : 'updates',
                    title : '',
                    align : 'center',
                    formatter : function(value, row, index) {
                        return '<i class="glyphicon glyphicon-pencil bianji" data-id="' + row.id + '" style="cursor: pointer;" title="修改"></i>';
                    }
                }, {
                    field : 'del',
                    title : '',
                    align : 'center',
                    formatter : function(value, row, index) {
                        return '<i class="glyphicon glyphicon-trash shanchu" data-id="' + row.id +  '" style="cursor: pointer;" title="删除 "></i>';
                    }
                }],
                onPostBody: function (data, row) {
                    container.find('.fixed-table-toolbar').hide();
                    init();
                    container.find('.bootstrap-table').height('350');
                },

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
        function del(id){
            $.ajax({
                url: "delAgents.do",
                data: {
                    id: id
                },
                async: false,
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if(data){
                        alert("成功");
                    }else {
                        alert("失败");
                    }
                },
                error: function (errMsg) {
                }
            });
        }
        function init(){
            $(".bianji").unbind().click(function(){
                $('#reserveModal').load('agentUpdate.do', {id:$(this).attr("data-id")}, function(a, b, c) {
                    $('#reserveModal').modal('show');
                });
            });

            $.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
                _title: function(title) {
                    var $title = this.options.title || '&nbsp;'
                    if( ("title_html" in this.options) && this.options.title_html == true )
                        title.html($title);
                    else title.text($title);
                }
            }));
            $(".shanchu").unbind().click(function(e){
                var _this=$(this);
                e.preventDefault();
                $( "#dialog-confirm" ).removeClass('hide').dialog({
                    resizable: false,
                    modal: true,
                    title: "<div class='widget-header'><h4 class='smaller'><i class='ace-icon fa fa-exclamation-triangle red'></i>提示</h4></div>",
                    title_html: true,
                    buttons: [
                        {
                            html: "<i class='ace-icon fa fa-trash-o bigger-110'></i>&nbsp; 删除",
                            "class" : "btn btn-danger btn-xs",
                            click: function() {
                                del(_this.attr("data-id"));
                                $( this ).dialog( "close" );
                                $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                            }
                        }
                        ,
                        {
                            html: "<i class='ace-icon fa fa-times bigger-110'></i>&nbsp; 取消",
                            "class" : "btn btn-xs",
                            click: function() {
                                $( this ).dialog( "close" );
                            }
                        }
                    ]
                });
            });
        }
    })
</script>