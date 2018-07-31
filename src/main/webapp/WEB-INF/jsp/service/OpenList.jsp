<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<%@include file="/WEB-INF/jsp/common/left.jsp"%>


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


    <div class="page-content"   >

        <!-- /section:settings.box -->
        <div class="page-content-area" >

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="row">
                        <div class="col-xs-12" id="select-product-p1123">
                            <table id="table" style="text-align: center;">


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
                                    <td class="right"><input type="text" size="16"  /></td>
                                    <td class="left">差旅单名称：</td>
                                    <td class="right"><input type="text" size="16"  /></td>
                                    <td class="left">差旅单号：</td>
                                    <td class="right"><input type="text" size="16"  /></td>
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
                                    <td class="right"><input type="text" size="16"  /></td>
                                    <td class="left">差旅单创建时间：</td>
                                    <td class="right"><input type="text" size="16" class="datePicker"  /> 至 <input type="text" size="16" class="datePicker"  /></td>
                                    <td class="left">差旅时间范围：</td>
                                    <td class="right"><input type="text" size="16" class="datePicker"  /> 至 <input type="text" size="16" class="datePicker"  /></td>
                                    <td class="right" colspan="2">
                                        <button class="btn btn-primary pull-left col-sm-12 tbl-search" data-dismiss="modal">
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
                                                <input type="checkbox" class="ace" />
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
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#"  class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span class="label label-sm label-warning">广州北京0801</span></td>
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
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#"  class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span class="label label-sm label-warning">广州北京0801</span></td>
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
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#"  class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span class="label label-sm label-warning">广州北京0801</span></td>
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
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#"  class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span class="label label-sm label-warning">广州北京0801</span></td>
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
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#"  class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span class="label label-sm label-warning">广州北京0801</span></td>
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
                                                <input type="checkbox" class="ace" />
                                                <span class="lbl"></span>
                                            </label>
                                        </td>

                                        <td>商务研发部</td>
                                        <td><a href="#"  class="yuangongBtn" rel="#yuangong">CL1234567891234567</a></td>
                                        <td class="hidden-480">C1234567891234</td>
                                        <td class="hidden-480"><span class="label label-sm label-warning">广州北京0801</span></td>
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
                                        客票行李规定
                                    </div>
                                </div>

                                <div class="modal-body no-padding">
                                    <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                                        <thead>
                                        <tr>
                                            <th>航班类型</th>
                                            <th>客舱级别</th>
                                            <th>行李数量上限</th>

                                            <th>
                                                <i class="ace-icon fa fa-clock-o bigger-110"></i>
                                                每件重量上限
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <tr>
                                            <td>
                                                <a href="#">国内航班</a>
                                            </td>
                                            <td>头等舱</td>
                                            <td>2件</td>
                                            <td>5千克</td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <a href="#">国内航班</a>
                                            </td>
                                            <td>头等舱</td>
                                            <td>2件</td>
                                            <td>5千克</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="#">国内航班</a>
                                            </td>
                                            <td>头等舱</td>
                                            <td>2件</td>
                                            <td>5千克</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="#">国内航班</a>
                                            </td>
                                            <td>头等舱</td>
                                            <td>2件</td>
                                            <td>5千克</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="#">国内航班</a>
                                            </td>
                                            <td>头等舱</td>
                                            <td>2件</td>
                                            <td>5千克</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="#">国内航班</a>
                                            </td>
                                            <td>头等舱</td>
                                            <td>2件</td>
                                            <td>5千克</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="modal-footer no-margin-top">
                                    <button class="btn btn-sm btn-danger pull-left" data-dismiss="modal">
                                        <i class="ace-icon fa fa-times"></i>
                                        关闭
                                    </button>

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
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal-dialog -->
                    </div><!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content-area -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->


<%@include file="/WEB-INF/jsp/common/footer.jsp"%>
<%--<script type="text/javascript">--%>
    <%--window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");--%>
<%--</script>--%>

<%--<!-- <![endif]-->--%>

<%--<!--[if IE]>--%>
<%--<script type="text/javascript">--%>
<%--window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");--%>
<%--</script>--%>
<%--<![endif]-->--%>
<%--<script type="text/javascript">--%>
    <%--if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");--%>
