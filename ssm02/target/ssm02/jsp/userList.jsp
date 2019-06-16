<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>用户列表</title>

    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${ctx}/jsp/common/menu4.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <h2 style="margin: 20px 0">User List</h2>
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md4">
                    <form action="${ctx}/user/queryLike/username" method="post">
                        搜索用户名：
                        <div class="layui-inline">
                            <input class="layui-input" name="username" id="demoReload" autocomplete="off"
                                   value="${username}">
                        </div>
                        <button class="layui-btn layui-icon layui-icon-search layui-anim layui-anim-scale"
                                lay-submit lay-filter="formDemo"> 查询</button>
                    </form>
                </div>
            </div>
            <table class="layui-table" style="text-align: center;">
                <thead>
                <tr>
                    <th style="vertical-align: middle !important;text-align: center;">ID</th>
                    <th style="vertical-align: middle !important;text-align: center;">姓名</th>
                    <th style="vertical-align: middle !important;text-align: center;">密码</th>
                    <th style="vertical-align: middle !important;text-align: center;">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="obj">
                    <tr>
                        <td>${obj.id}</td>
                        <td>${obj.username}</td>
                        <td>${obj.password}</td>
                        <td>
                            <a href=""
                               class="layui-btn layui-icon layui-icon-edit layui-anim layui-anim-scale"> 更改</a>
                            <a href="${ctx}/user/deleteById/${user.id}"
                               class="layui-btn layui-btn-danger layui-icon layui-icon-delete layui-anim layui-anim-scale"> 删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        &copy;duli.com - 信工学院软工1班
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