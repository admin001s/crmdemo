<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="modal-demo" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content radius">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                <i class="ace-icon fa fa-times"></i>
            </button>
            <div class="modal-header">
                <h3 class="modal-title">添加客户</h3>
            </div>
            <div class="modal-body">
                <div class="page-content">

                    <div class="page-content-area">

                        <div class="row">
                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <form class="form-horizontal" role="form">
                                    <!-- #section:elements.form -->
                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="customersId"> 客户编号：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="customersId" placeholder="输入客户编号" class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="customersName">客户名称： </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="customersName" placeholder="输入客户名称" class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">客户性别:  </label>
                                        <div class="col-sm-9">
                                            <div>
                                                <label class="line-height-1 blue">
                                                    <input name="customersSex" id="form-field-1-1-1" value="0" type="radio" class="ace" checked/>
                                                    <span class="lbl"> 男</span>
                                                </label>
                                                <label class="line-height-1 blue">
                                                    <input name="customersSex" value="1" type="radio" class="ace" />
                                                    <span class="lbl"> 女</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /section:elements.form -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-tags">地区：</label>
                                        <div class="col-sm-2">
                                            <div class="pos-rel">
                                                <select class="form-control" id="provinceName">
                                                    <option value="0">省</option>
                                                    <c:forEach items="${provinces}" var="province">
                                                        <option value="${province.provinceid}">${province.province}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pos-rel">
                                                <select class="form-control" id="cityName">
                                                    <option value="0">市</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pos-rel">
                                                <select class="form-control" id="mainsalesarea">
                                                    <option value="0">区</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="department">部门： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="department" placeholder="输入部门" class="col-xs-10 col-sm-5"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="position">职位： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="position" placeholder="输入职位" class="col-xs-10 col-sm-5"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="phone">手机号码:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="input-group">
																	<span class="input-group-addon">
																		<i class="ace-icon fa fa-phone"></i>
																	</span>
                                                <input type="tel" id="phone" name="phone" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">是否VIP:  </label>
                                        <div class="col-sm-9">
                                            <div>
                                                <label class="line-height-1 blue">
                                                    <input name="isVIP" id="isVIP" value="0" type="radio" class="ace" />
                                                    <span class="lbl"> 是</span>
                                                </label>
                                                <label class="line-height-1 blue">
                                                    <input name="isVIP" value="1" type="radio" class="ace" checked/>
                                                    <span class="lbl"> 否</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right" for="email">邮箱:</label>

                                        <div class="col-xs-12 col-sm-9">
                                            <div class="clearfix">
                                                <input type="email" name="email" id="email" class="col-xs-12 col-sm-6" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="industryCategory"> 行业大类：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="industryCategory" placeholder="输入行业大类" class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="industrySubclass"> 行业子类：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="industrySubclass" placeholder="输入行业子类" class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="customerSource"> 客户来源：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="customerSource" placeholder="输入客户来源" class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="companywebsite"> 公司名称：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="companywebsite" placeholder="输入公司名称" class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="companyAddress"> 公司地址：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="companyAddress" placeholder="输入公司地址" class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="companydetails">公司详情：</label>
                                        <div class="col-sm-9">
                                            <div class="pos-rel">
                                                <textarea class="form-control limited autosize-transition" id="companydetails" maxlength="50"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="mainproducts"> 主要产品：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="mainproducts" placeholder="主要产品" class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="form-group" style="float: right;">
                                    <button class="btn btn-info" type="button">
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

                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div><!-- /.page-content-area -->
                </div><!-- /.page-content -->

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function add(){

    }
    $(function(){
        $("#provinceName").change(function(){
            if($(this).val()!='0'){
                $.ajax({
                    url : "getcities.do",
                    data : {
                        provinceid:$(this).val()
                    },
                    type : "post",
                    dataType : "JSON",
                    success : function(data) {
                        var _html='<option value="0">市</option>';
                        $(data).each(function(){
                            _html+='<option value="'+this.cityid+'">'+this.city+'</option>';
                        });
                        $("#cityName").empty();
                        $("#cityName").append(_html);
                        $("#mainsalesarea").empty();
                        $("#mainsalesarea").append('<option value="0">区</option>');
                    },
                    error : function(errMsg) {}
                });
            }else{
                $("#cityName").empty();
                $("#cityName").append('<option value="0">市</option>');
                $("#mainsalesarea").empty();
                $("#mainsalesarea").append('<option value="0">区</option>');
            }
        });
        $("#cityName").change(function(){
            if($(this).val()!='0'){
                $.ajax({
                    url : "getareas.do",
                    data : {
                        cityid:$(this).val()
                    },
                    type : "post",
                    dataType : "JSON",
                    success : function(data) {
                        var _html='<option value="0">区</option>';
                        $(data).each(function(){
                            _html+='<option value="'+this.areaid+'">'+this.area+'</option>';
                        });
                        $("#mainsalesarea").empty();
                        $("#mainsalesarea").append(_html);
                    },
                    error : function(errMsg) {}
                });
            }else {
                $("#mainsalesarea").empty();
                $("#mainsalesarea").append('<option value="0">区</option>');
            }
        });
    });
</script>