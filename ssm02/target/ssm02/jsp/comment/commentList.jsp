<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>评论列表</title>

    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">

    <style>
        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        ul.pagination li {display: inline;}

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }
        ul.pagination li a:hover {
            background-color: #4CAF50;
            border: 1px solid #4CAF50;
            color: white;
        }
        ul.pagination li a:active {
            background-color: #4CAF50;
            color: white;
        }


    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${ctx}/jsp/common/menu3.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-row">
                <div class="layui-col-md10">
                    <h1 style="margin: 20px 0">Comments List</h1>
                    <table class="layui-table" style="text-align: center;">
                        <thead>
                        <tr>
                            <th style="vertical-align: middle !important;text-align: center;">ID</th>
                            <th style="vertical-align: middle !important;text-align: center;">新闻标题</th>
                            <th style="vertical-align: middle !important;text-align: center;">用户昵称</th>
                            <th style="vertical-align: middle !important;text-align: center;">评论内容</th>
                            <th style="vertical-align: middle !important;text-align: center;">评论时间</th>
                            <th style="vertical-align: middle !important;text-align: center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${comments}" var="obj">
                            <tr>
                                <td>${obj.id}</td>
                                <td>${obj.news.title}</td>
                                <td>${obj.user.nickname}</td>
                                <td>${obj.content}</td>
                                <td><fmt:formatDate value="${obj.createtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                <td>
                                    <a href="${ctx}/comment/deleteComment?id=${obj.id}"
                                       class="layui-btn layui-btn-danger layui-icon layui-icon-delete layui-anim layui-anim-scale"> 删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <%--分页--%>
                    <div class="layui-row" style="text-align: center;">
                        <div class="layui-col-md4">
                            <p style="height: 40px;line-height: 40px;">
                                <span style="padding-right: 15px;">每页${page.pageSize}条</span>
                                <span style="padding-right: 15px;">当前页${page.size}条</span>
                                <span style="padding-right: 15px;">${page.pageNum}/${page.pages}页</span>
                                <span>记录数${page.total}</span>
                            </p>
                        </div>
                        <div class="layui-col-md4 layui-col-md-offset4">
                            <ul class="pagination">
                                <%--<li><c:if test="${page.isFirstPage==true}"><a>首页</a></c:if></li>--%>
                                <li><c:if test="${page.isFirstPage==false}"><a href="${ctx}/comment/selectComments?startPage=${page.firstPage}">首页</a></c:if></li>
                                <li><c:if test="${page.hasPreviousPage==true}"><a href="${ctx}/comment/selectComments?startPage=${page.prePage}">上一页</a></c:if></li>
                                <%--<li><c:if test="${page.hasPreviousPage==false}"><a>上一页</a></c:if></li>--%>
                                <li><c:if test="${page.hasNextPage==true}"><a href="${ctx}/comment/selectComments?startPage=${page.nextPage}">下一页</a></c:if></li>
                                <%--<li><c:if test="${page.hasNextPage==false}"><a>下一页</a></c:if></li>--%>
                                <%--<li><c:if test="${page.isLastPage==true}"><a>末页</a></c:if></li>--%>
                                <li><c:if test="${page.isLastPage==false}"><a href="${ctx}/comment/selectComments?startPage=${page.lastPage}">末页</a></c:if></li>
                            </ul>
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
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/layui/layui.all.js"></script>
<script type="text/javascript">
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>