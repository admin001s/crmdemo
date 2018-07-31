<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<%@include file="/WEB-INF/jsp/common/left.jsp" %>


<!-- /section:basics/sidebar -->
<div class="main-content">
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="index.html">首页</a>
            </li>
            <li>
                <a href="javascript:void(0)">服务</a>
            </li>
            <li>
                <a href="elements.html">开通服务</a>
            </li>
        </ul><!-- /.breadcrumb -->
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

                    <div class="hr hr-18 dotted hr-double"></div>

                    <h4 class="pink">
                        <i class="ace-icon fa fa-hand-o-right icon-animated-hand-pointer blue"></i>
                        <a href="#modal-table" role="button" class="blue" data-toggle="modal">点击弹出层表格</a>
                    </h4>

                    <div class="hr hr-18 dotted hr-double"></div>

                    <div class="row">
                        <div class="col-xs-12">

                            <div class="table-header">
                                差旅单管理
                            </div>

                            <table width="100%" class="CSSearchTbl" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="left">提交部门：</td>
                                    <td class="right"><input type="text" size="16"/></td>
                                    <td class="left">差旅单名称：</td>
                                    <td class="right"><input type="text" size="16"/></td>
                                    <td class="left">差旅单号：</td>
                                    <td class="right"><input type="text" size="16"/></td>
                                    <td class="left">差旅单状态：</td>
                                    <td class="right">
                                        <select>
                                            <option>未提交</option>
                                            <option>审核中</option>
                                            <option>审核通过</option>
                                            <option>审核未通过</option>
                                            <option>撤回</option>
                                            <option>作废</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>

                                    <td class="left">提交人姓名：</td>
                                    <td class="right"><input type="text" size="16"/></td>
                                    <td class="left">差旅单创建时间：</td>
                                    <td class="right"><input type="text" size="16" class="datePicker"/> 至 <input
                                            type="text" size="16" class="datePicker"/></td>
                                    <td class="left">差旅时间范围：</td>
                                    <td class="right"><input type="text" size="16" class="datePicker"/> 至 <input
                                            type="text" size="16" class="datePicker"/></td>
                                    <td class="right" colspan="2">
                                        <button class="btn btn-primary pull-left col-sm-12 tbl-search"
                                                data-dismiss="modal">
                                            开始搜索
                                            <i class="ace-icon fa fa-search"></i>
                                        </button>
                                    </td>
                                </tr>
                            </table>

                            <div class="table-responsive">

                                <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th class="center">
                                            <label class="position-relative">
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </th>
                                        <th>部门</th>
                                        <th>差旅单号</th>
                                        <th>名称</th>
                                        <th>关联订单号</th>
                                        <th>差旅单状态</th>
                                        <th>创建人</th>
                                        <th>创建日期</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td class="center">
                                            <label class="position-relative">
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#" class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span
                                                class="label label-sm label-warning">广州北京0801</span></td>
                                        <td>未提交</td>
                                        <td>张国立</td>
                                        <td>2012-08-01</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="">
                                                    <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-info">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-danger">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-warning">
                                                    <i class="ace-icon fa fa-flag bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-success">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="center">
                                            <label class="position-relative">
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#" class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span
                                                class="label label-sm label-warning">广州北京0801</span></td>
                                        <td>未提交</td>
                                        <td>张国立</td>
                                        <td>2012-08-01</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="">
                                                    <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-info">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-danger">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-warning">
                                                    <i class="ace-icon fa fa-flag bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-success">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="center">
                                            <label class="position-relative">
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#" class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span
                                                class="label label-sm label-warning">广州北京0801</span></td>
                                        <td>未提交</td>
                                        <td>张国立</td>
                                        <td>2012-08-01</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="">
                                                    <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-info">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-danger">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-warning">
                                                    <i class="ace-icon fa fa-flag bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-success">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="center">
                                            <label class="position-relative">
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#" class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span
                                                class="label label-sm label-warning">广州北京0801</span></td>
                                        <td>未提交</td>
                                        <td>张国立</td>
                                        <td>2012-08-01</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="">
                                                    <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-info">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-danger">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-warning">
                                                    <i class="ace-icon fa fa-flag bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-success">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="center">
                                            <label class="position-relative">
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#" class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span
                                                class="label label-sm label-warning">广州北京0801</span></td>
                                        <td>未提交</td>
                                        <td>张国立</td>
                                        <td>2012-08-01</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="">
                                                    <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-info">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-danger">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-warning">
                                                    <i class="ace-icon fa fa-flag bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-success">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="center">
                                            <label class="position-relative">
                                                <input type="checkbox" class="ace"/>
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#" class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span
                                                class="label label-sm label-warning">广州北京0801</span></td>
                                        <td>未提交</td>
                                        <td>张国立</td>
                                        <td>2012-08-01</td>
                                        <td>
                                            <div class="hidden-sm hidden-xs btn-group">
                                                <button class="btn btn-xs btn-success" title="">
                                                    <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-info">
                                                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-danger">
                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-warning">
                                                    <i class="ace-icon fa fa-flag bigger-120"></i>
                                                </button>

                                                <button class="btn btn-xs btn-success">
                                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="modal-footer no-margin-top">

                                    <ul class="pagination pull-right no-margin">
                                        <li class="prev disabled">
                                            <a href="#">
                                                <i class="ace-icon fa fa-angle-double-left"></i>
                                            </a>
                                        </li>

                                        <li class="active">
                                            <a href="#">1</a>
                                        </li>

                                        <li>
                                            <a href="#">2</a>
                                        </li>

                                        <li>
                                            <a href="#">3</a>
                                        </li>

                                        <li class="next">
                                            <a href="#">
                                                <i class="ace-icon fa fa-angle-double-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                            </div>


                        </div>
                    </div>

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
                                    <div class="panel-body">
                                        <div class="list-op" id="list_op">
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                                            </button>
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                                            </button>
                                            <button type="button" class="btn btn-default btn-sm">
                                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                                            </button>
                                        </div>
                                    </div>
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


<%@include file="/WEB-INF/jsp/common/footer.jsp" %>

<link rel="stylesheet" href="assets/toastr/toastr.min.css"/>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/js/bootstrap-table.js"></script>
<script src="assets/js/bootstrap-table-zh-CN.js"></script>
<script src="assets/toastr/toastr.min.js"></script>


<script type="text/javascript">
    jQuery(function ($) {
        var container = $('#select-product-p1123');

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
                        productName: name
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
// 				height : 400, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
                    // initButton();
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

        $(document).on("click", ".caozuo", function () {
            $("#id").val($(this).attr("data-id"));
                $('#modal-table').modal({
                    show: true,
                    keyboard: true
                });
            });

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
            var $tbr = $('table tbody tr');
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
