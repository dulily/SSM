<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>评论列表</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        .comment-list{
            width: 70%;
            height: auto;
            border-radius: 10px;
            margin-top: 40px;
            padding-left: 30px;
        }
        .comment-list-box{
            width: 100%;
            height: 130px;
            box-sizing: border-box;
            border-radius: 5px;
            box-shadow: #c7c7c7 0 0 5px;
            margin-bottom: 15px;
        }
        .comment-list-box-img{
            width: 130px;
            height: 130px;
            float:left;
            text-align: center;
            line-height:130px;
        }
        .comment-list-box-img img{
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border:1px solid #c7c7c7;
        }
        .comment-list-box-text{
            width: 656px;
            padding: 10px;
            height: 130px;
            float:left;
        }
        .user{
            height: 24px;
            line-height: 24px;
        }
        .comment-content{
            height: 50px;
        }
        .comment-time{
            width: 170px;
            float:right;
            margin-right: 20px;
            margin-top: 10px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${ctx}/jsp/common/menu1.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="comment-list">
                <h2 style="padding-bottom:20px;">评论列表</h2>
                <div class="comment-list-box">
                    <div class="comment-list-box-img">
                        <img src="/uploadImg/myLogo.png" alt="">
                    </div>
                    <div class="comment-list-box-text">
                        <p class="user">用户</p>
                        <div class="comment-content">
                            <p>评论内容</p>
                        </div>
                        <div class="comment-time">评论时间</div>
                    </div>

                </div>
                <div class="comment-list-box">
                    <div class="comment-list-box-img">
                        <img src="/uploadImg/myLogo.png" alt="">
                    </div>
                    <div class="comment-list-box-text">
                        <p class="user">用户</p>
                        <div class="comment-content">
                            <p>评论内容</p>
                        </div>
                        <div class="comment-time">评论时间</div>
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