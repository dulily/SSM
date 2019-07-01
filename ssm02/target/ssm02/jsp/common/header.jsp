<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    a:hover{
        text-decoration: none;
    }
</style>
<div class="layui-header">
    <div class="layui-logo" style="padding-left: 50px;">
        <a href="${ctx}/jsp/index.jsp"><img src="/uploadImg/houLogo.png" width="280px" height="60px"></a>
    </div>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <ul class="layui-nav layui-layout-right" id="runHeader">

    </ul>
</div>
<script>
    $(function () {
        if ('${sessionScope.runSession.username}'==null||'${sessionScope.runSession.username}'==""){
            $("#runHeader").html('<li class="layui-nav-item"><a href="${ctx}/jsp/register.jsp">登录</a>');
        }else {
            $("#runHeader").html('<li class="layui-nav-item">\n' +
                '            <a href="javascript:;">\n' +
                '                <img src="" class="layui-nav-img" id="imgs">\n' +
                '                <span id="nick">${sessionScope.runSession.nickname}</span>\n' +
                '            </a>\n' +
                '        </li>\n' +
                '        <li class="layui-nav-item"><a href="${ctx}/run/logOut">退了</a></li>');
            if('${sessionScope.runSession.nickname}'==null||'${sessionScope.runSession.nickname}'==""){
                $("#nick").text("UU管理员");
            }else{
                $("#nick").text("${sessionScope.runSession.nickname}");
            }
            if('${sessionScope.runSession.picture}'==null||'${sessionScope.runSession.picture}'==""){
                $("#imgs").attr("src","/uploadImg/po.jpg");
            }else{
                $("#imgs").attr("src","${sessionScope.runSession.picture}");
            }
        }
    })
</script>
