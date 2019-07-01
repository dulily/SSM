<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>类别详情</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/categoryDetail.css">
    <link rel="stylesheet" href="${ctx}/static/css/index.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="${ctx}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%--    头部--%>
    <jsp:include page="${ctx}/jsp/common/header2.jsp"></jsp:include>
</div>
<!-- 内容主体区域 -->
<div class="container">
<h3>类别列表</h3>
    <div class="content-container">
        <c:forEach items="${info}" var="obj">
            <div class="content-box-one">
                <div class="content-box-img">
                    <a href="${ctx}/news/NewsInfo?id=${obj.id}"><img src="${obj.pictureUrl}" ></a>
                    <a index="${obj.categoryid}" href="javascript:;" style="display: none;" class="categoryId">${obj.categoryid}</a>
                </div>
                <div class="content-box-text">
                    <h4 class="title-info"><a href="${ctx}/news/NewsInfo?id=${obj.id}">${obj.title}</a></h4>
                    <p class="contentInfo">${obj.content}</p>
                    <p><fmt:formatDate value="${obj.createtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                    </p>
                    <p>${obj.category.name} ${obj.author}</p>
                </div>
            </div>
        </c:forEach>

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
                    <li><c:if test="${page.isFirstPage==false}"><a href="" class="mainPage">首页</a></c:if></li>
                    <li><c:if test="${page.hasPreviousPage==true}"><a class="previousPage" href="">上一页</a></c:if></li>
                    <%--<li><c:if test="${page.hasPreviousPage==false}"><a>上一页</a></c:if></li>--%>
                    <li><c:if test="${page.hasNextPage==true}"><a class="nextPage" href="">下一页</a></c:if></li>
                    <%--<li><c:if test="${page.hasNextPage==false}"><a>下一页</a></c:if></li>--%>
                    <%--<li><c:if test="${page.isLastPage==true}"><a>末页</a></c:if></li>--%>
                    <li><c:if test="${page.isLastPage==false}"><a href="" class="lastPage">末页</a></c:if></li>
                </ul>
            </div>
        </div>
        <%--拼接分页链接--%>
        <script>
            $(function () {
                //首页
                $(".mainPage").attr("href","${ctx}/news/queryCategoryById?categoryid=" + $(".categoryId").attr("index") + "&&startPage=${page.firstPage}");
                //上一页
                $(".previousPage").attr("href","${ctx}/news/queryCategoryById?categoryid=" + $(".categoryId").attr("index") + "&&startPage=${page.prePage}");
                //下一页
                $(".nextPage").attr("href","${ctx}/news/queryCategoryById?categoryid=" + $(".categoryId").attr("index") + "&&startPage=${page.nextPage}");
                //尾页
                $(".lastPage").attr("href","${ctx}/news/queryCategoryById?categoryid=" + $(".categoryId").attr("index") + "&&startPage=${page.lastPage}");
            })
        </script>
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
