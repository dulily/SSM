<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>新闻列表</title>
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">

    <style>
        ul.pagination {
            display: inline-block;
            padding: 0;
            margin: 0;
        }

        ul.pagination li {display: inline;}

        ul.pagination li a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #ddd;
        }
        ul.pagination li a:hover {
            background-color: #4CAF50;
            border: 1px solid #4CAF50;
            color: white;
        }
        ul.pagination li a:active {
            background-color: #4CAF50;
            color: white;
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
            <h1 style="margin: 20px 0">News List</h1>
            <hr class="layui-bg-green">
            <br>
            <div class="layui-row">
                <input style="margin-left: 420px;" id="btu1" type="button" value="全选"
                       class="layui-btn layui-btn-normal layui-anim layui-anim-scale" />
                <input id="btu2" type="button" value="反选"
                       class="layui-btn layui-btn-normal layui-anim layui-anim-scale" />

                <script>
                    //全选反选部分
                    window.onload=function ()
                    {
                        var btu1=document.getElementById('btu1');
                        var btu2=document.getElementById('btu2');
                        var all=document.getElementsByName('chooseId');
                        btu1.onclick=function ()
                        {
                            for(var i=0;i<all.length;i++)
                            {
                                all[i].checked=true;
                            }
                        };
                        btu2.onclick=function ()
                        {
                            for(var i=0;i<all.length;i++)
                            {
                                if(all[i].checked==true)
                                {
                                    all[i].checked=false;
                                }
                                else{
                                    all[i].checked=true;
                                }

                            }
                        };
                    };
                </script>

                <a href="${ctx}/news/category" style="margin-left: 10px;"
                   class="layui-btn layui-icon layui-icon-add-1 layui-anim layui-anim-scale"> 增加</a>
                <button class="layui-btn layui-btn-danger
                    layui-icon layui-icon-close layui-anim layui-anim-scale" id="batchDel"> 删除</button>
                <div class="layui-col-xs6 layui-col-sm6 layui-col-md4">
                    <form action="${ctx}/news/queryLikeByTitle/title" method="post">
                        新闻标题：
                        <div class="layui-inline">
                            <input class="layui-input" name="title" id="demoReload" autocomplete="off" value="${title}">
                        </div>
                        <button class="layui-btn layui-icon layui-icon-search layui-anim layui-anim-scale"
                                lay-submit lay-filter="formDemo"> 查询</button>
                    </form>
                </div>
            </div>
            <table class="layui-table" style="text-align: center;">
                <thead>
                <tr>
                    <th style="vertical-align: middle !important;text-align: center;">
                        <input type="checkbox" name="">
                    </th>
                    <th style="vertical-align: middle !important;text-align: center;">ID</th>
                    <th style="vertical-align: middle !important;text-align: center;">类别</th>
                    <th style="vertical-align: middle !important;text-align: center;">标题</th>
                    <th style="vertical-align: middle !important;text-align: center;">作者</th>
                    <th style="vertical-align: middle !important;text-align: center;">发布人</th>
                    <th style="vertical-align: middle !important;text-align: center;">发布时间</th>
                    <th style="vertical-align: middle !important;text-align: center;">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${news}" var="obj" varStatus="st">
                    <tr class="oTr">
                        <td>
                            <input type="checkbox" name="chooseId" value="${obj.id}">
                        </td>
                        <td>${obj.id}</td>
                        <td>${obj.category.name}</td>
                        <td>${obj.title}</td>
                        <td>${obj.author}</td>
                        <td>${obj.username}</td>
                        <td><fmt:formatDate value="${obj.createtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                        <td>
                            <button index="${st.index}" id="tr${st.index}" class="layui-btn layui-btn-primary layui-icon layui-icon-down layui-anim layui-anim-scale"> 详情</button>
                            <a href="${ctx}/news/selectById?id=${obj.id}"
                               class="layui-btn layui-icon layui-icon-edit layui-anim layui-anim-scale"> 更改</a>
                            <a href="${ctx}/news/deleteOne?id=${obj.id}"
                               class="layui-btn layui-btn-danger layui-icon layui-icon-delete layui-anim layui-anim-scale"> 删除</a>
                        </td>
                    </tr>
                    <tr style="display:none;text-align: left;" id="div${st.index}" class="divTr" index="${st.index}">
                        <td colspan="8">
                            <div class="oDiv">
                                <div class="div1" style="float: left;width:200px;text-align: center;line-height: 100px;">
                                    <img src="${obj.pictureUrl}" alt="" width="100px" height="60px;">
                                </div>
                                <div class="div2" style="float: left;">
                                    <p><span style="color:#1E90FF;">标题：</span>${obj.title}</p>
                                    <p><span style="color:#1E90FF;">作者：</span>${obj.author}</p>
                                    <p><span style="color:#1E90FF;">类别：</span>${obj.category.name}</p>
                                    <p><span style="color:#1E90FF;">内容：</span>${obj.content}</p>
                                    <p><span style="color:#1E90FF;">发布时间：</span><fmt:formatDate value="${obj.createtime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></p>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%--详情--%>
            <script>
                $(document).ready(function(){
                    for(var i=0;i<=$(".oTr").length;i++) {
                        var button = "#tr" + i;
                        $(button).click(function () {
                            for (var j = 0; j <= $(".divTr").length; j++) {
                                if (j != $(this).attr("index")) {
                                    var test = "#div" + j;
                                    $(test).css({
                                        "display": "none"
                                    });
                                }
                            }
                            var div = "#div" + $(this).attr("index");
                            $(div).fadeToggle();
                        })
                    }
                })
            </script>


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
                        <li><c:if test="${page.isFirstPage==false}"><a href="${ctx}/news/queryAll?startPage=${page.firstPage}">首页</a></c:if></li>
                        <li><c:if test="${page.hasPreviousPage==true}"><a href="${ctx}/news/queryAll?startPage=${page.prePage}">上一页</a></c:if></li>
                        <li><c:if test="${page.hasPreviousPage==false}"><a>上一页</a></c:if></li>
                        <li><c:if test="${page.hasNextPage==true}"><a href="${ctx}/news/queryAll?startPage=${page.nextPage}">下一页</a></c:if></li>
                        <li><c:if test="${page.hasNextPage==false}"><a>下一页</a></c:if></li>
                        <li><c:if test="${page.isLastPage==true}"><a>末页</a></c:if></li>
                        <li><c:if test="${page.isLastPage==false}"><a href="${ctx}/news/queryAll?startPage=${page.lastPage}">末页</a></c:if></li>
                    </ul>
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
    // 批量删除
    $(document).ready(function(){
        var array=[];
        var str="";
        $("#batchDel").click(function(){
            //获取选中的id
            $('input[name=chooseId]:checked').each(function(){
                array.push($(this).val());
            });
            //用","拼接字符串
            for (var i=0;i<array.length;i++){
                if (i<array.length-1){
                    str += array[i] +",";
                }else{
                    str +=array[i];
                }
            }
            $.ajax({
                url:'${ctx}/news/batchDelete',
                type:'post',
                data:{name:str},
                success:function (data) {
                    alert(data);
                    //重新加载页面
                    window.location.reload();
                }
            })

        });
    });
</script>
</body>
</html>