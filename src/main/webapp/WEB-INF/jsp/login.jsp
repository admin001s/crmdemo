<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录页面</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-fonts.css"/>
    <link rel="stylesheet" href="assets/css/ace.min.css" id="main-ace-style"/>
    <link rel="stylesheet" href="assets/toastr/toastr.min.css"/>
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.min.css"/>
    <![endif]-->
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="assets/newadd/style.css"/>
    <style>
        .admin_login {
            background: #213838;
        }

        canvas {
            z-index: -1;
            position: absolute;
        }
    </style>
    <script src="assets/newadd/jquery.js"></script>
    <script src="assets/newadd/verificationNumbers.js"></script>
    <script src="assets/newadd/Particleground.js"></script>
    <script src="assets/js/ace-extra.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <!--[if lte IE 8]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        h1 {
            color: #fff;
            text-align: center;
            font-weight: 100;
            margin-top: 40px;
        }

        #media {
            width: 280px;
            height: 250px;
            margin: 10px auto 0;
            border-radius: 30px;
            overflow: hidden;
            opacity: 0.7px;
        }

        #video {

        }

        #canvas {
            display: none;
        }

        #btn {
            width: 160px;
            height: 50px;
            background: #03a9f4;
            margin: 70px auto 0;
            text-align: center;
            line-height: 50px;
            color: #fff;
            border-radius: 40px;
        }
    </style>
