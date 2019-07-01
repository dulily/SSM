<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻详情</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/css/newsDetail.css">
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
        <div class="content-box">
            <h2 class="title-info layui-icon layui-icon-note"> ${info.title}</h2>
            <p class="people">${info.category.name}</p>
            <p class="pTime">${info.author}&nbsp; 发表于
                <fmt:formatDate value="${info.createtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
            <div class="content-img">
                <img src="${info.pictureUrl}" width="520px" height="400px">
            </div>
            <p class="content-text">${info.content}</p>
        </div>
        <div class="comment-box">
            <div class="comment-box-title">
                <h4>我要评论</h4>
            </div>
            <div class="comment-box-text">
                <form action="${ctx}/comment/insertComment" method="post">
                    <input type="hidden" name="userid" value="${sessionScope.userSession.id}">
                    <input type="hidden" name="newsid" value="${info.id}">
                    <textarea class="text-pad" placeholder="扯淡、吐槽、表扬、鼓励......想说啥就说啥！" name="content" id="content" cols="80" rows="5"></textarea>
                    <div class="btnclass">
                        <div class="myBtn" id="myBtn"></div>
                    </div>
                </form>
            </div>
        </div>
        <%--评论之前判断用户是否登录--%>
        <script>
            $(function(){
                var username = "${sessionScope.userSession.username}";
                if (username == "" || username == null){
                    $("#myBtn").append('<a class="layui-btn layui-btn-radius" style="color:#fff;" href="${ctx}/jsp/register.jsp">去登录</a>');
                } else{
                    $("#myBtn").append('<button class="layui-btn layui-btn-radius">发表评论</button>');
                }
            })
        </script>

        <div class="comment-list" id="commentList">
        </div>
    </div>
<%--评论列表--%>
<script>
    $.ajax({
        url:'${ctx}/comment/selectCommentByNewsId?newsid=${info.id}',
        type:'post',
        success:function(data){
            if (data.length==0){
                $("#commentList").append('');
            }else{
                $("#commentList").append('<h4>评论列表</h4>');
            }
            for (var i=0;i<data.length;i++){
                var date = new Date(data[i].createtime);
                var year = date.getFullYear();
                var month = date.getMonth()+1;
                if (month<10){
                    month = '0'+month;
                }
                var day = date.getDate();
                if (day<10){
                    day = '0'+day;
                }
                var hour = date.getHours()<10?'0'+date.getHours():date.getHours();
                var minutes = date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes();
                var seconds = date.getSeconds()<10?'0'+date.getSeconds():date.getSeconds();
                var timeNow = year +'-'+month+'-'+day+" "+hour+":"+minutes+":"+seconds;
                $("#commentList").append(
                    '                <div class="comment-list-box">\n' +
                    '                <div class="comment-list-box-img">\n' +
                    '                    <img src='+data[i].user.picture+' alt="">\n' +
                    '                </div>\n' +
                    '                <div class="comment-list-box-text">\n' +
                    '                    <p class="user">'+data[i].user.nickname+'</p>\n' +
                    '                    <div class="comment-content">\n' +
                    '                        <p>'+data[i].content+'</p>\n' +
                    '                    </div>\n' +
                    '                    <div class="comment-time">'+timeNow+'</div>\n' +
                    '                </div>\n' +
                    '            </div>');
            }
        }
    })
</script>

<div class="content-foot">
    <span>&copy; 2019 duli.com - 信息科学与工程学院软件工程1班</span>
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
