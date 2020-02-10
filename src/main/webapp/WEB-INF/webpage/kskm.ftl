<html>
<head>


    <#include "forecomment/head.ftl">

</head>
<body>
<#include "navbar.ftl">
    <img src="${request.contextPath}/static/images/fenlei01.png" style="display: block;width: fit-content;margin: 66px auto 0">

    <div class="content-grid">
        <img src="${request.contextPath}/static/images/fenlei02.png" style="margin-left: -29px">




        <table class="content-table">


            <tr>
                <#if testlist??>
                <#list testlist as testItem>
            <td>
            <a class="table-kskm" style="color: #a94442"
            href="${request.contextPath}/web/paper/${testItem.id}">${testItem.testname}</a>
            <div class="table-jiankao">考试方式：
                <#switch testItem.type>
                <#case 0>实时考试<#break>
                <#case 1>模拟考试<#break>
                <#default >类别错误
                </#switch></div>
            </td>
                </#list>
                </#if>
            </tr>
        </table>
    </div>
    <#include "./forecomment/footer.ftl">
</body>
</html>