</head>
<body class="login-layout blur-login">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                        <h1>
                            <span class="white">奋斗CRM</span>
                        </h1>
                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-coffee green"></i>
                                        输入登录信息
                                    </h4>

                                    <div class="space-6"></div>

                                    <form action="index.do">
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="用户名"
                                                                   id="crmName"/>
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码"
                                                                   id="crmPwd"/>
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                            </label>

                                            <div class="space"></div>

                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" class="ace"/>
                                                    <span class="lbl"> 记住我</span>
                                                </label>

                                                <button type="button" class="width-35 pull-right btn btn-sm btn-primary"
                                                        id="comment">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">登录</span>
                                                </button>
                                            </div>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>

                                </div><!-- /.widget-main -->

                                <div class="toolbar clearfix">
                                    <div>
                                        <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            忘记密码
                                        </a>
                                    </div>

                                    <div>
                                        <a href="#" data-target="#signup-box" id="sl" class="user-signup-link">
                                            用户注册
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.login-box -->

                        <div id="forgot-box" class="forgot-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header red lighter bigger">
                                        <i class="ace-icon fa fa-key"></i>
                                        重置密码
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>
                                        输入您注册时候的email，用以接收密码重置信息
                                    </p>

                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control"
                                                                   placeholder="Email"/>
															<i class="ace-icon fa fa-envelope"></i>
														</span>
                                            </label>

                                            <div class="clearfix">
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                    <span class="bigger-110">发送!</span>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div><!-- /.widget-main -->

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        返回登录
                                        <i class="ace-icon fa fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.forgot-box -->

                        <div class="col-lg-12">
                            <dl class="admin_login signup-box widget-box no-border" id="signup-box">
                                <dt>
                                    <strong>后台管理系统</strong><em></em> <strong>请把你的脸放摄像头面前</strong>
                                </dt>
                                <div id="media">
                                    <video id="video" width="530" height="300" autoplay></video>
                                    <canvas id="canvas" width="400" height="300"></canvas>
                                </div>
                                <dd>
                                    <input type="button" onclick="query()" value="立即登录"
                                           class="submit_btn"/>
                                </dd>
                                <div class="toolbar center">
                                    <a href="#" id="close" data-target="#login-box" class="back-to-login-link">
                                        返回登录
                                        <i class="ace-icon fa fa-arrow-right"></i>
                                    </a>
                                </div>

                            </dl>
                            <script type="text/javascript" src="assets/newadd/jquery-3.1.1.min.js"></script>
                            <script type="text/javascript">
                                //var 是定义变量
                                var video = document.getElementById("video"); //获取video标签
                                var context = canvas.getContext("2d");
                                var con = {
                                    audio: false,
                                    video: {
                                        width: 1980,
                                        height: 1024,
                                    }
                                };

                                /*
                                                                $("#close").click(function(){
                                                                    context.drawImage(video,0,0,1024,800)
                                                                });*/
                                function index(userId) {
                                    $.ajax({
                                        type: "post",
                                        url: "login2.do",
                                        data: {"userId": userId},
                                        dataType: "JSON",
                                        success: function (data) {
                                            /* alert(data) */
                                            if (data) {
                                                window.location.href = "index.do";
                                            } else {

                                            }
                                        }
                                    });
                                }

                                function db(userId,base) {
                                    var a = false;
                                    $.ajax({
                                        type: "post",
                                        url: "contrast.do",
                                        async: false,
                                        data: {"userId": userId,"base":base},
                                        dataType: "JSON",
                                        success: function (data) {
                                            /* alert(data) */
                                            if (data.error_code == 0) {
                                                if (data.result.score > 90) {
                                                    a = true;
                                                } else {
                                                    a = false;
                                                }
                                            } else {
                                                a = false;
                                            }
                                        }
                                    });
                                    return a;
                                }

                                function jc(base) {
                                    var a = false;
                                    $.ajax({
                                        type: "post",
                                        url: "quality.do",
                                        async: false,
                                        data: {"base": base},
                                        dataType: "JSON",
                                        success: function (data) {
                                            /* alert(data) */
                                            if (data) {
                                                a = true;
                                            } else {
                                                a = false;
                                            }
                                        }
                                    });
                                    return a;
                                }

                                $("#sl").click(function () {
                                    //导航 获取用户媒体对象
                                    navigator.mediaDevices.getUserMedia(con)
                                        .then(function (stream) {
                                            video.src = window.URL.createObjectURL(stream);
                                            video.onloadmetadate = function (e) {
                                                video.play();
                                            }
                                        });
                                });

                                function query() {

                                    //把流媒体数据画到convas画布上去
                                    context.drawImage(video, 0, 0, 400, 300);
                                    var base = getBase64();

                                    if(jc(base)){
                                        $.ajax({
                                            type: "post",
                                            url: "recognition.do",
                                            data: {"base": base},
                                            dataType: "JSON",
                                            success: function (data) {
                                                /* alert(data) */
                                                if (data.error_code == 0) {
                                                    if (data.result.user_list[0].score > 90) {
                                                        var id = data.result.user_list[0].user_id;
                                                        /*if (db(id,base)) {*/
                                                            index(id);
                                                        /*} else {
                                                            alert("重新识别！");
                                                        }*/
                                                    } else {
                                                        toastr.error("重新识别！");
                                                    }
                                                } else if (data.error_code == 222207) {
                                                    toastr.error("无此人！");
                                                } else if (data.error_code == 222202 || data.error_code == 222203) {
                                                    toastr.error("未检测到人脸！");
                                                }
                                                else if (data.error_code == 223113 || data.error_code == 223114 || data.error_code == 223115 || data.error_code == 223116 || data.error_code == 223121
                                                    || data.error_code == 223122 || data.error_code == 223123 || data.error_code == 223124 || data.error_code == 223125 || data.error_code == 223126
                                                    || data.error_code == 223127) {
                                                    toastr.error("请到光线强的地方，请不到遮头掩面，请露出眉毛！");
                                                }
                                            }
                                        });
                                    }


                                }

                                function getBase64() {
                                    var imgSrc = document.getElementById("canvas").toDataURL(
                                        "image/png");
                                    return imgSrc.split("base64,")[1];

                                };
                            </script>
                        </div>
                    </div><!-- /.position-relative -->

                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery.min.js'>" + "<" + "/script>");
</script>

<!-- <![endif]-->
<script src="assets/toastr/toastr.min.js"></script>
<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>" + "<" + "/script>");
</script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {
        $(document).on('click', '.toolbar a[data-target]', function (e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });

        $("#comment").on('click', function () {
            $.ajax({
                url: "dologin.do",
                data: {
                    userName: $("#crmName").val().trim(),
                    passWord: $("#crmPwd").val().trim()
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    if (data.is) {
                        toastr.success(data.tips);
                        window.location.href = "/index.do";
                    } else {
                        toastr.error(data.tips);
                    }
                },
                error: function (errMsg) {
                }
            });
        });
    });

</script>
</body>
</html>
