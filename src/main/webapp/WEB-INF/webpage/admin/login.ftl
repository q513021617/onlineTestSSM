<!DOCTYPE html>
<html lang="en">
<#include "../comment/head.ftl">
<body>
<div class="wthree_agile_admin_info" id="wthree_agile_admin_info">

    <#include "../comment/top_nav.ftl">
    <!-- /inner_content-->
    <div class="inner_content">
        <!-- /inner_content_w3_agile_info-->
        <div class="inner_content_w3_agile_info">

            <div class="registration admin_agile">

                <div class="signin-form profile admin">
                    <h2>后台登录</h2>
                    <div class="login-form" id="login-form">
                        <form  method="post" id="loginform">
                            <input type="text" id="uname" name="uname" value="用户名...." required="">

                            <input type="password" id="pwd" name="pwd" value="密码...." required="">

                            <div class="tp">
                                <input type="button" value="登录" id="submitBtn" class="btn btn-primary btn-lg">
                                <a href="${request.contextPath}/">返回前台登录？</a>
                            </div>

                        </form>
                    </div>

                </div>

            </div>
            <!-- //inner_content_w3_agile_info-->
        </div>
        <!-- //inner_content-->
    </div>

    <script>
        $(document).ready(function(){
            $("#submitBtn").click(function(){
                var username=document.getElementById("uname").value;
                var password=document.getElementById("pwd").value;
                var data = {'uname':username, 'pwd':password};
                axios.post('${request.contextPath}/adminlogin/', data).then(function (response) {
                    <#--axios.get('${request.contextPath}/Admin/User/').then(function (response) {-->
                    console.log(response.data.status);
                    if(response.data.status){
                        location.href="${request.contextPath}/Admin/";
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
    <#include "../comment/footer.ftl" />
    <#--导入footer-->
</div>
</body>
</html>