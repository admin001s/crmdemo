<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<%@include file="/WEB-INF/jsp/common/left.jsp" %>
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
</div>
<div class="modal fade bs-example-modal-lg" id="reserveModal"></div>

<!-- /.main-content -->
<%@include file="/WEB-INF/jsp/common/footer.jsp" %>
<script type="text/javascript">
    $(function(){
        $("#breadcrumbs").find("#add").on("click",function(){
            $('#reserveModal').load("addcustomer.do", {
            }, function(a, b, c) {
                $('#reserveModal').modal('show');
            });
        });
    });
</script>