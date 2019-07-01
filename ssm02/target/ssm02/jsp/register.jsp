<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Sign Up Login</title>
<link rel="stylesheet" href="${ctx}/static/css/style.css">
<link rel="shortcut icon" href="${ctx}/static/images/back.jpg">
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<link rel="stylesheet" href="${ctx}/static/plugins/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script src="${ctx}/static/plugins/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="${ctx}/static/plugins/layer-v3.1.1/layer/layer.js"></script>
<script src="${ctx}/static/js/index.js"></script>

</head>

<body>

<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>


<div class="cotn_principal">
    <div class="cont_centrar">
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
              <div class="col_md_login">
                  <div class="cont_ba_opcitiy">
                      <h2>LOGIN</h2>
                      <p>Welcome to UU News.</p>
                      <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
                  </div>
              </div>
              <div class="col_md_sign_up">
                  <div class="cont_ba_opcitiy">
                      <p style="color:#f44336;">${signUser}</p>
                      <h2>SIGN UP</h2>
                      <p>Welcome to UU News.</p>
                      <button class="btn_sign_up" onClick="cambiar_sign_up()">SIGN UP</button>
                  </div>
              </div>
            </div>
            <div class="cont_back_info">
                <div class="cont_img_back_grey"> <img src="/uploadImg/po.jpg" alt="" /> </div>
            </div>
            <div class="cont_forms" >
                <div class="cont_img_back_"> <img src="/uploadImg/po.jpg" alt="" /> </div>
                    <form action="${ctx}/user/login" method="POST" id="loginIn">
                        <div class="cont_form_login"> <a href="#" onClick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
                            <h2>LOGIN</h2>
                            <input type="text" placeholder="请输入用户名" name="username" id="loginUsername" value="${user.username}"/>
                            <input type="password" placeholder="请输入密码" name="password" id="loginPwd" />
                            <label class="radio-inline">
                                <input type="radio" name="option" id="option1" value="option1" checked> 用户
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="option" id="option2"  value="option2"> 管理员
                            </label>
                            <p style="color:#f44336;">${msg}</p>
                            <button id="loginBtn" class="btn_login" onClick="cambiar_login()">LOGIN</button>
                        </div>
                    </form>
                    <form action="${ctx}/user/insertOne" method="post" id="signupForm">
                        <div class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
                            <h2>SIGN UP</h2>
                            <input type="text" placeholder="请输入用户名" name="username" id="username" />
                            <div style="color:#f44336;" id="usernameTip"></div>
                            <input type="password" placeholder="请输入密码" name="password" id="password" />
                            <div style="color:#f44336;" id="passwordTip"></div>
                            <input type="email" placeholder="请输入邮箱" name="email" id="email" />
                            <button class="btn_sign_up" id="signMe">SIGN UP</button>
                        </div>
                    </form>
              </div>
        </div>
    </div>
</div>

<script>
    $(function () {
        var info;
        //判断用户名是否可用
        $("#username").blur(function(){
            var username = $(this).val();
            $.ajax({
                url:'${ctx}/user/registUsername',
                data:{username:username},
                type:'post',
                success:function(data){
                    // alert(data);
                    info = data;
                    if (data){
                        $("#usernameTip").html("用户名已被注册");
                    }else{
                        $("#usernameTip").html("用户名可用");
                    }
                }
            })
        })
        // 点击按钮判断表单状态
        $("#signMe").click(function(event){
            var event = event || window.event;
            event.preventDefault(); // 兼容标准浏览器
            window.event.returnValue = false; // 兼容IE6~8
            if (info){
                $("#username").focus();
                $("#usernameTip").text("请重新输入用户名");
            }else if ($("#password").val().length<6||$("#password").val().length>12) {
                $("#password").focus();
                $("#passwordTip").text("请输入6-12位字符");
            }else{
                $("#signupForm").submit();
            }
        })
    })

</script>


<%--表单验证--%>
<script>
    $().ready(function () {
        // 注册---在键盘按下并释放及提交后验证提交表单
        $("#signupForm").validate({
            rules: {
                username: {
                    required: true,
                },
                password: {
                    required: true,
                    rangelength: [6,12]
                },
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                username: {
                    required: "请输入用户名",
                },
                password: {
                    required: "请输入密码",
                    rangelength:'请输入6-12个字符'
                },
                email: "请输入一个正确的邮箱"
            },
            //重写showErrors
            showErrors: function (errorMap, errorList) {
                var msg = "";
                $.each(errorList, function (i, v) {
                    //msg += (v.message + "\r\n");
                    //在此处用了layer的方法,显示效果更美观
                    layer.tips(v.message, v.element, {
                         time: 2000,
                         tips:[2,'#78BA32']
                        });
                    return false;
                });  
            },
            /* 失去焦点时不验证 */
            onfocusout: false
        });

        //登录
        $("#loginIn").validate({
            rules: {
                username: {
                    required: true,

                },
                password: {
                    required: true,
                    rangelength:[6,12]
                }
            },
            messages: {
                username: {
                    required: "请输入用户名",
                },
                password: {
                    required: "请输入密码",
                    rangelength:'请输入6-12个字符'
                }
            },
            //重写showErrors
            showErrors: function (errorMap, errorList) {
                var msg = "";
                $.each(errorList, function (i, v) {
                    //msg += (v.message + "\r\n");
                    //在此处用了layer的方法,显示效果更美观
                    layer.tips(v.message, v.element, {
                        time: 2000,
                        tips:[2,'#78BA32']
                    });
                    return false;
                });
            },
            /* 失去焦点时不验证 */
            onfocusout: false
        });
    });
</script>
</body>
</html>
