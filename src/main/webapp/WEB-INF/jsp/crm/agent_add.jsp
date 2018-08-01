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
                <h3 class="modal-title">添加代理商</h3>
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
                                        <label class="col-lg-3 col-sm-3 control-label no-padding-right" for="agentsId">
                                            代理商联系人编号：</label>
                                        <div class="col-lg-9 col-sm-9">
                                            <input type="text" id="agentsId" placeholder="输入代理商联系人编号"
                                                   class="col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="agentaddress">代理商联系地址： </label>

                                        <div class="col-sm-9">
                                            <input type="text" id="agentaddress" placeholder="输入代理商联系地址"
                                                   class=" col-xs-10 col-sm-5" autocomplete="off"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1-1">代理商联系人性别: </label>
                                        <div class="col-sm-9">
                                            <div>
                                                <label class="line-height-1 blue">
                                                    <input name="agentsex" id="form-field-1-1-1" value="0"
                                                           type="radio" class="ace" checked/>
                                                    <span class="lbl"> 男</span>
                                                </label>
                                                <label class="line-height-1 blue">
                                                    <input name="agentsex" value="1" type="radio" class="ace"/>
                                                    <span class="lbl"> 女</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /section:elements.form -->

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                               for="agentphone">代理商联系电话:</label>
                                        <div class="col-xs-12 col-sm-9">
                                            <div class="input-group">
																	<span class="input-group-addon">
																		<i class="ace-icon fa fa-phone"></i>
																	</span>
                                                <input type="tel" id="agentphone" name="phone"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-xs-12 col-sm-3 no-padding-right"
                                               for="agentemail">代理商邮箱:</label>

                                        <div class="col-xs-12 col-sm-9">
                                            <div class="clearfix">
                                                <input type="email" name="email" id="agentemail"
                                                       class="col-xs-12 col-sm-6"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="agentQq">QQ： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="agentQq" placeholder="输入QQ"
                                                   class="col-xs-10 col-sm-5"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right"
                                               for="agentName">代理商联络人： </label>
                                        <div class="col-sm-9">
                                            <input type="text" autocomplete="off" id="agentName" placeholder="输入代理商联络人"
                                                   class="col-xs-10 col-sm-5"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="agentMessage">代理商其它信息：</label>
                                        <div class="col-sm-9">
                                            <div class="pos-rel">
                                                <textarea class="form-control limited autosize-transition"
                                                          id="agentMessage" maxlength="50"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /.col -->
                            </div><!-- /.row -->
                        </div><!-- /.page-content-area -->
                    </div><!-- /.page-content -->
                </div>
                <div class="modal-footer">
                    <button class="btn btn-info" type="button" onclick="add()">
                        <i class="ace-icon fa fa-check bigger-110"></i>
                        添加
                    </button>
                    <button class="btn " type="reset">
                        <i class="ace-icon fa fa-undo bigger-110"></i>
                        重置
                    </button>
                    <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function add() {
        $.ajax({
            url: "addCrmagentsinfo.do",
            data: {
                agentsId:$("#agentsId").val(),
                agentaddress:$("#agentaddress").val(),
                agentsex:$("[name='agentsex']:checked").val(),
                agentphone:$("#agentphone").val(),
                agentemail:$("#agentemail").val(),
                agentQq:$("#agentQq").val(),
                agentName:$("#agentName").val(),
                agentMessage:$("#agentMessage").val()
            },
            type: "post",
            dataType: "JSON",
            success: function (data) {
                if (data) {
                    alert("新增成功！");
                } else {
                    alert("新增失败！");
                }
            },
            error: function (errMsg) {
            }
        });
    }

</script>