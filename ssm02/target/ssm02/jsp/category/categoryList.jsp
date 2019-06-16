<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>添加类别</title>

    <link rel="stylesheet" href="${ctx}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <jsp:include page="${ctx}/jsp/common/header.jsp"></jsp:include>
    <!--菜单栏-->
    <jsp:include page="${ctx}/jsp/common/menu1.jsp"></jsp:include>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-row">
                <div class="layui-col-md8">
                    <h1 style="margin: 20px 0">News Category</h1>
                    <input id="btu1" type="button" value="全选" class="layui-btn layui-btn-normal layui-anim layui-anim-scale" />
                    <input id="btu2" type="button" value="反选" class="layui-btn layui-btn-normal layui-anim layui-anim-scale" />
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

                    <a href="${ctx}/jsp/category/addCategory.jsp" class="layui-btn layui-icon layui-icon-add-1 layui-anim layui-anim-scale"
                       style="margin-left: 378px;"> 增加</a>
                    <button id="batchDel" class="layui-btn layui-btn-danger
                    layui-icon layui-icon-close layui-anim layui-anim-scale"> 删除</button>
                    <table class="layui-table" style="text-align: center;">
                        <thead>
                        <tr>
                            <th style="vertical-align: middle !important;text-align: center;">
                                <input type="checkbox" name="">
                            </th>
                            <th style="vertical-align: middle !important;text-align: center;">ID</th>
                            <th style="vertical-align: middle !important;text-align: center;">类别</th>
                            <th style="vertical-align: middle !important;text-align: center;">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${all}" var="obj">
                            <tr>
                                <td>
                                    <input type="checkbox" name="chooseId" value="${obj.id}">
                                </td>
                                <td>${obj.id}</td>
                                <td>${obj.name}</td>
                                <td>
                                    <a href="${ctx}/category/selectOne?id=${obj.id}"
                                       class="layui-btn layui-icon layui-icon-edit layui-anim layui-anim-scale"> 更改</a>
                                    <a href="${ctx}/category/deleteOne?id=${obj.id}"
                                       class="layui-btn layui-btn-danger layui-icon layui-icon-delete layui-anim layui-anim-scale"> 删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugins/layui/layui.all.js"></script>
<script type="text/javascript">
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
                url:'${ctx}/category/batchDelete',
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