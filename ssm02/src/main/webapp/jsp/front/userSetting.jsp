<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人中心</title>
    <link rel="stylesheet" href="${ctx}/static/css/userSetting.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="${ctx}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script src="${ctx}/static/plugins/layer-v3.1.1/layer/layer.js"></script>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%--    头部--%>
    <jsp:include page="${ctx}/jsp/common/header2.jsp"></jsp:include>
</div>
<div class="contain">
    <!-- 顶部区域 -->
    <!-- header -->
    <!-- 内容区域 -->
    <div class="content">
        <!-- 左侧内容部分 -->
        <div class="content-left">
            <div class="content-left-top">
                <div class="content-left-top-img">
                    <img src="${userSession.picture}" alt="" width="100px" height="100px" id="ownPic">
                </div>

                <script>
                    $(function (){
                        if('${userSession.picture}'==null||'${userSession.picture}'==""){
                            $("#ownPic").attr("src","/uploadImg/po.jpg");
                        }else{
                            $("#ownPic").attr("src","${userSession.picture}");
                        }
                    })
                </script>
                <p style="font-size:18px;" id="own">${user.nickname}</p>
                <script>
                    $(function (){
                        if('${userSession.nickname}'==null||'${userSession.nickname}'==""){
                            $("#own").text("U娃");
                        }else{
                            $("#own").text("${userSession.nickname}");
                        }
                    })
                </script>
                <br>
                <div class="content-left-top-account">
                    <p style="font-size:18px;">个人中心</p>
                </div>
            </div>
            <div class="content-left-bottom">
                <ul class="menu" id="choose">
                    <li class="active">
                        <a href="javascript:;">个人信息<span class="icon-right">></span></a>
                    </li>
                    <li>
                        <a href="javascript:;">评论管理<span class="icon-right">></span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 右侧内容部分 -->
        <div class="content-right">
            <!-- 个人信息区域 -->
            <div class="content-right-item" style="display:block;">
                <div class="alert alert-warning alert-dismissable">
                    <button type="button" class="close" aria-hidden="true" data-dismiss="alert">&times;</button>
                    上次登录时间：<fmt:formatDate value="${sessionScope.userSession1.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                </div>
                <h4>个人信息</h4>
                <!-- 表单内容 -->
                <div class="content-item">
                    <form class="form-horizontal" role="form" method="post" action="${ctx}/user/updateUser" enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="userInfo-box1">
                                <span>昵称</span>
                            </div>
                            <div class="col-sm-6">
                                <input type="hidden" name="id" value="${user.id}">
                                <input type="hidden" name="username" value="${user.username}">
                                <input type="text" class="form-control" id="nickname" name="nickname" value="${user.nickname}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="userInfo-box1">
                                <span>性别</span>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="gender" name="gender" value="${user.gender}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="userInfo-box1">
                                <span>电话号码</span>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="userInfo-box1">
                                <span>邮箱</span>
                            </div>
                            <div class="col-sm-6">
                                <input type="email" class="form-control" id="email" name="email" value="${user.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="userInfo-box1">
                                <span>个人头像</span>
                            </div>
                            <div class="col-sm-6">
                                <div class="inputFileWrapper">
                                    <label for="inputFile">
                                        <input type="file" id="inputFile" name="img" accept="image/*"/>
                                        <span class="custorm-style">
                                            <span class="left-button">上传图片</span>
                                            <span class="right-text" id="rightText">${user.picture}</span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <script>
                            $("#inputFile").change(function() {
                                if ($("#inputFile").val()==""){
                                    $("#rightText").html("未选择任何文件");
                                }else{
                                    $("#rightText").html($("#inputFile").val());
                                }
                            });
                        </script>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-6">
                                <button id="b1" class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <%--评论管理--%>
            <div class="content-right-item">
                <div class="comment-list" id="commentLists">
                    <h4>评论列表</h4>
                </div>
            </div>
            <%--评论列表--%>
            <script>
                $.ajax({
                    url:'${ctx}/comment/selectCommentByUserId?userid=${user.id}',
                    type:'post',
                    success:function(data){
                        if (data.length==0) {
                            $("#commentLists").append('<h3>您暂时没有评论!</h3>')
                        }else{
                            for (var i=0;i<data.length;i++){
                                // 转换时间
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
                                $("#commentLists").append('<div class="comment-list-box">\n' +
                                    '                        <div class="comment-list-box-img">\n' +
                                    '                            <img src="'+data[i].news.pictureUrl+'" alt="">\n' +
                                    '                        </div>\n' +
                                    '                        <div class="comment-list-box-text">\n' +
                                    '                            <p class="newTitle"><a href="${ctx}/news/NewsInfo?id='+data[i].news.id+'">'+data[i].news.title+'</a></p>\n' +
                                    '                            <div class="comment-content">\n' +
                                    '                                <p>'+data[i].content+'</p>\n' +
                                    '                            </div>\n' +
                                    '                            <div><a href="${ctx}/comment/deleteByCommentId?id='+data[i].id+'&&username='+data[i].user.username+'">删除</a><span class="comment-time">'+timeNow+'</span></div>\n' +
                                    '                        </div>\n' +
                                    '                    </div>');
                            }
                        }
                    }
                })
            </script>
        </div>
    </div>

    <!-- footer -->
    <div class="content-foot">
        <span>&copy; 2019 duli.com - 信息科学与工程学院软件工程1班</span>
    </div>
</div>

<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
<%--选项卡切换--%>
<script>
    window.onload = function(){
        var oDiv=document.getElementById("choose");
        var aLi=oDiv.getElementsByTagName("li");
        var aClass=document.getElementsByClassName("content-right-item");
        for(var i=0;i<aLi.length;i++){
            aLi[i].index=i;
            aLi[i].onclick=function (){
                for(var j=0;j<aLi.length;j++){
                    aLi[j].className = '';
                    aLi[j].getElementsByTagName("a")[0].style.color="#000";
                    aLi[j].getElementsByTagName("a")[0].style.background="#F5F5F5";
                }
                this.className = 'active';
                this.getElementsByTagName("a")[0].style.color="#fff";
                this.getElementsByTagName("a")[0].style.background="#23262E";
                for(var j=0;j<aLi.length;j++){
                    aClass[j].style.display = '';
                }
                aClass[this.index].style.display = 'block';
            }
        }
    }
</script>
</body>
</html>