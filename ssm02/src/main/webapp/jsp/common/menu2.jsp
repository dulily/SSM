<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    a:hover{
        text-decoration: none;
    }
</style>
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item">
                <a href="javascript:;" class="layui-icon layui-icon-list"> 类别管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/jsp/category/addCategory.jsp">新闻类别添加</a></dd>
                    <dd><a href="${ctx}/category/queryAll">新闻类别列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;" class="layui-icon layui-icon-read"> 新闻管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/news/category">发布新闻</a></dd>
                    <dd><a href="${ctx}/news/queryAll">新闻列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;" class="layui-icon layui-icon-dialogue"> 评论管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/comment/selectComments">评论列表</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;" class="layui-icon layui-icon-user"> 用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/user/queryAll">用户列表</a></dd>
                    <dd><a href="${ctx}/run/selectRunInfo?username=${sessionScope.runSession.username}">查看个人信息</a></dd>
                    <dd><a href="${ctx}/jsp/run/rePassword.jsp">安全设置</a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