<%--</script>--%>
<%--<script src="assets/js/bootstrap.min.js"></script>--%>

<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/js/bootstrap-table.js"></script>
<script src="assets/js/bootstrap-table-zh-CN.js"></script>
<%--<!-- ace scripts -->--%>
<%--<script src="assets/js/ace-elements.min.js"></script>--%>
<%--<script src="assets/js/ace.min.js"></script>--%>


<script type="text/javascript">
    jQuery(function($) {
    var container = $('#select-product-p1123');
        function initTable(name) {
            container.find('#table').bootstrapTable('destroy');
            var options = {
                 url : '/getcrmcustomersinfo', //请求后台的URL（*）
                method : 'post', //请求方式（*）
                contentType : "application/x-www-form-urlencoded",
                dataType : "json", //数据类型
                striped : false, //是否显示行间隔色
                pagination : false, //是否显示分页（*）
                queryParamsType : '',
                queryParams : function(param) {
                    var params = {
                        productName : name
                    };
                    return params;
                },

                clickToSelect : true,
                undefinedText : "",
                pagination: true,//是否开启分页（*）
                locale:'zh-CN',//中文支持
                pageNumber:1,//初始化加载第一页，默认第一页
                pageSize: 3,//每页的记录行数（*）
                pageList: [2,3,4],//可供选择的每页的行数（*）
                sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
                showRefresh:true,//刷新按钮
                search: true,//是否显示表格搜索，此搜索是客户端搜索，不会进服务端
                // sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
                // pageSize : 20,
                // pageList : [ 10, 20, 50 ], //可供选择的每页的行数（*）
                clickToSelect : true, //是否启用点击选中行
// 				height : 400, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId : "", //每一行的唯一标识，一般为主键列
                showExport : true,
                exportDataType : 'all',
           //     exportTypes : [ 'excel' ], //导出文件类型
                columns: [{
                    field: 'i',
                    title: '序号',
                    align : 'center'
                }, {
                    field: 'customersId',
                    title: '客户编号',
                    align : 'center'
                }, {
                    field: 'customersName',
                    title: '客户姓名',
                    align : 'center'
                }, {
                    field: 'customersSex',
                    title: '性别',
                    align : 'center',
                    formatter: function(value) {
                        var sex=null;
                        if(value=="0"){
                            sex="男";
                        }else if(value=="1"){
                            sex="女";
                        }
                        return sex;
                    }
                }, {
                    field: 'provinceName',
                    title: '省名',
                    align : 'center'
                }, {
                    field: 'mobilephone',
                    title: '手机号码',
                    align : 'center'
                }, {
                    field: 'customerStatus',
                    title: '客户状态',
                    align : 'center'
                },
                    {
                        field : 'caozuo',
                        title: '操作',
                        align : 'center',
                        formatter : function(value, row, index) {
                            return '<i class="glyphicon glyphicon-pencil caozuo" data-id="' + row.id + '" style="cursor: pointer;" title="操作"></i>';
                        }
                    }],
                onPostBody : function(data, row) {
                    container.find('.fixed-table-toolbar').hide();
                    // initButton();
                    container.find('.bootstrap-table').height('350');
                },

            }
            container.find('#table').bootstrapTable(options);
            function countFoot(value, field) {
                var count = 0;
                $(value).each(function(i) {
                    if (value[i][field] && parseInt(value[i][field])) {
                        count+=parseInt(value[i][field]);
                    }
                });
                return count+'' || '';
            }
            setTimeout(function(){
                var table_div = container.find('.bootstrap-table');
                var width = table_div.parent().width();
                table_div.height('350');
                table_div.width(width);
                // initTableFootWidth();
            }, 300);
        }
        initTable(null);
        $(".tbl-search").click(function(){
            $(".table-responsive").slideDown("fast");
        })

        var oTable1 =
            $('#sample-table-2')
                .dataTable( {
                    bAutoWidth: false,
                    bInfo:false,
                    "aoColumns": [
                        { "bSortable": false },
                        null,
                        null,
                        null,
                        null,
                        null,
                        { "bSortable": false },
                        null,
                        { "bSortable": false }
                    ],
                    "aaSorting": [],
                } );

        $(document).on('click', 'th input:checkbox' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });
        });




    })

</script>
