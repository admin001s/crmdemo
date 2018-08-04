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
                </ul>
            </li>

            <li class="">
                <a href="widgets.html">
                    <i class="menu-icon fa fa-list-alt"></i>
                    <span class="menu-text"> 插件 </span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="calendar.html">
                    <i class="menu-icon fa fa-calendar"></i>

                    <span class="menu-text">
								日历

                        <!-- #section:basics/sidebar.layout.badge -->
								<span class="badge badge-transparent tooltip-error" title="有2件重要事件">
									<i class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
								</span>

                        <!-- /section:basics/sidebar.layout.badge -->
							</span>
                </a>

                <b class="arrow"></b>
            </li>

            <li class="">
                <a href="gallery.html">
                    <i class="menu-icon fa fa-picture-o"></i>
                    <span class="menu-text"> 相册 </span>
                </a>

                <b class="arrow"></b>
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

                            <li class="hsub">
                                <a href="#" class="dropdown-toggle">
                                    <i class="menu-icon fa fa-pencil orange"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">

                                    第四级
                                </font></font><b class="arrow fa fa-angle-down"></b>
                                </a>

                                <b class="arrow"></b>

                                <ul class="submenu">
                                    <li class="">
                                        <a href="#">
                                            <i class="menu-icon fa fa-plus purple"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                            添加商品
                                        </font></font></a>

                                        <b class="arrow"></b>
                                    </li>

                                    <li class="">
                                        <a href="#">
                                            <i class="menu-icon fa fa-eye pink"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                            查看商品
                                        </font></font></a>

                                        <b class="arrow"></b>
                                    </li>
                                </ul>
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

            <li class="">
                <a href="#" class="dropdown-toggle">
                    <i class="menu-icon fa fa-file-o"></i>

                    <span class="menu-text">
								其他页面

                        <!-- #section:basics/sidebar.layout.badge -->
								<span class="badge badge-primary">5</span>

                        <!-- /section:basics/sidebar.layout.badge -->
							</span>

                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a href="faq.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            帮助页面
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="error-404.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            404错误页面
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="error-500.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            500错误页面
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="grid.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            网格
                        </a>

                        <b class="arrow"></b>
                    </li>

                    <li class="">
                        <a href="blank.html">
                            <i class="menu-icon fa fa-caret-right"></i>
                            空白页面
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