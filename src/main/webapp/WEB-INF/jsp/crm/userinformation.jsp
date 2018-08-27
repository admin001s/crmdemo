<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
    .profile-info-row {
        font-size: 17px;
    }
</style>
<!-- #section:basics/content.breadcrumbs -->
<div class="breadcrumbs" id="breadcrumbs">
    <ul class="breadcrumb">
        <li>
            <a href="javascript:void(0)">客户资料</a>
        </li>
    </ul><!-- /.breadcrumb --><!-- /.nav-search -->
</div>


<!-- /section:basics/content.breadcrumbs -->
<div class="page-content">

    <!-- /section:settings.box -->
    <div class="page-content-area">
        <div class="row">
            <div class="col-xs-12">
                <div id="user-profile-2" class="user-profile">
                    <div class="tabbable">
                        <ul class="nav nav-tabs padding-18">
                            <li class="active">
                                <a data-toggle="tab" href="#home">
                                    <i class="green icon-user bigger-120"></i>
                                    详细资料
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content no-border padding-24">
                            <div id="home" class="tab-pane in active">
                                <div class="row">

                                    <div class="col-lg-6 col-xs-12 col-sm-9">
                                        <h4 class="blue">
                                            <span class="middle ">客户</span>

                                            <span class="label label-purple arrowed-in-right">
																	${crmcustomersinfo.customersName}
																</span>
                                        </h4>

                                        <div class="profile-user-info ">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 客户名称</div>

                                                <div class="profile-info-value">
                                                    <span>${crmcustomersinfo.customersName}</span>
                                                </div>
                                            </div>

                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 客户编号</div>

                                                <div class="profile-info-value">
                                                    <span>${crmcustomersinfo.customersId}</span>
                                                </div>
                                            </div>

                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 客户级别</div>

                                                <div class="profile-info-value">
                                                    <span>
                                                        <c:if test="${crmcustomersinfo.level ==1}">A(高价值客户)</c:if>
                                                         <c:if test="${crmcustomersinfo.level ==2}">B(普通客户)</c:if>
                                                         <c:if test="${crmcustomersinfo.level ==3}">C(低价值客户)</c:if>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 客户性别</div>

                                                <div class="profile-info-value">
                                                    <span>
                                                        <c:if test="${crmcustomersinfo.customersSex ==0}">男</c:if>
                                                         <c:if test="${crmcustomersinfo.customersSex ==1}">女</c:if>
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 地区</div>

                                                <div class="profile-info-value">
                                                    <i class="icon-map-marker light-orange bigger-110"></i>
                                                    <span>${crmcustomersinfo.provinceName}${crmcustomersinfo.cityName}${crmcustomersinfo.mainsalesarea}</span>
                                                </div>
                                            </div>

                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 手机号码</div>

                                                <div class="profile-info-value">
                                                    <span>${crmcustomersinfo.telephone}</span>
                                                </div>
                                            </div>

                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> QQ</div>

                                                <div class="profile-info-value">
                                                    <span>${crmcustomersinfo.qq}</span>
                                                </div>
                                            </div>
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 是否VIP</div>

                                                <div class="profile-info-value">
                                                    <span>
                                                        <c:if test="${crmcustomersinfo.isVip ==0}">黄金VIP</c:if>
                                                         <c:if test="${crmcustomersinfo.isVip ==1}">普通用户</c:if>
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 邮箱</div>

                                                <div class="profile-info-value">
                                                    <span>${crmcustomersinfo.email}</span>
                                                </div>
                                            </div>
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 客户来源</div>

                                                <div class="profile-info-value">
                                                    <span>
                                                        <c:if test="${crmcustomersinfo.customerSource =='广告'}">广告</c:if>
                                                         <c:if test="${crmcustomersinfo.customerSource =='社交推广'}">社交推广</c:if>
                                                        <c:if test="${crmcustomersinfo.customerSource =='研讨会'}">研讨会</c:if>
                                                         <c:if test="${crmcustomersinfo.customerSource =='搜索引擎'}">搜索引擎</c:if>
                                                        <c:if test="${crmcustomersinfo.customerSource =='客户介绍'}">客户介绍</c:if>
                                                         <c:if test="${crmcustomersinfo.customerSource =='代理商'}">代理商</c:if>
                                                        <c:if test="${crmcustomersinfo.customerSource =='其他'}">其他</c:if>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 所属行业</div>

                                                <div class="profile-info-value">
                                                    <span>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='服务'}">服务</c:if>
                                                         <c:if test="${crmcustomersinfo.industryCategory =='金融'}">金融</c:if>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='电信'}">电信</c:if>
                                                         <c:if test="${crmcustomersinfo.industryCategory =='教育'}">教育</c:if>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='高科技'}">高科技</c:if>
                                                         <c:if test="${crmcustomersinfo.industryCategory =='政府'}">政府</c:if>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='制造'}">制造</c:if>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='能源'}">能源</c:if>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='零售'}">零售</c:if>
                                                         <c:if test="${crmcustomersinfo.industryCategory =='媒体'}">媒体</c:if>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='娱乐'}">娱乐</c:if>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='咨询'}">咨询</c:if>
                                                         <c:if test="${crmcustomersinfo.industryCategory =='非盈利事业'}">非盈利事业</c:if>
                                                        <c:if test="${crmcustomersinfo.industryCategory =='公共事业'}">公共事业</c:if>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 部门</div>

                                                <div class="profile-info-value">
                                                    <span>${crmcustomersinfo.department}</span>
                                                </div>
                                            </div>
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 职位</div>

                                                <div class="profile-info-value">
                                                    <span></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="hr hr-8 dotted"></div>


                                    </div><!-- /span -->
                                    <div class="col-lg-6 col-xs-12 col-sm-9">
                                        <h4 class="blue">
                                            <span class="middle ">公司</span>
                                        </h4>
                                        <div class="profile-user-info">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 公司名称</div>

                                                <div class="profile-info-value">
                                                    ${crmcustomersinfo.companywebsite}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="profile-user-info">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 公司地址</div>

                                                <div class="profile-info-value">
                                                    ${crmcustomersinfo.companyAddress}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="profile-user-info">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 公司网址</div>

                                                <div class="profile-info-value">
                                                    <a href="${crmcustomersinfo.customerUrlSource}" target="_blank">${crmcustomersinfo.customerUrlSource}</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="profile-user-info">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 公司详情</div>

                                                <div class="profile-info-value">
                                                    ${crmcustomersinfo.companydetails}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="profile-user-info">
                                            <div class="profile-info-row">
                                                <div class="profile-info-name"> 主要产品</div>

                                                <div class="profile-info-value">
                                                    ${crmcustomersinfo.mainproducts}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /row-fluid -->

                                <div class="space-20"></div>
                            </div><!-- #home -->
                        </div>
                    </div>
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content-area -->
</div>
<!-- /.page-content -->