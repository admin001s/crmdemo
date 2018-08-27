<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
<div  role="dialog" id="shezhi"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="model1">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    设置客户过期时间
                </h4>
            </div>
            <div class="modal-body col-lg-12">
                <form class="form-horizontal col-lg-12">
                    <div class="alert alert-warning col-lg-12">
                        <button type="button" class="close" data-dismiss="alert">
                            <i class="ace-icon fa fa-times"></i>
                        </button>
                        <strong>提示</strong>
                        您设置用户的过期时间！
                        <br/>
                    </div>

                    <div class="form-group col-lg-12" id="yg">
                        <label for="id-date-picker-1" class="col-lg-4">日期表单</label>
                        <div class="input-group col-lg-4">
                            <input class="form-control date-picker" id="id-date-picker-1" type="text" data-date-format="yyyy-mm-dd" />
                            <span class="input-group-addon">
													<i class="fa fa-calendar bigger-110"></i>
												</span>
                        </div>
                    </div>
                    <div class="form-group col-lg-12">
                        <label class="col-lg-12">过期时间：<i id="fzr" style="color: #00b3ee"></i></label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="add1">
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

<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
    var container=$("#shezhi");
    $(function () {
        //datepicker plugin
        //link
        $('.date-picker').datepicker({
            autoclose: true,
            todayHighlight: true
        }).change(function () {
            $("#fzr").text($("#id-date-picker-1").val());
        });
        var id = [];
        <c:forEach var="list" items="${ids}">
        id.push(${list});
        </c:forEach>


        $("#add1").click(function () {
            she();
        });

        function she() {
            $.ajax({
                url: "expiryTime.do",
                data: {
                    ids: id,
                    indate:$("#id-date-picker-1").val(),
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if(data){
                        alert("设置成功！");
                        container.parent().modal('hide');
                        $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                    }

                },
                error: function (errMsg) {
                }
            });
        }
    });
</script>