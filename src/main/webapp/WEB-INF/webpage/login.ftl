<html>
<head>
    <#include "forecomment/head.ftl">
    <link rel="stylesheet" href="${request.contextPath}/static/css/drawstyle.css">
</head>
<body>
<div id="container">
    <canvas id="waterfall"></canvas> <div class="emma flex"> <div>
        <div class="login-title">
        在线考试系统
    </div>
    <div class="login-body">
        <form  method="post" id="login-form">
            <div class="input-group mb-3" style="padding: 50px 20px 0 20px">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                </div>
                <input type="text" class="form-control" placeholder="用户名" id="username">
            </div>
            <div class="input-group mb-3" style="padding: 10px 20px 0 20px">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon2"><i class="fas fa-key"></i></span>
                </div>
                <input type="password" class="form-control" placeholder="密码" name="password" id="password">
            </div>
            <div class="input-group mb-3">
                <button type="button" class="btn btn-sm btn-info loginBtn" id="loginBtn">
                    <i class="fab fa-angellist"></i>
                    登录
                </button>
            </div>
            <div class="input-group mb-3" style="width: fit-content;margin: auto">

                    <#--<c:when test="${not empty errMsg}">-->
                        <#--<div style="color: red">登录失败：</div>-->
                    <#--</c:when>-->

            </div>
        </form>
    </div>
        </div></div>
</div>
<#--<div class="backgroup"></div>-->
<#include "./forecomment/footer.ftl">
<script type="text/javascript" src="${request.contextPath}/static/js/pixi.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/static/js/tinycolor.min.js"></script>

<script  src="${request.contextPath}/static/js/drawindex.js"></script>

<div style="text-align:center;clear:both">
    <script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
    <script src="/follow.js" type="text/javascript"></script>
</div>
<script>

    $(document).ready(function(){

        $("#loginBtn").click(function(){


            var username=document.getElementById("username").value;
            var password=document.getElementById("password").value;

            var data = {'uname':username, 'pwd':password};

            axios.post('${request.contextPath}/web/login/', data).then(function (response) {

                <#--axios.get('${request.contextPath}/Admin/User/').then(function (response) {-->
                console.log(response.data.status);
                if(response.data.status){

                    location.href="${request.contextPath}/web/main";
                }else {
                    // confirm("失败!");
                    layer.open({
                        type: 4,
                        content: [response.data.msg, '#login-form'] //数组第二项即吸附元素选择器或者DOM
                    });
                }
            })
                .catch(function (error) {
                    console.log(error);
                });

        });


    });



</script>


</body>
</html>
