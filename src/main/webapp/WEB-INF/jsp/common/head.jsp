<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>首页</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/ace.min.css" id="main-ace-style"/>
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.min.css"/>
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>

    <![endif]-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/ace-extra.min.js"></script>
    <!--[if lte IE 8]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <script src="assets/toastr/toastr.min.js"></script>
    <![endif]-->

</head>
<style type="text/css">

</style>
<body class="no-skin">
<div id="navbar" class="navbar navbar-default" style="height: 40px;">
    <div class="navbar-container" id="navbar-container">

        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
            <span class="sr-only">Toggle sidebar</span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>

            <span class="icon-bar"></span>
        </button>

        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-left">
            <!-- #section:basics/navbar.layout.brand -->
            <a href="#" class="navbar-brand">
                <small>
                    <img src="assets/avatars/logo.png" alt=""/>
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">

                <li class="green">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
                        <span class="badge badge-success" id="fa"></span>
                    </a>

                    <ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
                        <li class="dropdown-header">
                            <i class="ace-icon fa fa-envelope-o"></i>
                            <span id="fa1"></span>条未读信息
                        </li>

                        <li class="dropdown-content">
                            <ul class="dropdown-menu dropdown-navbar" id="ru">
                            </ul>
                        </li>

                        <li class="dropdown-footer">
                            <a href="javascript:;" id="xx">
                                查看全部消息
                                <i class="ace-icon fa fa-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- #section:basics/navbar.user_menu -->
                <li class="light-blue">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        <img class="nav-user-photo" src="assets/avatars/user.jpg" alt="Jason's Photo"/>
                        <span class="user-info">
									欢迎您<br/>
									${user.chineseName}
								</span>

                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="ace-icon fa fa-cog"></i>
                                系统设置
                            </a>
                        </li>

                        <li>
                            <a href="profile.html">
                                <i class="ace-icon fa fa-user"></i>
                                个人信息设置
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="/logout.do">
                                <i class="ace-icon fa fa-power-off"></i>
                                登出
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- /section:basics/navbar.user_menu -->
            </ul>
        </div>
        <!-- /section:basics/navbar.dropdown -->
    </div><!-- /.navbar-container -->
</div>
<script type="text/javascript">
    $(function () {
        function getMation() {
            $.ajax({
                url: "getMation.do",
                data: {},
                async: false,
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if(data.length>8){
                        $("#fa").text(8);
                        $("#fa1").text(8);
                    }else {
                        $("#fa").text(data.length);
                        $("#fa1").text(data.length);
                    }
                    $("#ru").empty();
                    var _html='';
                    $(data).each(function (i) {
                        if(i<8){
                            _html+='<li>\n' +
                                '                                    <a href="javascript:;" data-id="'+this.customerId+'" data-url="tofollowUpDeltail.do"\n' +
                                '                                       class="toDetailed" data-id1="'+this.mationId+'">\n' +
                                '                                            <span class="msg-body">\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t<span class="msg-title">\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t警告:您负责的<span class="blue">'+this.title+'</span>\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t</span>\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t</span>\n' +
                                '                                    </a>\n' +
                                '                                </li>'
                        }
                    });
                    $("#ru").append(_html);
                    rep();
                },
                error: function (errMsg) {
                }
            });

        }
        function rep(){
            $(".toDetailed").unbind().click(function(){
                var url=$(this).attr("data-url");
                $('#workstation').load(url,{id:$(this).attr("data-id"),id1:$(this).attr("data-id1")},function () {
                    getMation();
                });
            });
            $("#xx").unbind().click(function(){
                $('#workstation').load("toAllNews.do");
            });
        }
        getMation();
    });
</script>