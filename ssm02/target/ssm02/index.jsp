<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>UU新闻</title>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
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
        <div class="content-left">
            <h3 class="lastest">最新发布 <span class="dec"> Lastest News</span></h3>
            <ul id="lastUpdate">
            </ul>
            <script>
                $.ajax({
                    url:'${ctx}/news/queryLimit',
                    type:'post',
                    success:function(data){
                        for (var i=0;i<data.length;i++){
                            $("#lastUpdate").append('<li class="eachLi"><a href="${ctx}/news/NewsInfo?id='+data[i].id+'" >♦ '+data[i].title+'</a></li>');
                        }
                    }
                })
            </script>
        </div>
        <div class="content-right">
            <div class="layui-carousel" id="test1">
                <%--轮播图--%>
                <div carousel-item id="contentImg">
                </div>
                <script>
                    $.ajax({
                        url:'${ctx}/news/queryMilitary',
                        type:'post',
                        success:function(data){
                            for (var i=0;i<data.length;i++){
                                $("#contentImg").append('<div><a href="${ctx}/news/NewsInfo?id='+data[i].id+'"><img src="'+data[i].pictureUrl+'" width="741px" height="280px"></a></div>');
                            }
                        }
                    })
                </script>

            </div>
        </div>
    </div>
    <div class="container">
        <div class="content-left-two" id="contentText">
            <h3 class="lastest">国内新闻 <span class="dec"> List News</span></h3>
        </div>
        <script>
            $.ajax({
                url:'${ctx}/news/queryOwnNews',
                type:'post',
                success:function(data){
                    for (var i=0;i<data.length;i++){
                        $("#contentText").append('<div class="content-box1-img">' +
                            '<img src="'+data[i].pictureUrl+'" alt="" width="94%" height="130px"></div>' +
                            '<div class="content-box1-text"><h4><a href="${ctx}/news/NewsInfo?id='+data[i].id+'">'+data[i].title+'</a></h4>' +
                            '<p class="content-box1-text-info">'+data[i].content+'</p>' +
                            '<p><span>'+data[i].createtime+'</span></p>');
                    }
                }
            })
        </script>

        <div class="content-right-two">
            <div class="content-right-two-box1">
                <h4 class="click-rank">娱乐新闻</h4>
                <div class="content-right-two-text">
                    <ul id="rank">
                    </ul>
                    <script>
                        $.ajax({
                            url:'${ctx}/news/queryYule',
                            type:'post',
                            success:function(data){
                                for (var i=0;i<data.length;i++){
                                    $("#rank").append('<li><a href="${ctx}/news/NewsInfo?id='+data[i].id+'' +
                                        '" ><span style="font-size:20px;">'+(i+1)+'</span> '+data[i].title+'</a></li>');
                                }
                            }
                        })
                    </script>
                </div>
            </div>
            <div class="content-right-two-box1">
                <h4 class="click-rank">国际新闻</h4>
                <div class="content-right-two-news">
                    <ul id="internation">
                    </ul>
                    <script>
                        $.ajax({
                            url:'${ctx}/news//queryCategoryName',
                            type:'post',
                            success:function(data){
                                for (var i=0;i<data.length;i++){
                                    $("#internation").append('<li><a href="${ctx}/news/NewsInfo?id='+data[i].id+'" >■ '+data[i].title+'</a></li>');
                                }
                            }
                        })
                    </script>
                </div>
            </div>
        </div>
    </div>
<div class="content-foot">
    <span>&copy; 2019 duli.com - 信息科学与工程学院软件工程1班</span>
</div>
<script src="${ctx}/static/plugins/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>
</body>
</html>
