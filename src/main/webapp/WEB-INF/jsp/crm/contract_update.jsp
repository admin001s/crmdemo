<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="modal-demo" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">&times;
            </button>
            <div class="modal-header">
                <h3 class="modal-title">修改签单 </h3>
            </div>
            <form class="form-horizontal" role="form">
                <div class="modal-body">
                    <div class="page-content">
                        <div class="page-content-area">
                            <div class="row">
                                <div class="col-xs-12">
                                    <!-- PAGE CONTENT BEGINS -->

                                    <!-- #section:elements.form -->
                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                               for="orderId">
                                            签单编号：</label>
                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="orderId" placeholder="输入签单编号" value="${orders.orderId}"
                                               readonly="readonly"    class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="orderName">签单名称： </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="orderName" placeholder="输入签单名称" value="${orders.orderName}"
                                                   class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="customersId">对应客户: </label>
                                        <div class="col-sm-3">
                                            <div>
                                                <select class="form-control" id="customersId">
                                                    <option value="${orders.crmcustomersinfo.id}">${orders.crmcustomersinfo.customersName}</option>
                                                    <c:forEach items="${crmcustomersinfos}" var="crmcustomer">
                                                        <option value="${crmcustomer.id}">${crmcustomer.customersName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /section:elements.form -->

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="money">本次成交金额： </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="money" placeholder="输入成交金额" value="${orders.money}"
                                                   class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="signingtypeId">签单类型: </label>
                                        <div class="col-sm-3">
                                            <div>
                                                <select class="form-control" id="signingtypeId">
                                                    <option value="1" <c:if test="${orders.signingtypeId==1}">selected</c:if>>直销类型</option>
                                                    <option value="2" <c:if test="${orders.signingtypeId==2}">selected</c:if>>代理类型</option>
                                                    <option value="3" <c:if test="${orders.signingtypeId==3}">selected</c:if>>采购类型</option>
                                                    <option value="4" <c:if test="${orders.signingtypeId==4}">selected</c:if>>服务类型</option>
                                                    <option value="5" <c:if test="${orders.signingtypeId==5}">selected</c:if>>其他</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /.col -->
                            </div><!-- /.row -->
                        </div><!-- /.page-content-area -->
                    </div><!-- /.page-content -->
                </div>
                <div class="modal-footer">
                    <button class="btn btn-info" type="button" onclick="upate()">
                        <i class="ace-icon fa fa-check bigger-110"></i>
                        提交
                    </button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    var container=$("#modal-demo");
    function upate() {
        $.ajax({
            url: "updateCustomerorder.do",
            data: {
                id:${orders.id},
                orderName:$("#orderName").val(),
                customersId:$("#customersId").val(),
                money:$("#money").val(),
                signingtypeId:$("#signingtypeId").val(),
            },
            type: "post",
            dataType: "JSON",
            success: function (data) {
                if (data) {
                    alert("修改成功！");
                    container.parent().modal('hide');
                    $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                } else {
                    alert("修改失败！");
                }
            },
            error: function (errMsg) {
            }
        });
    }

</script>