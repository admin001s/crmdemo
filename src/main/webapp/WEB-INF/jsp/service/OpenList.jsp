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
                服务
            </li>
            <li>
                开通服务
            </li>

        </ul><!-- /.breadcrumb -->
    </div>


    <div style="margin: 25px">
        <button type="button" class="btn btn-info btn-lg allopen" value="all"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">全部</font></font></button>
        <button type="button" class="btn btn-info btn-lg allopen" value="yi"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">已开通</font></font></button>
        <button type="button" class="btn btn-info btn-lg allopen" value="wei"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">未开通</font></font></button>
    </div>

    <div class="page-content">

        <!-- /section:settings.box -->
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
                                            服务开通
                                        </div>
                                    </div>

                                    <div class="modal-body no-padding">

                                        <table class="table table-bordered table-hover">
                                            <thead>
                                            <tr class="success">
                                                <th>编号</th>
                                                <th>产品名字</th>
                                                <th>描述</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="fff" items="${crmproductserviceList}">
                                                <tr>
                                                    <td><input type="checkbox" name="checkItem" value="${fff.crmProductServiceId}"/></td>
                                                    <td>${fff.crmProductServiceId}</td>
                                                    <td>${fff.name}</td>
                                                    <td>${fff.detail}</td>
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div><!-- end of panel -->



                                </div>

                                <div class="modal-footer no-margin-top">
                                    <button class="btn btn-sm btn-success pull-left" data-dismiss="modal" id="kai">
                                        <i class="glyphicon glyphicon-ok"></i>
                                        开通
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
    </div><!-- /.page-content -->
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
        //显示客户
        function initTable(name) {
            container.find('#table').bootstrapTable('destroy');
            var options = {
                url: '/getcrmcustomersinfo', //请求后台的URL（*）
                method: 'post', //请求方式（*）
                contentType: "application/x-www-form-urlencoded",
                dataType: "json", //数据类型
                striped: false, //是否显示行间隔色
                pagination: false, //是否显示分页（*）
                queryParamsType: '',
                queryParams: function (param) {
                    var params = {
                        open: name
                    };
                    return params;
                },

                clickToSelect: true,
                undefinedText: "",
                pagination: true,//是否开启分页（*）
                locale: 'zh-CN',//中文支持
                pageNumber: 1,//初始化加载第一页，默认第一页
                pageSize: 3,//每页的记录行数（*）
                pageList: [2, 3, 4],//可供选择的每页的行数（*）
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                showRefresh: true,//刷新按钮
                search: true,//是否显示表格搜索，此搜索是客户端搜索，不会进服务端
                // sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
                // pageSize : 20,
                // pageList : [ 10, 20, 50 ], //可供选择的每页的行数（*）
                clickToSelect: true, //是否启用点击选中行
                height : 650, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "", //每一行的唯一标识，一般为主键列
                showExport: true,
                exportDataType: 'all',
                //     exportTypes : [ 'excel' ], //导出文件类型
                columns: [{
                    field: 'i',
                    title: '序号',
                    align: 'center'
                }, {
                    field: 'customersId',
                    title: '客户编号',
                    align: 'center'
                }, {
                    field: 'customersName',
                    title: '客户姓名',
                    align: 'center'
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
                    title: '省名',
                    align: 'center'
                }, {
                    field: 'mobilephone',
                    title: '手机号码',
                    align: 'center'
                }, {
                    field: 'customerStatus',
                    title: '客户状态',
                    align: 'center'
                },
                    {
                        field: 'caozuo',
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            return '<i class="glyphicon glyphicon-pencil caozuo"  data-id="' + row.customersId + '" style="cursor: pointer;" title="操作"></i>';
                        }//href="#modal-table  data-toggle="modal""
                    }],
                onPostBody: function (data, row) {
                    container.find('.fixed-table-toolbar').hide();
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
            }, 300);
        }

        initTable(null);
        //查看服务
        $(document).on("click", ".caozuo", function () {
            $("input[name='checkAll']:checked").prop("checked",false);
            $("input[name='checkItem']:checked").prop("checked",false);
            $("#id").val($(this).attr("data-id"));
            $('#modal-table').modal({
                show: true,
                keyboard: true
            });
            $.ajax({
                url : "/yesOpenserviceService",
                data : {
                    crmcustomersinfoid: $("#id").val(),
                },
                type : "post",
                dataType : "JSON",
                success : function(data) {

                    $(data).each(function(i,val) {
                        $(".modal-body :checkbox[value='"+val+"']").prop("checked",true);
                    });
                },
                error : function(errMsg) {}
            });

        });

        //查看所有用户 查看已开通服务用户 查看没有开通服务用户
        $(".allopen").click(function () {
            var open =$(this).val();
            initTable(open);
        })

        //点击开通
        $("#kai").click(function () {
            var checkedList = new Array();
            $("input[name='checkItem']:checked").each(function() {
                checkedList.push($(this).val());
            });
            $.ajax({
                url : "/isOpenserviceService",
                data : {
                    crmcustomersinfoid: $("#id").val(),
                    checkedList: checkedList
                },
                type : "post",
                dataType : "JSON",
                success : function(data) {
                    if (data) {
                        toastr.success("开通服务成功");
                    } else {
                        toastr.success("该用户已经取消所有服务");
                    }
                },
                error : function(errMsg) {}
            });
        })
        //单选框
        function initTableCheckbox() {
            var $thr = $('.modal-body table thead tr');
            var $checkAllTh = $('<th><input type="checkbox" id="checkAll" name="checkAll" /></th>');
            /*将全选/反选复选框添加到表头最前，即增加一列*/
            $thr.prepend($checkAllTh);
            /*“全选/反选”复选框*/
            var $checkAll = $thr.find('input');
            $checkAll.click(function(event){
                /*将所有行的选中状态设成全选框的选中状态*/
                $tbr.find('input').prop('checked',$(this).prop('checked'));
                /*并调整所有选中行的CSS样式*/
                if ($(this).prop('checked')) {
                    $tbr.find('input').parent().parent().addClass('warning');
                } else{
                    $tbr.find('input').parent().parent().removeClass('warning');
                }
                /*阻止向上冒泡，以防再次触发点击操作*/
                event.stopPropagation();
            });
            /*点击全选框所在单元格时也触发全选框的点击操作*/
            $checkAllTh.click(function(){
                $(this).find('input').click();
            });
            var $tbr = $('.modal-body table tbody tr');
            /*每一行都在最前面插入一个选中复选框的单元格*/
            /*点击每一行的选中复选框时*/
            $tbr.find('input').click(function(event){
                /*调整选中行的CSS样式*/
                $(this).parent().parent().toggleClass('warning');
                /*如果已经被选中行的行数等于表格的数据行数，将全选框设为选中状态，否则设为未选中状态*/
                $checkAll.prop('checked',$tbr.find('input:checked').length == $tbr.length ? true : false);
                /*阻止向上冒泡，以防再次触发点击操作*/
                event.stopPropagation();
            });
            /*点击每一行时也触发该行的选中操作*/
            $tbr.click(function(){
                $(this).find('input').click();
            });
        }
        initTableCheckbox();



    })



</script>
