<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="add-reserve-guhijn" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="model1">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    批量转移代理商
                </h4>
            </div>
            <div class="modal-body col-lg-12">
                <form class="form-horizontal col-lg-12">
                    <div class="form-group col-lg-12" id="zj">
                        <label class="col-lg-3">渠道总监：</label>
                        <div class="col-lg-5 col-sm-2">
                            <div class="pos-rel">
                                <select class="form-control">
                                    <option value="0">------------</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-lg-12" id="jl">
                        <label class="col-lg-3">渠道经理：</label>
                        <div class="col-lg-5 col-sm-2">
                            <div class="pos-rel">
                                <select class="form-control">
                                    <option value="0">------------</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-lg-12" id="zy">
                        <label class="col-lg-3">渠道专员：</label>
                        <div class="col-lg-5 col-sm-2">
                            <div class="pos-rel">
                                <select class="form-control">
                                    <option value="0">------------</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-warning col-lg-12">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="ace-icon fa fa-times"></i>
                        </button>
                        <strong>提示</strong>
                        此操作将转移所选代理商下所有资源一同转移，请谨慎操作！
                        <br/>
                    </div>
                    <div class="form-group col-lg-12">
                        <label class="col-lg-12">转移负责人：<i id="fzr" style="color: #00b3ee"></i></label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="add">
                    确定
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<script type="text/javascript">
    $(function () {
        var id = [];
        <c:forEach var="list" items="${id}">
        id.push(${list});
        </c:forEach>
        $("#zj,#jl,#zy,#dls,#yg").hide();
        var container = $("#add-reserve-guhijn");

        function fp() {
            if ($("#zy select").val() != "0") {
                var beiuserId;
                beiuserId = $("#zy select").val();
                $.ajax({
                    url: "transferAgentList.do",
                    data: {
                        beiuserId: beiuserId,
                        id: id
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        if (data) {
                            container.parent().modal('hide');
                            $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                        }
                        else {
                            alert("失败！");
                        }
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                alert("请选择负责人!");
            }
        }

        $("#model1").find("#add").click(function () {
            fp();
        });

        function getUser(roleId, html) {
            $.ajax({
                url: "getCusinfo.do",
                data: {
                    roleId: roleId
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    var _html = '<option value="0">------------</option>';
                    $(data).each(function () {
                        _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                    });
                    $("#" + html + " select").empty();
                    $("#" + html + " select").append(_html);
                },
                error: function (errMsg) {
                }
            });
        }

        $("#zj select").change(function () {
            if ($(this).val() != '0') {
                $("#jl").show();
                $.ajax({
                    url: "getCusinfo.do",
                    data: {
                        roleId: 3,
                        userArrangement: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">------------</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                        });
                        $("#jl select").empty();
                        $("#jl select").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                var _html = '<option value="0">------------</option>';
                $("#jl").hide();
                $("#zy").hide();
                $("#jl select").empty();
                $("#jl select").append(_html);
                $("#zy select").empty();
                $("#zy select").append(_html);
                $("#fzr").text("");
            }
        });
        $("#jl select").change(function () {
            if ($(this).val() != '0') {
                $("#zy").show();
                $.ajax({
                    url: "getCusinfo.do",
                    data: {
                        roleId: 4,
                        userArrangement: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">------------</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                        });
                        $("#zy select").empty();
                        $("#zy select").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                var _html = '<option value="0">------------</option>';
                $("#zy").hide();
                $("#zy select").empty();
                $("#zy select").append(_html);
                $("#fzr").text("");
            }
        });
        $("#zy select").change(function () {
            if ($(this).val() != '0') {
                $("#fzr").text($("#zy select option:selected").text());
            } else {
                $("#fzr").text("");
            }
        });
        $("#dls select").change(function () {
            if ($(this).val() != '0') {
                $("#yg").show();
                $.ajax({
                    url: "getCusinfo.do",
                    data: {
                        roleId: 6,
                        userArrangement: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">------------</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                        });
                        $("#yg select").empty();
                        $("#yg select").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                var _html = '<option value="0">------------</option>';
                $("#yg").hide();
                $("#yg select").empty();
                $("#yg select").append(_html);
            }
        });

        if (${user.roleId}==1
    )
        {
            $("#zj").show();
            getUser(2, "zj");

        }
    else
        if (${user.roleId}==2
    )
        {
            $("#jl").show();
            getUser(3, "jl");
        }
    else
        if (${user.roleId}==3
    )
        {
            $("#zy").show();
            getUser(4, "zy");
        }
    else
        if (${user.roleId}==4
    )
        {
            $("#zy").show();
            $("#zy select").empty();
            $("#zy select").append('<option value="${user.userArrangement} "> ${user.chineseName} </option>');
            $("#zy select").attr("disabled", "disabled");
        }
    });
</script>