<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<link rel="stylesheet" href="assets/newadd/zTreeStyle.css"/>
<!-- /section:basics/sidebar -->
<div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-home home-icon"></i>
                <a href="javascript:;">首页</a>
            </li>
        </ul><!-- /.breadcrumb -->


        <!-- /section:basics/content.searchbox -->
    </div>

    <div class="page-content">
        <!-- /section:settings.box -->
        <div class="page-content-area">

            <div class="row">
                <div class="col-xs-12">
                    <div class="widget-box widget-color-blue">
                        <div class="widget-header">
                            <h4 class="widget-title lighter smaller">员工</h4>
                        </div>
                        <div class="zTreeDemoBackground left">
                            <ul id="treePermission" class="ztree"></ul>
                        </div>
                    </div>
                    <div class="widget-box widget-color-green">
                        <div class="widget-header">
                            <h4 class="widget-title lighter smaller">统计</h4>
                        </div>
                        <div class="col-lg-9 col-xs-12 col-sm-6 widget-container-span">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h5 style="display:inline-block;">签单</h5>

                                    <div class="widget-toolbar">

                                        <a href="#" class="icon-chevron-down">

                                        </a>

                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-body"
                                         style="border: 1px solid #e3e3e3;">
                                        <div id="main" style="height:400px"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-sm-6 widget-container-span">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h5 style="display:inline-block;">跟进客户</h5>

                                    <div class="widget-toolbar">

                                        <a href="javascript:;" class="icon-chevron-down">

                                        </a>

                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-body"
                                         style="border: 1px solid #e3e3e3;">
                                        <div id="main1" style="height:400px"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9 col-sm-6 widget-container-span">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h5 style="display:inline-block;">跟进次数</h5>

                                    <div class="widget-toolbar">

                                        <a href="javascript:;" class="icon-chevron-down">

                                        </a>

                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-body"
                                         style="border: 1px solid #e3e3e3;">
                                        <div id="main2" style="height:400px"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content-area -->
    </div><!-- /.page-content -->
</div>
<!-- /.main-content -->
<script src="assets/newadd/jquery.ztree.core-3.5.js"></script>
<script src="assets/echarts/echarts-all.js"></script>
<script type="text/javascript">
    var userId =${user.userId};

    xs();

    function xs() {
        var myChart = echarts.init(document.getElementById('main'), 'macarons');
        $.ajax({
            url: "statisticalsignature.do",
            data: {
                userId: userId
            },
            async: false,
            type: "post",
            dataType: "JSON",
            success: function (data) {
                var time = [];
                var my = [];
                var all = [];
                $(data.my).each(function () {
                    time.push(this.orderId + "月");
                    my.push(this.reviewerId);
                });
                $(data.all).each(function () {
                    all.push(this.reviewerId);
                });
                if (time == "") {
                    time = [""];
                }
                option = {
                    title: {
                        text: '签单统计',
                        subtext: '最近7月',
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['本人', '下属']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: time
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} /人'
                            }
                        }
                    ],
                    series: [
                        {
                            name: '本人',
                            type: 'line',
                            data: my,
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        },
                        {
                            name: '下属',
                            type: 'line',
                            data: all,
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        }
                    ]
                };
                // 为echarts对象加载数据
                myChart.setOption(option);
            },
            error: function (errMsg) {
            }
        });
    }

    gj();

    function gj() {
        var myChart = echarts.init(document.getElementById('main1'), 'macarons');
        $.ajax({
            url: "statisticalfollowup.do",
            data: {
                userId: userId
            },
            async: false,
            type: "post",
            dataType: "JSON",
            success: function (data) {
                var time = [];
                var my = [];
                var all = [];
                $(data.my).each(function () {
                    time.push("" + this.distributionDate);
                    my.push(this.userId);
                });
                if (data.my == null) {
                    time = [];
                }
                $(data.all).each(function () {
                    time.push("" + this.distributionDate);
                    all.push(this.userId);
                });
                if (time == "") {
                    time = [""];
                }
                option = {
                    title: {
                        text: '跟进',
                        subtext: '跟进客户'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['本人', '下属']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            data: time
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisLabel: {
                                formatter: '{value} /人'
                            }
                        }
                    ],
                    series: [
                        {
                            name: '本人',
                            type: 'bar',
                            data: my,
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        },
                        {
                            name: '下属',
                            type: 'bar',
                            data: all,
                            markLine: {
                                data: [
                                    {type: 'average', name: '平均值'}
                                ]
                            }
                        }
                    ]
                };
                myChart.setOption(option);
            },
            error: function (errMsg) {
            }
        });
    }

    cs();

    function cs() {
        var myChart = echarts.init(document.getElementById('main2'), 'macarons');
        $.ajax({
            url: "statisticalfollowup.do",
            data: {
                userId: userId
            },
            async: false,
            type: "post",
            dataType: "JSON",
            success: function (data) {
                var time = [];
                var my = [];
                var all = [];
                $(data.my).each(function () {
                    time.push("" + this.distributionDate);
                    my.push(this.userId);
                });
                if (data.my == null) {
                    time = [];
                }
                $(data.all).each(function () {
                    time.push("" + this.distributionDate);
                    all.push(this.userId);
                });
                if (time == "") {
                    time = [""];
                }
                option = {
                    tooltip: {
                        trigger: 'axis'
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            magicType: {show: true, type: ['line', 'bar']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    legend: {
                        data: ['本人', '下属']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: time
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: '次数',
                            axisLabel: {
                                formatter: '{value} /次'
                            }
                        },
                        {
                            type: 'value',
                            name: '次数',
                            axisLabel: {
                                formatter: '{value} /次'
                            }
                        }
                    ],
                    series: [

                        {
                            name: '本人',
                            type: 'bar',
                            data: my
                        },
                        {
                            name: '下属',
                            type: 'line',
                            yAxisIndex: 1,
                            data: all
                        }
                    ]
                };

                myChart.setOption(option);
            },
            error: function (errMsg) {
            }
        });
    }

    var setting = {
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "pid",
                rootPId: 0
            },
            key: {
                name: "name"
            }
        },
        callback: {
            beforeClick: zTreeBeforeClick
        }
    };

    function zTreeBeforeClick(treeId, treeNode, clickFlag) {
        //alert("treeNode.id--->"+treeNode.id);
        //alert("treeNode.url--->"+treeNode.url);
        //alert("treeNode.name--->"+treeNode.title);
        userId = treeNode.id;
        xs();
        gj();
        cs();
    };
    $(function(){
        $('.icon-chevron-down, .icon-chevron-up').click(function () {
            var el = $(this).parents(".widget-box").children(".widget-body");
            if (jQuery(this).hasClass("icon-chevron-down")) {
                jQuery(this).removeClass("icon-chevron-down").addClass("icon-chevron-up");
                el.slideUp(200);
            } else {
                jQuery(this).removeClass("icon-chevron-up").addClass("icon-chevron-down");
                el.slideDown(200);
            }
        });
    });

    $(document).ready(function () {

        $.ajax({
            url: "users.do",
            data: {},
            async: false,
            type: "post",
            dataType: "JSON",
            success: function (data) {
                $.fn.zTree.init($("#treePermission"), setting, data);
            },
            error: function (errMsg) {
            }
        });
    });


</script>