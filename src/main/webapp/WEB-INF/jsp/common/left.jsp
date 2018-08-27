<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- /section:basics/navbar.layout -->
<%@include file="/WEB-INF/jsp/common/head.jsp" %>
<div class="main-container" id="main-container">

    <!-- #section:basics/sidebar -->
    <div id="sidebar" class="sidebar responsive">


        <ul class="nav nav-list">
            <li class="active one"data-url="doindex.do">
                <a href="javascript:;">
                    <i class="menu-icon fa fa-tachometer"></i>
                    <span class="menu-text"> 首页 </span>
                </a>
                <b class="arrow"></b>
            </li>
            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-bar-chart-o"></i>
                    <span class="menu-text"> 销售管理 </span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>
                <ul class="submenu">
                    <li class="one" data-url="agent.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-desktop"></i>
                            代理商
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="one" data-url="toagencyStaff.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-desktop"></i>
                            代理商员工
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="one" data-url="customer.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-users"></i>
                            客户
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="one" data-url="toContract.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-users"></i>
                            签单
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="one" data-url="toSubject.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-users"></i>
                            审批
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#"  class="dropdown-toggle">
                    <i class="menu-icon fa fa-list-alt"></i>
                    <span class="menu-text"> 销售支持 </span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>
                <ul class="submenu">
                    <li class="one" data-url="toMyFollow.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-desktop"></i>
                            我的跟进记录
                        </a>

                        <b class="arrow"></b>
                    </li>
                    <li class="one" data-url="toagencyStaff.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-desktop"></i>
                            代理商员工
                        </a>
                        <b class="arrow"></b>
                    </li>

                    <li class="one" data-url="customer.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-users"></i>
                            客户
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>


            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-tag"></i>
                    <span class="menu-text"> 服务 </span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="one" data-url="OpenList.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-caret-right"></i>
                            开通服务
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="one" data-url="/AllocationOneLlist.do">
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-caret-right"></i>
                            分配
                        </a>

                        <b class="arrow"></b>
                    </li>





                    <li class="hsub open">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-caret-right"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                            产品服务线
                        </font></font><b class="arrow fa fa-angle-down"></b>
                        </a>

                        <b class="arrow"></b>

                        <ul class="submenu nav-show " style="display: block;">
                            <li class="one"  data-url="/servicelist.do">
                                <a href="javascript:;">
                                    <i class="menu-icon fa fa-leaf green"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                    产品管理
                                </font></font></a>

                                <b class="arrow"></b>
                            </li>

                            <li class="one"  data-url="/modularlist.do">
                                <a href="javascript:;">
                                    <i class="menu-icon fa fa-pencil orange"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                    模板管理
                                </font></font></a>

                                <b class="arrow"></b>
                            </li>
                            <li class="one"  data-url="/TaskSchedule.do">
                                <a href="javascript:;">
                                    <i class="menu-icon fa fa-gavel blue"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                    模块任务
                                </font></font></a>

                                <b class="arrow"></b>
                            </li>
                        </ul>
                    </li>

                    <li class="">
                        <a href="timeline.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            客户资料
                        </a>

                        <b class="arrow"></b>
                    </li>


                    <li class="">
                        <a href="login.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            客户服务的监控与预警
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="login.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            客服邀请其他客服加入客服团队
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="login.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            客户投诉/表扬跟进
                        </a>

                        <b class="arrow"></b>
                    </li>


                    <li class="">
                        <a href="login.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            客户满意度调查(一周)
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="login.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            客户服务的监控与预警
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="login.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            客户满意度调查反馈
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="login.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            月沟通服务反馈
                        </a>

                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
        </ul><!-- /.nav-list -->

        <!-- #section:basics/sidebar.layout.minimize -->
        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>
    </div>
    <section style="height: calc(100% - 50px); overflow: auto;"
            id="workstation" class="min-view-section"> </section>
    <%@include file="/WEB-INF/jsp/common/footer.jsp" %>
<script>
    $(function(){
        $('#workstation').load("doindex.do");
        $(".one").click(function(){
            var url=$(this).attr("data-url");
            $('#workstation').load(url);
        });

    });
</script>
    <!-- /section:basics/sidebar -->