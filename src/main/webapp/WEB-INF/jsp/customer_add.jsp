<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="modal-demo" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content radius">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                <i class="ace-icon fa fa-times"></i>
            </button>
            <div class="modal-header">
                <h3 class="modal-title">添加客户</h3>
            </div>
            <form class="form-horizontal" role="form">
                <div class="modal-body">
                    <div class="page-content">

                        <div class="page-content-area">

                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- PAGE CONTENT BEGINS -->

                                    <!-- #section:elements.form -->

                                </div><!-- /.col -->
                            </div><!-- /.row -->
                        </div><!-- /.page-content-area -->
                    </div><!-- /.page-content -->

                </div>
                <div class="modal-footer">
                    <button class="btn btn-info" type="button" onclick="add()">
                        <i class="ace-icon fa fa-check bigger-110"></i>
                        添加
                    </button>
                    <button class="btn " type="reset">
                        <i class="ace-icon fa fa-undo bigger-110"></i>
                        重置
                    </button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    var container=$("#modal-demo");
    function add() {
        $.ajax({
            url: "addCrmcustomersinfo.do",
            data: {
                customersId: $("#customersId").val(),
                customersName: $("#customersName").val(),
                customersSex: $("[name='customersSex']:checked").val(),
                provinceName: $("#provinceName").val(),
                cityName: $("#cityName").val(),
                mainsalesarea: $("#mainsalesarea").val(),
                department: $("#department").val(),
                position: $("#position").val(),
                telephone: $("#telephone").val(),
                isVip: $("[name='isVip']:checked").val(),
                email: $("#email").val(),
                industryCategory: $("#industryCategory").val(),
                industrySubclass: $("#industrySubclass").val(),
                customerSource: $("#customerSource").val(),
                companywebsite: $("#companywebsite").val(),
                companyAddress: $("#companyAddress").val(),
                companydetails: $("#companydetails").val(),
                mainproducts: $("#mainproducts").val(),
                customerUrlSource: $("#customerUrlSource").val(),
                qq: $("#qq").val()
            },
            type: "post",
            dataType: "JSON",
            success: function (data) {
                if (data) {
                    alert("新增成功！");
                    container.parent().modal('hide');
                    $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                } else {
                    alert("新增失败！");
                }
            },
            error: function (errMsg) {
            }
        });
    }

    $(function () {
        $("#provinceName").change(function () {
            if ($(this).val() != '0') {
                $.ajax({
                    url: "getcities.do",
                    data: {
                        provinceid: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">市</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.cityid + '">' + this.city + '</option>';
                        });
                        $("#cityName").empty();
                        $("#cityName").append(_html);
                        $("#mainsalesarea").empty();
                        $("#mainsalesarea").append('<option value="0">区</option>');
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                $("#cityName").empty();
                $("#cityName").append('<option value="0">市</option>');
                $("#mainsalesarea").empty();
                $("#mainsalesarea").append('<option value="0">区</option>');
            }
        });
        $("#cityName").change(function () {
            if ($(this).val() != '0') {
                $.ajax({
                    url: "getareas.do",
                    data: {
                        cityid: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">区</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.areaid + '">' + this.area + '</option>';
                        });
                        $("#mainsalesarea").empty();
                        $("#mainsalesarea").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                $("#mainsalesarea").empty();
                $("#mainsalesarea").append('<option value="0">区</option>');
            }
        });
    });
</script>