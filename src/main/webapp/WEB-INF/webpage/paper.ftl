
<html>

<head>

    <#include "forecomment/head.ftl">
</head>
<body>
    <#include "navbar.ftl">
    <img src="${request.contextPath}/images/shijuan01.png" style="display: block;width: fit-content;margin: 20px auto 0">
    <div class="content-selectPaper">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <button type="button" class="btn btn-secondary readonly">请选择试卷</button>
            </div>
            <select class="form-control" style="width: 960px" id="paperTitle">
                <option value="">请选择试卷</option>
                <#if paperlist??>
                <#list paperlist as paperItem>
                <option value="${paperItem.id}">${paperItem.papername}</option>
                </#list>
                </#if>
                <#--<c:forEach items="${papers}" var="item">-->
                    <#--<option value="${item.id}">${item.name}</option>-->
                <#--</c:forEach>-->
            </select>
            <div class="input-group-append">
               <button type="button" class="btn btn-success" onclick="onTest()">开始考试</button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row" style="background-color: #f1faea;">
            <div class="col" style="padding: 20px 0 20px 20px;font-weight:bold">
                考场规定
            </div>
            <div class="col" style="padding: 20px 0 20px 20px; font-weight:bold ">
                考场提示
            </div>
        </div>
        <div class="row">
            <div class="col" style="padding-bottom: 200px">
                <div>1.不准携带手机,耳机</div>
                <div>2.不准交头接耳</div>
                <div>3.不准携带与考试无关物品</div>
            </div>
            <div class="col" style="padding-bottom: 200px">
                <div>1.考试发现违纪,本次考试作废</div>
                <div>2.如有问题,请举手</div>
                <div>3.保管好私人物品</div>
            </div>
        </div>
    </div>

    <script>
        function onTest() {
            var paperid=document.getElementById("paperTitle").value;
            // confirm(paperid);
            location.href="${request.contextPath}/web/exam/"+paperid;
        }
    </script>

    <#include "./forecomment/footer.ftl">

</body>
</html>
