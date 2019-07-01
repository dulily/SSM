<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>更新类别</title>

    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${ctx}/jsp/common/menu1.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <h2 style="margin: 20px 0">更改类别名</h2>
            <form method="post" action="${ctx}/category/updateOne">
                类别名:
                <div class="layui-inline">
                    <input type="hidden" value="${cat.id}" name="id">
                    <input id="name" type="text" name="name" required lay-verify="required"
                           autocomplete="off" class="layui-input" value="${cat.name}">
                </div>
                <button id="b1" class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                <br>
                ${updateInfo}
            </form>
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