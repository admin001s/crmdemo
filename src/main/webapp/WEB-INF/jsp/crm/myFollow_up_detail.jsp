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
                <a href="javascript:;">我的跟进记录</a>
            </li>
        </ul><!-- /.breadcrumb -->

        <!-- #section:basics/content.searchbox -->

    </div>

    <!-- /section:basics/content.breadcrumbs -->
    <div class="page-content">

        <!-- /section:settings.box -->
        <div class="page-content-area">

            <div class="row">
                <div class="col-xs-12">
                    <div id="timeline-1" class="col-lg-7">
                        <div class="row" id="map1">
                            <div class="widget-box transparent invoice-box">
                                <div class="widget-header widget-header-large">
                                    <h3 class="grey lighter pull-left position-relative">
                                        <i class="icon-leaf green"></i>
                                        跟进记录：
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
                url: "myFollow.do",
                data: {
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
                                    '                                                        跟进时间：\n' +
                                    '                                                        <span class="red">' + this.createTime + '</span>\n' +
                                    '                                                    </div>\n' +
                                    '                                                    <div class="widget-main">\n' +
                                    '                                                        来自客户：\n' +
                                    '                                                       <a href="javascript:;" class="kxx" data-id="'+this.crmcustomersinfo.id+'"> <span class="red">' + this.crmcustomersinfo.customersName + '</span></a>\n' +
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
                                    '                                                        跟进时间：\n' +
                                    '                                                        <span class="red">' + this.createTime + '</span>\n' +
                                    '                                                    </div>\n' +
                                    '                                                    <div class="widget-main">\n' +
                                    '                                                        来自客户：\n' +
                                    '                                                        <span class="red">' + this.crmcustomersinfo.customersName + '</span>\n' +
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
                    kxx();
                },
                error: function (errMsg) {
                }
            });
        }
        function kxx(){
            $("#kxx").unbind().click(function () {
                $('#workstation').load("tofollowUpDeltail.do", {
                    id: $(this).attr("data-id")
                }, function () {
                });
            });
        }
        responsible();
    })
</script>

