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
                <h3 class="modal-title">修改客户信息资料</h3>
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
                                               for="customersId"> 客户编号：</label>
                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="customersId" placeholder="输入客户编号"
                                                   value="${customer.customersId}"
                                                   class="col-xs-10 col-sm-5" autocomplete="off" readonly="readonly"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="customersName">客户名称： </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="customersName" placeholder="输入客户名称"
                                                   value="${customer.customersName}" class=" col-xs-10 col-sm-5"
                                                   autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="provinceName">客户级别：</label>
                                        <div class="col-sm-2">
                                            <div class="pos-rel">
                                                <select class="form-control" id="level">
                                                    <option value="1" <c:if test="${customer.level==1}">selected</c:if>>
                                                        A(高价值客户)
                                                    </option>
                                                    <option value="2" <c:if test="${customer.level==2}">selected</c:if>>
                                                        B(普通客户)
                                                    </option>
                                                    <option value="3" <c:if test="${customer.level==3}">selected</c:if>>
                                                        C(低价值值客户)
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">客户性别: </label>
                                        <div class="col-sm-9">
                                            <div>
                                                <label class="line-height-1 blue">
                                                    <input name="customersSex" id="form-field-1-1-1" value="0"
                                                           type="radio" class="ace"
                                                           <c:if test="${customer.customersSex==0}">checked</c:if>/>
                                                    <span class="lbl"> 男</span>
                                                </label>
                                                <label class="line-height-1 blue">
                                                    <input name="customersSex" value="1" type="radio" class="ace"
                                                           <c:if test="${customer.customersSex==1}">checked</c:if>/>
                                                    <span class="lbl"> 女</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /section:elements.form -->
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="provinceName">地区：</label>
                                        <div class="col-sm-2">
                                            <div class="pos-rel">
                                                <select class="form-control" id="provinceName">
                                                    <option value="0">${customer.provinceName}</option>
                                                    <c:forEach items="${provinces}" var="province">
                                                        <option value="${province.provinceid}">${province.province}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pos-rel">
                                                <select class="form-control" id="cityName">
                                                    <option value="0">${customer.cityName}</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="pos-rel">
                                                <select class="form-control" id="mainsalesarea">
                                                    <option value="0">${customer.mainsalesarea}</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="department">部门： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="department" placeholder="输入部门"
                                                   value="${customer.department}" class="col-xs-10 col-sm-5"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="position">职位： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="position" placeholder="输入职位"
                                                   class="col-xs-10 col-sm-5"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                               for="telephone">手机号码:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="input-group">
																	<span class="input-group-addon">
																		<i class="ace-icon fa fa-phone"></i>
																	</span>
                                                <input type="tel" id="telephone" name="phone"
                                                       value="${customer.telephone}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="qq">QQ： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="qq" placeholder="输入QQ"
                                                   class="col-xs-10 col-sm-5" value="${customer.qq}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">是否VIP: </label>
                                        <div class="col-sm-9">
                                            <div>
                                                <label class="line-height-1 blue">
                                                    <input name="isVip" id="isVIP" value="0" type="radio" class="ace"
                                                           <c:if test="${customer.isVip==0}">checked</c:if>/>
                                                    <span class="lbl"> 是</span>
                                                </label>
                                                <label class="line-height-1 blue">
                                                    <input name="isVip" value="1" type="radio" class="ace"
                                                           <c:if test="${customer.isVip==1}">checked</c:if>/>
                                                    <span class="lbl"> 否</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                               for="email">邮箱:</label>

                                        <div class="col-xs-12 col-sm-9">
                                            <div class="clearfix">
                                                <input type="email" name="email" id="email" class="col-xs-12 col-sm-6"
                                                       value="${customer.email}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                               for="industryCategory"> 所属行业：</label>
                                        <div class="col-sm-3">
                                            <div class="pos-rel">
                                                <select class="form-control" id="industryCategory">
                                                    <option value="服务" <c:if test="${customer.industryCategory=='服务'}">selected</c:if>>服务</option>
                                                    <option value="金融" <c:if test="${customer.industryCategory=='金融'}">selected</c:if>>金融</option>
                                                    <option value="电信" <c:if test="${customer.industryCategory=='电信'}">selected</c:if>>电信</option>
                                                    <option value="教育" <c:if test="${customer.industryCategory=='教育'}">selected</c:if>>教育</option>
                                                    <option value="高科技" <c:if test="${customer.industryCategory=='高科技'}">selected</c:if>>高科技</option>
                                                    <option value="政府" <c:if test="${customer.industryCategory=='政府'}">selected</c:if>>政府</option>
                                                    <option value="制造" <c:if test="${customer.industryCategory=='制造'}">selected</c:if>>制造</option>
                                                    <option value="能源" <c:if test="${customer.industryCategory=='能源'}">selected</c:if>>能源</option>
                                                    <option value="零售" <c:if test="${customer.industryCategory=='零售'}">selected</c:if>>零售</option>
                                                    <option value="媒体" <c:if test="${customer.industryCategory=='媒体'}">selected</c:if>>媒体</option>
                                                    <option value="娱乐" <c:if test="${customer.industryCategory=='娱乐'}">selected</c:if>>娱乐</option>
                                                    <option value="咨询" <c:if test="${customer.industryCategory=='咨询'}">selected</c:if>>咨询</option>
                                                    <option value="非盈利事业" <c:if test="${customer.industryCategory=='非盈利事业'}">selected</c:if>>非盈利事业</option>
                                                    <option value="公共事业" <c:if test="${customer.industryCategory=='公共事业'}">selected</c:if>>公共事业</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                               for="industrySubclass"> 行业子类：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="industrySubclass" placeholder="输入行业子类"
                                                   class="col-xs-10 col-sm-5" autocomplete="off"
                                                   value="${customer.industrySubclass}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                               for="customerSource"> 客户来源：</label>
                                        <div class="col-sm-3">
                                            <div class="pos-rel">
                                                <select class="form-control" id="customerSource">
                                                    <option value="广告"
                                                            <c:if test="${customer.customerSource=='广告'}">selected</c:if>>
                                                        广告
                                                    </option>
                                                    <option value="社交推广"
                                                            <c:if test="${customer.customerSource=='社交推广'}">selected</c:if>>
                                                        社交推广
                                                    </option>
                                                    <option value="研讨会"
                                                            <c:if test="${customer.customerSource=='研讨会'}">selected</c:if>>
                                                        研讨会
                                                    </option>
                                                    <option value="搜索引擎"
                                                            <c:if test="${customer.customerSource=='搜索引擎'}">selected</c:if>>
                                                        搜索引擎
                                                    </option>
                                                    <option value="客户介绍"
                                                            <c:if test="${customer.customerSource=='客户介绍'}">selected</c:if>>
                                                        客户介绍
                                                    </option>
                                                    <option value="代理商"
                                                            <c:if test="${customer.customerSource=='代理商'}">selected</c:if>>
                                                        代理商
                                                    </option>
                                                    <option value="其他"
                                                            <c:if test="${customer.customerSource=='其他'}">selected</c:if>>
                                                        其他
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                               for="companywebsite"> 公司名称：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="companywebsite" placeholder="输入公司名称"
                                                   class="col-xs-10 col-sm-5" autocomplete="off"
                                                   value="${customer.companywebsite}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                               for="companyAddress"> 公司地址：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="companyAddress" placeholder="输入公司地址"
                                                   class="col-xs-10 col-sm-5" autocomplete="off"
                                                   value="${customer.companyAddress}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                               for="customerUrlSource"> 公司网址：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="customerUrlSource" placeholder="输入公司网址"
                                                   class="col-xs-10 col-sm-5" autocomplete="off"
                                                   value="${customer.customerUrlSource}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="companydetails">公司详情：</label>
                                        <div class="col-sm-9">
                                            <div class="pos-rel">
                                                <textarea class="form-control limited autosize-transition"
                                                          id="companydetails"
                                                          maxlength="50">${customer.companydetails}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right"
                                               for="mainproducts"> 主要产品：</label>

                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="mainproducts" placeholder="主要产品"
                                                   class="col-xs-10 col-sm-5" autocomplete="off"
                                                   value="${customer.mainproducts}"/>
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
    var container = $("#modal-demo");

    function upate() {
        $.ajax({
            url: "toupdateCustomer.do",
            data: {
                customersName: container.find("#customersName").val(),
                customersSex: container.find("[name='customersSex']:checked").val(),
                provinceName: container.find("#provinceName").val(),
                cityName: container.find("#cityName").val(),
                mainsalesarea: container.find("#mainsalesarea").val(),
                department: container.find("#department").val(),
                position: container.find("#position").val(),
                telephone: container.find("#telephone").val(),
                isVip: container.find("[name='isVip']:checked").val(),
                email: container.find("#email").val(),
                industryCategory: container.find("#industryCategory").val(),
                industrySubclass: container.find("#industrySubclass").val(),
                customerSource: container.find("#customerSource").val(),
                companywebsite: container.find("#companywebsite").val(),
                companyAddress: container.find("#companyAddress").val(),
                companydetails: container.find("#companydetails").val(),
                mainproducts: container.find("#mainproducts").val(),
                customerUrlSource: container.find("#customerUrlSource").val(),
                qq: container.find("#qq").val(),
                id:${customer.id},
                level: $("#level").val()
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
                        container.find("#cityName").empty();
                        container.find("#cityName").append(_html);
                        container.find("#mainsalesarea").empty();
                        container.find("#mainsalesarea").append('<option value="0">区</option>');
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                container.find("#cityName").empty();
                container.find("#cityName").append('<option value="0">市</option>');
                container.find("#mainsalesarea").empty();
                container.find("#mainsalesarea").append('<option value="0">区</option>');
            }
        });
        container.find("#cityName").change(function () {
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
                        container.find("#mainsalesarea").empty();
                        container.find("#mainsalesarea").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                container.find("#mainsalesarea").empty();
                container.find("#mainsalesarea").append('<option value="0">区</option>');
            }
        });
    });
</script>