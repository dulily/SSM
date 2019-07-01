<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    a:hover{
        text-decoration: none;
    }
</style>
<div class="layui-header">
    <div class="layui-logo" style="padding-left: 10px;">
        <a href="${ctx}/index.jsp"><img src="/uploadImg/myLogo.png" alt="" width="180px" height="60px"></a>
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
                    $("#oUl").append('<li class="layui-nav-item"><a href="${ctx}/news/queryCategoryById?categoryid='+(i+1)+'" >'+data[i].name+'</a></li>');
                }
            }
        })
    </script>
    <ul class="layui-nav layui-layout-right" id="ulHtml">
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="" class="layui-nav-img" id="imgs">
                ${userSession.nickname}
            </a>
            <dl class="layui-nav-child">
                <dd><a href="">基本资料</a></dd>
                <dd><a href="">安全设置</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
</div>

<script>

    $(function () {
        if ('${userSession.username}'==null||'${userSession.username}'==""){
            $("#ulHtml").html('<li class="layui-nav-item"><a href="${ctx}/jsp/register.jsp">登录</a>');
        }else {
            $("#ulHtml").html('<li class="layui-nav-item">\n' +
                '            <a href="javascript:;">\n' +
                '                <img src="" class="layui-nav-img" id="imgs">\n' +
                '                <span  id="wenzi">${userSession.nickname}</span>\n' +
                '            </a>\n' +
                '            <dl class="layui-nav-child">\n' +
                '                <dd><a href="${ctx}/user/selectByUsername?username=${userSession.username}">个人中心</a></dd>\n' +
                '               <dd><a href="${ctx}/jsp/front/rePassword.jsp">安全设置</a></dd>' +
                '            </dl>\n' +
                '        </li>\n' +
                '        <li class="layui-nav-item"><a href="${ctx}/user/logOut">退了</a></li>');
            if('${userSession.nickname}'==null||'${userSession.nickname}'==""){
                $("#wenzi").text("U娃");
            }else{
                $("#wenzi").text("${userSession.nickname}");
            }
            if('${userSession.picture}'==null||'${userSession.picture}'==""){
                $("#imgs").attr("src","/uploadImg/po.jpg");
            }else{
                $("#imgs").attr("src","${userSession.picture}");
            }
        }
    })
</script>