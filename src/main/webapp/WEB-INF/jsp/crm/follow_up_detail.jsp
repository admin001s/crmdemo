<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="assets/css/ace.min.css" id="main-ace-style"/>
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<style>
    .warning {
        border: 1px solid red;
    }
</style>
<div class="main-content">
    <!-- #section:basics/content.breadcrumbs -->
    <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="ace-icon fa fa-desktop home-icon"></i>
                <a href="javascript:;" id="index">客户</a>
            </li>
            <li>
                <a href="javascript:;">跟进记录</a>
            </li>
        </ul><!-- /.breadcrumb -->

        <!-- #section:basics/content.searchbox -->

    </div>

    <!-- /section:basics/content.breadcrumbs -->
    <div class="page-content">

        <!-- /section:settings.box -->
        <div class="page-content-area">
            <div class="page-header">
                <h1>
                    ${crmcustomersinfo.customersName}
                    <small>
                        负责人：${fzrCrminfo.chineseName}
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <div class="col-sm-10 col-lg-4">
                        <div class="widget-box transparent invoice-box">
                            <div class="widget-header widget-header-large">
                                <h3 class="grey lighter pull-left position-relative">
                                    <i class="icon-leaf green"></i>
                                    客户详情
                                </h3>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <ul class="list-unstyled spaced" style="font-size: 18px;">
                                                    <div class="row" style="margin-bottom: 30px;margin-top: 20px">
                                                        <div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
                                                            <b>基本信息</b>
                                                        </div>
                                                    </div>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        客户姓名：${crmcustomersinfo.customersName}
                                                    </li>

                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        客户编号：${crmcustomersinfo.customersId}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        性别：
                                                        <c:if test="${crmcustomersinfo.customersSex == 0}">男</c:if>
                                                        <c:if test="${crmcustomersinfo.customersSex == 1}">女</c:if>
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        公司名称：${crmcustomersinfo.companywebsite}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        部门：${crmcustomersinfo.department}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        是否VIP：
                                                        <c:if test="${crmcustomersinfo.isVip==0}">黄金VIP</c:if>
                                                        <c:if test="${crmcustomersinfo.isVip==1}">普通会员</c:if>
                                                    </li>

                                                    <div class="row" style="margin-bottom: 30px;margin-top: 20px">
                                                        <div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                                            <b>联系方式</b>
                                                        </div>
                                                    </div>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        联系电话:
                                                        <b class="red">${crmcustomersinfo.telephone}</b>
                                                    </li>

                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        QQ：${crmcustomersinfo.qq}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        邮箱：${crmcustomersinfo.email}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        地区：${crmcustomersinfo.provinceName}-${crmcustomersinfo.cityName}-${crmcustomersinfo.mainsalesarea}
                                                    </li>

                                                    <div class="row" style="margin-bottom: 30px;margin-top: 20px">
                                                        <div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                                            <b>其他信息</b>
                                                        </div>
                                                    </div>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        公司网址：${crmcustomersinfo.customerUrlSource}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        公司地址：${crmcustomersinfo.companyAddress}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right green"></i>
                                                        地图：<a href="javascript:;" id="mapLook"> 查看地图</a><a href="javascript:;" id="clearMap"> 关闭地图</a>
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        公司详情：${crmcustomersinfo.companydetails}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        公司主要产品：${crmcustomersinfo.mainproducts}
                                                    </li>
                                                    <div class="row" style="margin-bottom: 30px;margin-top: 20px">
                                                        <div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                                            <b>系统信息</b>
                                                        </div>
                                                    </div>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        负责人：${fzrCrminfo.chineseName}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        创建人：${addCrmifo.chineseName}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        创建时间：${crmcustomersinfo.createTime}
                                                    </li>
                                                    <li>
                                                        <i class="icon-caret-right blue"></i>
                                                        更新时间：${crmcustomersinfo.updateTime}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div><!-- row -->
                                    <div class="space"></div>
                                    <div class="hr hr8 hr-double hr-dotted"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="timeline-1" class="col-lg-7">
                        <div class="row" id="map">
                            <div class="widget-box transparent invoice-box">
                                <div class="widget-header widget-header-large">
                                    <h3 class="grey lighter pull-left position-relative">
                                        <i class="icon-leaf green"></i>
                                        地图
                                    </h3>
                                </div>
                                <div style="height:550px;border:#ccc solid 1px;" class="col-lg-12" id="dituContents"></div>
                            </div>

                        </div>
                        <div class="row" id="map1">
                            <div class="widget-box transparent invoice-box">
                                <div class="widget-header widget-header-large">
                                    <h3 class="grey lighter pull-left position-relative">
                                        <i class="icon-leaf green"></i>
                                        销售情况：
                                    </h3>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-10 col-sm-offset-1" id="responsible">
                                <!-- #section:pages/timeline -->
                            </div>
                        </div>
                    </div>
                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content-area -->
    </div><!-- /.page-content -->
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"  >
        <div class="modal-content">
            <div class="modal-header" style="border-bottom:0px;">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×
                </button>
            </div>
            <div class="modal-body">
                <div id="img_show" >
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script type="text/javascript">
    $("#map").hide();
    $("#clearMap").hide();
    $("#clearMap").click(function(){
        $("#map").hide();
        $("#clearMap").hide();
        $("#map1").show();
        $("#mapLook").show();
        $(this).hide();
    });

    $("#mapLook").click(function(){
        if(window.navigator.onLine==true){
            $("#map").show();
            $("#clearMap").show();
            $("#map1").hide();
            $(this).hide();
            var map = new BMap.Map("dituContents");
            var point = new BMap.Point(116.331398,39.897445);
            map.centerAndZoom(point,12);
            // 创建地址解析器实例
            var myGeo = new BMap.Geocoder();
            var topoint;
            // 将地址解析结果显示在地图上,并调整地图视野
            myGeo.getPoint("${crmcustomersinfo.companyAddress}", function(point){
                if (point) {
                    map.centerAndZoom(point, 20);
                    map.addOverlay(new BMap.Marker(point));
                    topoint=point;
                }else{
                    alert("您选择地址没有解析到结果!");
                }
            }, "${crmcustomersinfo.provinceName}${crmcustomersinfo.cityName}");
            /*var geolocation = new BMap.Geolocation();
            geolocation.getCurrentPosition(function(r){
                if(this.getStatus() == BMAP_STATUS_SUCCESS){
                    var myP1 = new BMap.Point(r.point.lng,r.point.lat);    //起点
                    var myP2 = new BMap.Point(topoint.lng,topoint.lat);    //终点
                    var driving2 = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});    //驾车实例
                    driving2.search(myP1, myP2);    //显示一条公交线路
                }
                else {
                }
            },{enableHighAccuracy: true});*/

            setMapEvent();
            addMapControl();
            //地图事件设置函数：
            function setMapEvent(){
                map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
                map.enableScrollWheelZoom();//启用地图滚轮放大缩小
                map.enableKeyboard();//启用键盘上下左右键移动地图
            }

            //地图控件添加函数：
            function addMapControl(){
                //向地图中添加缩放控件
                var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_LARGE});
                /*map.addControl(ctrl_nav);*/
                //向地图中添加缩略图控件
                var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:1});
                map.addControl(ctrl_ove);
                //向地图中添加比例尺控件
                var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
                map.addControl(ctrl_sca);
            }
            var navigationControl = new BMap.NavigationControl({
                // 靠左上角位置
                anchor: BMAP_ANCHOR_TOP_LEFT,
                // LARGE类型
                type: BMAP_NAVIGATION_CONTROL_LARGE,
                // 启用显示定位
                enableGeolocation: true
            });
            map.addControl(navigationControl);
            // 添加定位控件
            var geolocationControl = new BMap.GeolocationControl();
            geolocationControl.addEventListener("locationSuccess", function(e){
                // 定位成功事件
            });
            geolocationControl.addEventListener("locationError",function(e){
                // 定位失败事件

            });
            map.addControl(geolocationControl);
        }
        else{

        }


    });

