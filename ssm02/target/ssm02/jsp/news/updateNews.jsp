<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>更改新闻</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
    <style>
        .inputFileWrapper label{
            display: block;
            float: left;
            position: relative;
        }
        .inputFileWrapper input[type="file"]{
            position: absolute;
            width: 1px;
            height: 1px;
            clip:rect(0,0,0,0);
        }
        .inputFileWrapper .custorm-style{
            display: block;
            width: 380px;
            height: 50px;
        }
        .inputFileWrapper .custorm-style .left-button{
            width: 80px;
            line-height: 40px;
            background: #009688;
            color: #fff;
            display: block;
            text-align: center;
            float: left;
        }
        .inputFileWrapper .custorm-style .right-text{
            width: 300px;
            height: 40px;
            line-height: 40px;
            display: block;
            float: right;
            padding-left: 10px;
            border: 1px solid #009688;
            overflow: hidden;
            -ms-text-overflow: ellipsis;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${ctx}/jsp/common/menu2.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <h2 style="margin: 20px 0">更改新闻</h2>
            <p style="margin: 20px 0;">
                <a href="${ctx}/news/queryAll" class="layui-btn layui-btn-warm layui-anim layui-anim-scale">☇ 新闻列表</a>
            </p>
            <div class="layui-row">
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md6">
                    <form class="form-horizontal" role="form" method="post" action="${ctx}/news/updateOne" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻标题</label>
                            <div class="col-sm-10">
                                <input type="hidden" value="${info.id}" name="id">
                                <input type="text" class="form-control" placeholder="请输入新闻标题" name="title" value="${info.title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻类别</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="categoryid" id="choose">

                                    //加载新闻类别，数据回显
                                    <script>
                                        $.ajax({
                                            url:'${ctx}/news/updateCategory',
                                            type:'post',
                                            success:function(data){
                                                for(var i=0;i<data.length;i++){
                                                    if (data[i].id==${info.category.id}){
                                                        $("#choose").append
                                                        ('<option selected="selected" value="' + data[i].id + '">'+data[i].name+'</option>');
                                                    }else {
                                                        $("#choose").append
                                                        ('<option value="' + data[i].id + '">'+data[i].name+'</option>');
                                                    }
                                                }
                                            }
                                        })
                                    </script>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">新闻内容</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" placeholder="请输入新闻内容" name="content">${info.content}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">封面图片</label>
                            <div class="col-sm-10">
                                <div class="inputFileWrapper">
                                    <label for="inputFile">
                                        <input type="file" id="inputFile" name="img" accept="image/*"/>
                                        <span class="custorm-style">
                                            <span class="left-button">上传图片</span>
                                            <span class="right-text" id="rightText">${info.pictureUrl}</span>
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
                            <label class="col-sm-2 control-label">新闻作者</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="请输入新闻作者" name="author" value="${info.author}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">发布人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" placeholder="请输入发布人" name="username" value="${info.username}" />
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit lay-filter="formDemo" id="upfor">立即提交</button>
                                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                        <%--//测试类别--%>
                        <%--<script>--%>
                        <%--$(document).ready(function(){--%>
                            <%--$("#upfor").click(function (){--%>
                                <%--var type = $('option[selected=selected]').val();--%>
                                <%--alert(type);--%>
                            <%--})--%>
                        <%--})--%>
                        <%--</script>--%>
                    </form>

                </div>
            </div>
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