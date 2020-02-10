<html>
<head>
    <#include "forecomment/head.ftl">
</head>
<body>
<#include "navbar.ftl">
<div class="content">
    <img src="${request.contextPath}/static/images/index02.png">
    <img src="${request.contextPath}/static/images/index03.png">
    <button id="" type="button" class="btn btn-success" style="width: 980px;margin: 65px auto 65px auto;display: block"
            onclick="exam()">立即考试
    </button>
</div>
<#include "./forecomment/footer.ftl">

</body>

<script>
    function exam(){

       location.href="${request.contextPath}/web/kskm";
    }

     </script>
</html>
