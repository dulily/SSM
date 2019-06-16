<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    a:hover{
        text-decoration: none;
    }
</style>
<div class="layui-header">
    <div class="layui-logo" style="padding-left: 10px;">
        <img src="/uploadImg/myLogo.png" alt="" width="180px" height="60px">
    </div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left" id="oUl">
    </ul>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script>
        $.ajax({
            url:'${ctx}/category/queryName',
            type:'post',
            success:function(data){
                for (var i=0;i<data.length;i++){
                    $("#oUl").append('<li class="layui-nav-item"><a href="" >'+data[i].name+'</a></li>');
                }
            }
        })
    </script>
    <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                贤心
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="${ctx}/jsp/login.jsp">退了</a></li>
    </ul>
</div>
