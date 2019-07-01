<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>查看个人信息</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="${ctx}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/userSetting.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${ctx}/jsp/common/menu4.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <h3 style="margin: 20px 0">个人信息</h3>
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md4">
                    <div class="content-right-item" style="display:block;">
                        <!-- 表单内容 -->
                        <div class="content-item">
                            <form class="form-horizontal" role="form" method="post" action="${ctx}/run/updateRunInfo" enctype="multipart/form-data">
                                <div class="form-group">
                                    <div class="userInfo-box1">
                                        <span>昵称</span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="hidden" name="id" value="${sessionScope.runSession.id}">
                                        <input type="hidden" name="username" value="${sessionScope.runSession.username}">
                                        <input type="text" class="form-control" id="nickname" name="nickname" value="${sessionScope.runSession.nickname}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="userInfo-box1">
                                        <span>电话号码</span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.runSession.phone}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="userInfo-box1">
                                        <span>邮箱</span>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.runSession.email}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="userInfo-box1">
                                        <span>个人头像</span>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="inputFileWrapper">
                                            <label for="inputFile">
                                                <input type="file" id="inputFile" name="img" accept="image/*"/>
                                                <span class="custorm-style">
                                            <span class="left-button">上传图片</span>
                                            <span class="right-text" id="rightText">${sessionScope.runSession.picture}</span>
                                        </span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    $("#inputFile").change(function() {
                                        if ($("#inputFile").val()==""){
                                            $("#rightText").html("未选择任何文件");
                                        }else{
                                            $("#rightText").html($("#inputFile").val());
                                        }
                                    });
                                </script>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-6">
                                        <button id="b1" class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        &copy; 2019 duli.com - 信工学院软工1班
    </div>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>