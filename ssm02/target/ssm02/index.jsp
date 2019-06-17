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
                            $("#lastUpdate").append('<li class="eachLi"><a href="" >♦ '+data[i].title+'</a></li>');
                        }
                    }
                })
            </script>
        </div>
        <div class="content-right">
            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div><a href=""><img src="/uploadImg/new1.png" alt="" width="684px" height="280px"></a></div>
                    <div><a href=""><img src="/uploadImg/new2.png" alt="" width="684px" height="280px"></a></div>
                    <div><a href=""><img src="/uploadImg/new3.png" alt="" width="684px" height="280px"></a></div>
                    <div><a href=""><img src="/uploadImg/new4.png" alt="" width="684px" height="280px"></a></div>
                    <div><a href=""><img src="/uploadImg/new5.png" alt="" width="684px" height="280px"></a></div>
                </div>

            </div>
        </div>
    </div>
    <div class="container">
        <div class="content-left-two">
            <h3 class="lastest">新闻列表 <span class="dec"> List News</span></h3>
            <div class="content-box1">
                <div class="content-box1-img">
                    <img src="/uploadImg/14.jpg" alt="" width="94%" height="130px">
                </div>
                <div class="content-box1-text">
                    <h3>标题标题标题标题标题标题</h3>
                    <p class="content-box1-text-info">内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>
                    <p><span>2019-07-16</span><span class="click-count"><a href="">点击次数</a></span> <span class="click-count"><a
                            href="" class="glyphicon glyphicon-thumbs-up"></a></span></p>
                </div>
            </div>
            <%--<script>--%>
                <%--$.ajax({--%>
                    <%--url:'${ctx}/news/queryNewsAll',--%>
                    <%--type:'post',--%>
                    <%--success:function(data){--%>

                    <%--}--%>
                <%--})--%>
            <%--</script>--%>


            <div class="content-box1">
                <div class="content-box1-img">
                    <img src="/uploadImg/14.jpg" alt="" width="94%" height="130px">
                </div>
                <div class="content-box1-text">
                    <h3>标题标题标题标题标题标题</h3>
                    <p class="content-box1-text-p">内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>
                    <p><span>2019-07-16</span><span class="click-count"><a href="">点击次数</a></span> <span class="click-count"><a
                            href="" class="glyphicon glyphicon-thumbs-up"></a></span></p>
                </div>
            </div>
            <div class="content-box1">
                <div class="content-box1-img">
                    <img src="/uploadImg/14.jpg" alt="" width="94%" height="130px">
                </div>
                <div class="content-box1-text">
                    <h3>标题标题标题标题标题标题</h3>
                    <p class="content-box1-text-p">内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>
                    <p><span>2019-07-16</span><span class="click-count"><a href="">点击次数</a></span> <span class="click-count"><a
                            href="" class="glyphicon glyphicon-thumbs-up"></a></span></p>
                </div>
            </div>
            <div class="content-box1">
                <div class="content-box1-img">
                    <img src="/uploadImg/14.jpg" alt="" width="94%" height="130px">
                </div>
                <div class="content-box1-text">
                    <h3>标题标题标题标题标题标题</h3>
                    <p class="content-box1-text-p">内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容</p>
                    <p><span>2019-07-16</span><span class="click-count"><a href="">点击次数</a></span> <span class="click-count"><a
                            href="" class="glyphicon glyphicon-thumbs-up"></a></span></p>
                </div>
            </div>
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
                        <li><c:if test="${page.isFirstPage==true}"><a>首页</a></c:if></li>
                        <li><c:if test="${page.isFirstPage==false}"><a href="">首页</a></c:if></li>
                        <li><c:if test="${page.hasPreviousPage==true}"><a href="">上一页</a></c:if></li>
                        <li><c:if test="${page.hasPreviousPage==false}"><a>上一页</a></c:if></li>
                        <li><c:if test="${page.hasNextPage==true}"><a href="">下一页</a></c:if></li>
                        <li><c:if test="${page.hasNextPage==false}"><a>下一页</a></c:if></li>
                        <li><c:if test="${page.isLastPage==true}"><a>末页</a></c:if></li>
                        <li><c:if test="${page.isLastPage==false}"><a href="">末页</a></c:if></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="content-right-two">
            <div class="content-right-two-box1">
                <h4 class="click-rank">点击排行</h4>
                <div class="content-right-two-text">
                    <ul>
                        <li><a href="">点击排行</a></li>
                        <li><a href="">点击排行</a></li>
                        <li><a href="">点击排行</a></li>
                        <li><a href="">点击排行</a></li>
                        <li><a href="">点击排行</a></li>
                        <li><a href="">点击排行</a></li>
                        <li><a href="">点击排行</a></li>
                    </ul>
                </div>
            </div>
            <div class="content-right-two-box1">
                <h4 class="click-rank">国际新闻</h4>
                <div class="content-right-two-news">
                    <ul id="internation">
                        <script>
                            $.ajax({
                                url:'${ctx}/news//queryCategoryName',
                                type:'post',
                                success:function(data){
                                    for (var i=0;i<data.length;i++){
                                        $("#internation").append('<li><a href="" >♦ '+data[i].title+'</a></li>');
                                    }
                                }
                            })
                        </script>
                    </ul>
                </div>
            </div>
        </div>
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