</script>




<!-- page specific plugin scripts -->
<script src="assets/js/fuelux/fuelux.wizard.min.js"></script>
<script src="assets/js/jquery.validate.min.js"></script>
<script src="assets/js/additional-methods.min.js"></script>
<script src="assets/js/bootbox.min.js"></script>
<script src="assets/js/jquery.maskedinput.min.js"></script>
<script src="assets/js/select2.min.js"></script>
<!-- ace scripts -->
<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/jquery.nestable.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
   /* $("#map").click(function(){
        $('#workstation').load("map.do");
    });*/
    function showimage(source)
    {
        $("#myModal").find("#img_show").html("<image src='"+source+"' class='carousel-inner img-responsive img-rounded' />");
        $("#myModal").modal();
    }
    jQuery(function ($) {

        $('.dd').nestable({
            group: 1,
            maxDepth: 2
        });
        $('.dd').nestable('collapseAll');
    });
    jQuery(function ($) {
        $("#index").click(function () {
            $('#workstation').load("customer.do");
        });

        function responsible() {
            $.ajax({
                url: "responsible.do",
                data: {
                    id:${crmcustomersinfo.id}
                },
                type: "post",
                dataType: "JSON",
                success: function (data) {
                    var date;
                    var _html = '';
                    var is = false;
                    $(data).each(function (i) {
                        if (date != this.createDate) {
                            date = this.createDate;
                            if (is) {
                                _html += "</div>\n" +
                                    "                                </div>\n" +
                                    "                            </div>";
                            }
                            _html += '<div class="timeline-container"><div class="timeline-label"><!-- #section:pages/timeline.label --><span class="label label-primary arrowed-in-right label-lg"><b>' + this.createDate + '</b></span></div>\n' +
                                '\n' +
                                '                                    <div class="timeline-items">\n' +
                                '                                        <div class="timeline-item clearfix">' +
                                '<div class="widget-box transparent">\n' +
                                '                                                <div class="widget-header widget-header-small">\n' +
                                '                                                    <h5 class="widget-title smaller">\n' +
                                '                                                        <a href="#" class="blue"></a>\n' +
                                '                                                        <span class="grey">${user.chineseName}&nbsp;&nbsp;&nbsp;';
                                if(this.followMethod!=null){
                                    _html+='<i class="fa fa-caret-right fz8"></i>'+this.followMethod;
                                }
                                _html+='</span>\n                                                    </h5>\n' +
                                '\n' +
                                '                                                    <span class="widget-toolbar no-border">\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class="ace-icon fa fa-clock-o bigger-110"></i>\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t' + this.time + '\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</span>\n' +
                                '                                                </div>\n';
                            if (this.responsible != null) {
                                if (this.responsible.responsible == null) {
                                    _html += '                                             <div class="widget-body dd-handle">\n' +
                                        '                                                    <div class="widget-main">\n' +
                                        '                                                        转交负责人：' + this.responsible.toresponsible +
                                        '                                                    </div>\n' +
                                        '                                                </div>\n' +
                                        '                                            <div class="widget-body dd-handle">\n' +
                                        '                                                    <div class="widget-main">\n' +
                                        '                                                        创建时间：\n' +
                                        '                                                        <span class="red">' + this.responsible.createTime + '</span>\n' +
                                        '                                                    </div>\n' +
                                        '                                                </div>\n' +
                                        '                                            </div>';
                                } else {
                                    _html += '                                             <div class="widget-body dd-handle">\n' +
                                        '                                                    <div class="widget-main">\n' +
                                        '                                                        负责人由：' + this.responsible.responsible + '转交给' + this.responsible.toresponsible +
                                        '                                                    </div>\n' +
                                        '                                                </div>\n' +
                                        '                                            <div class="widget-body dd-handle">\n' +
                                        '                                                    <div class="widget-main">\n' +
                                        '                                                        创建时间：\n' +
                                        '                                                        <span class="red">' + this.responsible.createTime + '</span>\n' +
                                        '                                                    </div>\n' +
                                        '                                                </div>\n' +
                                        '                                            </div>';
                                }

                            } else {
                                _html += '                                             <div class="widget-body dd-handle">\n' +
                                    '                                                    <div class="widget-main">\n' +
                                    '                                                        ' + this.remarks +
                                    '                                                    </div>\n' +
                                    '                                                </div>\n' +
                                    '                                                <div class="dd">\n' +
                                    '                                                    <ol class="dd-list">\n' +
                                    '                                                        <li class="dd-item dd-nodrag" data-id="1">\n' +
                                    '                                                            <div class="dd-handle">查看聊天记录</div>\n' +
                                    '                                                            <ol class="dd-list">\n' +
                                    '                                                                <li class="dd-item" data-id="2">\n' +
                                    '                                                                    <div class="dd-handle">\n';
                                $(this.path).each(function () {
                                    _html += '<img  src="/Path/' + this + '" width="100%" height="50%" onclick="javascript:showimage(\'/Path/'+this+'\');"/>\n';
                                });

                                _html += '                                                                    </div>\n' +
                                    '                                                                </li>\n' +
                                    '                                                            </ol>\n' +
                                    '                                                        </li>\n' +
                                    '                                                    </ol>\n' +
                                    '                                                </div>\n' +
                                    '                                            <div class="widget-body dd-handle">\n' +
                                    '                                                    <div class="widget-main">\n' +
                                    '                                                        创建时间：\n' +
                                    '                                                        <span class="red">' + this.createTime + '</span>\n' +
                                    '                                                    </div>\n' +
                                    '                                                </div>\n' +
                                    '                                            </div>';
                            }
                            is = true;
                            if (i + 1 == data.length) {
                                _html += "</div>\n" +
                                    "                                </div>\n" +
                                    "                            </div>";
                            }
                        } else {
                            _html += '                                    <div class="timeline-items" style="margin-top: 20px">\n' +
                                '                                        <div class="timeline-item clearfix">' +
                                '<div class="widget-box transparent">\n' +
                                '                                                <div class="widget-header widget-header-small">\n' +
                                '                                                    <h5 class="widget-title smaller">\n' +
                                '                                                        <a href="#" class="blue"></a>\n' +
                                '                                                        <span class="grey">${user.chineseName}&nbsp;&nbsp;&nbsp;';
                            if(this.followMethod!=null){
                                _html+='<i class="fa fa-caret-right fz8"></i>'+this.followMethod;
                            }
                                _html+='</span>\n                                                    </h5>\n' +
                                '\n' +
                                '                                                    <span class="widget-toolbar no-border">\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<i class="ace-icon fa fa-clock-o bigger-110"></i>\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t' + this.time + '\n' +
                                '\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</span>\n' +
                                '                                                </div>\n';
                            if (this.responsible != null) {
                                if (this.responsible.responsible == null) {
                                    _html += '                                             <div class="widget-body dd-handle">\n' +
                                        '                                                    <div class="widget-main">\n' +
                                        '                                                        转交负责人：' + this.responsible.toresponsible +
                                        '                                                    </div>\n' +
                                        '                                                </div>\n' +
                                        '                                            <div class="widget-body dd-handle">\n' +
                                        '                                                    <div class="widget-main">\n' +
                                        '                                                        创建时间：\n' +
                                        '                                                        <span class="red">' + this.responsible.createTime + '</span>\n' +
                                        '                                                    </div>\n' +
                                        '                                                </div>\n' +
                                        '                                            </div>';
                                } else {
                                    _html += '                                             <div class="widget-body dd-handle">\n' +
                                        '                                                    <div class="widget-main">\n' +
                                        '                                                        负责人由：' + this.responsible.responsible + '转交给' + this.responsible.toresponsible +
                                        '                                                    </div>\n' +
                                        '                                                </div>\n' +
                                        '                                            <div class="widget-body dd-handle">\n' +
                                        '                                                    <div class="widget-main">\n' +
                                        '                                                        创建时间：\n' +
                                        '                                                        <span class="red">' + this.responsible.createTime + '</span>\n' +
                                        '                                                    </div>\n' +
                                        '                                                </div>\n' +
                                        '                                            </div>';
                                }

                            } else {
                                _html += '                                             <div class="widget-body dd-handle">\n' +
                                    '                                                    <div class="widget-main">\n' +
                                    '                                                        ' + this.remarks +
                                    '                                                    </div>\n' +
                                    '                                                </div>\n' +
                                    '                                                <div class="dd">\n' +
                                    '                                                    <ol class="dd-list">\n' +
                                    '                                                        <li class="dd-item dd-nodrag" data-id="1">\n' +
                                    '                                                            <div class="dd-handle">查看聊天记录</div>\n' +
                                    '                                                            <ol class="dd-list">\n' +
                                    '                                                                <li class="dd-item" data-id="2">\n' +
                                    '                                                                    <div class="dd-handle">\n';
                                $(this.path).each(function () {
                                    _html += '<img src="/Path/' + this + '" width="100%" height="50%" onclick="javascript:showimage(\'/Path/'+this+'\');"/>\n';
                                });
                                _html += '                                                                    </div>\n' +
                                    '                                                                </li>\n' +
                                    '                                                            </ol>\n' +
                                    '                                                        </li>\n' +
                                    '                                                    </ol>\n' +
                                    '                                                </div>\n' +
                                    '                                            <div class="widget-body dd-handle">\n' +
                                    '                                                    <div class="widget-main">\n' +
                                    '                                                        创建时间：\n' +
                                    '                                                        <span class="red">' + this.createTime + '</span>\n' +
                                    '                                                    </div>\n' +
                                    '                                                </div>\n' +
                                    '                                            </div>';
                            }
                            if (i + 1 == data.length) {
                                _html += "</div>\n" +
                                    "                                </div>\n" +
                                    "                            </div>";
                            }
                        }

                    });
                    $("#responsible").append(_html);
                    $('.dd').nestable({
                        group: 1,
                        maxDepth: 2
                    });
                    $('.dd').nestable('collapseAll');

                },
                error: function (errMsg) {
                }
            });
        }

        responsible();
    })
</script>

