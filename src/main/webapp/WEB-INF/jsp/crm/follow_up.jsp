<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="assets/css/datepicker.css"/>
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css"/>
<link rel="stylesheet" href="assets/css/daterangepicker.css"/>
<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.css"/>
<link rel="stylesheet" href="assets/newadd/fileinput.min.css"/>
<style type="text/css">
    .file-drop-zone {
        height: auto;
    }
</style>
<div id="add-reserve-guhijn" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    写跟进
                </h4>
            </div>
            <div class="modal-body col-lg-12">
                <form>
                    <div class="col-lg-12">
                        <div class="col-lg-6">
                            <div>
                                <select id="followMethod" style="width: 70%;">
                                    <option value="电话">电话</option>
                                    <option value="微信">微信</option>
                                    <option value="QQ">QQ</option>
                                    <option value="当面拜访">当面拜访</option>
                                    <option value="短信">短信</option>
                                    <option value="其他">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="input-group" style="float:right;">
                                <input id="date-timepicker1" type="text"/>
                                <span class="input-group-addon" style="width: 0%;">
							<i class="fa fa-clock-o bigger-110"></i>
							</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" style="margin-top: 20px">
                        <div class="">
                            <div class="col-lg-12">
                                <textarea class="col-lg-12" id="remarkss" maxlength="50" style="height: 200px"
                                          placeholder="勤跟进，多签单..."></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" style="margin-top: 20px">
                        <label class="control-label" for="testfile">上传文件</label>
                        <input type="file" id="testfile" name="test" multiple="multiple"/>
                    </div>
                    <div class="col-lg-12" style="margin-top: 20px">
                        <div class="col-lg-6">
                            <div class="col-lg-12 col-sm-12">
                                <span class="col-lg-2">名称：</span><input class="col-lg-8" type="text" id="userName"
                                                                        readonly="readonly" autocomplete="off"
                                                                        value="${customersName}"/>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="col-lg-3">跟进状态：</div>
                            <div class="col-lg-9">
                                <select style="width: 70%;" id="followupStatus">
                                    <option value="1">初步接触</option>
                                    <option value="2">意向客户</option>
                                    <option value="3">报价客户</option>
                                    <option value="4">成交客户</option>
                                    <option value="5">搁置客户</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="save">
                    确定
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
<script src="assets/js/date-time/moment.min.js"></script>
<script src="assets/js/date-time/daterangepicker.min.js"></script>
<script src="assets/js/date-time/bootstrap-datetimepicker.min.js"></script>
<script src="assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="assets/newadd/fileinput.min.js"></script>
<script src="assets/newadd/zh.js"></script>
<script type="text/javascript">
    $(function () {
        Date.prototype.format = function (fmt) { //author: meizz
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
        $('#date-timepicker1').val((new Date()).format('yyyy-MM-dd hh:mm'));
        $("#dls select").change(function () {
            if ($(this).val() != '0') {
                $("#yg").show();
                $.ajax({
                    url: "getCusinfo.do",
                    data: {
                        roleId: 6,
                        userArrangement: $(this).val()
                    },
                    type: "post",
                    dataType: "JSON",
                    success: function (data) {
                        var _html = '<option value="0">------------</option>';
                        $(data).each(function () {
                            _html += '<option value="' + this.userArrangement + '">' + this.chineseName + '</option>';
                        });
                        $("#yg select").empty();
                        $("#yg select").append(_html);
                    },
                    error: function (errMsg) {
                    }
                });
            } else {
                var _html = '<option value="0">------------</option>';
                $("#yg").hide();
                $("#yg select").empty();
                $("#yg select").append(_html);
            }
        });

    });
    $('#date-timepicker1').datetimepicker({
        format: "YYYY-MM-DD HH:mm",
        autoclose: true,
        showMeridian: true
    }).next().on(ace.click_event, function () {
        $(this).prev().focus();
    });
    $(function () {
        var container=$("#add-reserve-guhijn");
        var followupStatus, remarks, followMethod, createData;

        function add() {
            followupStatus = $("#followupStatus").val();
            remarks = $("#remarkss").val();
            followMethod = $("#followMethod").val();
            createData = $("#date-timepicker1").val();
        }

        function init() {
            $('#testfile').fileinput({
                language: 'zh',
                uploadUrl: 'uploadRecord.do',
                enctype: 'multipart/form-data',
                allowedFileExtensions: ['jpg', 'png', 'gif'],//接收的文件后缀
                uploadExtraData: function () {   //额外参数 返回json数组
                    return {
                        crmcustomersinfoId:${customerId},
                        customername: "${customersName}",
                        followupStatus: followupStatus,
                        remarks: remarks,
                        followMethod: followMethod,
                        createData: createData
                    };
                },
                minFileCount: 1,
                uploadAsync: false,
                layoutTemplates: {
                    actionUpload: '',//去除上传预览缩略图中的上传图片；
                },
                showUpload: false, //是否显示上传按钮
                showCaption: false,//是否显示标题
                browseClass: 'btn btn-primary',
                previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                showCancel: false,
            }).on("filebatchuploadsuccess", function (event, data) {
                if(data.response.message){
                    alert("成功！");
                    container.parent().modal('hide');
                    $('#select-product-p1123').find('#table').bootstrapTable('refresh');
                }
            }).on('fileerror', function (event, data, msg) {

            });
        }

        init();
        $("#save").click(function () {
            add();
            $('#testfile').fileinput('upload');
        });
    });

</script>