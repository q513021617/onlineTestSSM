<html>
<head>
    <title>考试页面</title>
    <#include "forecomment/head.ftl">
    <style>
        .exam-explain {
            background-color: #f5f5f5;
            padding-left: 47px;
            font-size: 15px;
            color: #337ab7;
        }

        .main-content {
            width: 1172px;
            margin: auto;
            background-color: #fcf8e3;
        }

        .main-content-title {
            width: fit-content;
            margin: auto;
            padding: 30px 0 30px 0;
            color: #337ab7;
            font-size: 24px;
        }

        .test-question {
            margin: 22px 15px;
        }

        .test-question .question {
            padding-left: 15px;
            background-color: #dff0d8;
            line-height: 58px;
            font-size: 18px;
            font-weight: 500;
            color: #000000;
        }

        .test-question .answer {
            padding-left: 25px;
            line-height: 36px;
            font-size: 16px;
        }

        .exam-time {
            position: fixed;
            left: 0;
            top: 30%;
        }

        .exam-time .text {
            padding: 10px 15px;
            border: 1px solid #d6e9c6;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            background-color: #dff0d8;
            line-height: 1.5;
            font-weight: 400;
            font-size: 14px;
            color: #3c763d;
            width: 120px;
            height: 40px;
        }

        .exam-time .value {
            padding: 10px 15px;
            border: 1px solid #d6e9c6;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            background-color: #ffffff;
            line-height: 1.5;
            font-weight: 400;
            font-size: 14px;
            color: #23527c;
            width: 120px;
            height: 40px;
        }
        .exam-time .value span{
            color: red;
        }

        .answer-sheet {
            position: fixed;
            right: 0;
            top: 30%;
            width: 350px;
        }

        .answer-sheet .title {
            padding: 10px 15px;
            background-color: #dff0d8;
            line-height: 1.5;
            font-weight: 400;
            font-size: 14px;
            color: #3c763d;
            border: 1px solid #d6e9c6;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .answer-sheet .body {
            border: 1px solid #d6e9c6;
            text-align: center;
        }

        .answer-sheet .submit {
            padding: 10px 0 0 116px;
            height: 62px;
            background-color: #f5f5f5;
            border: 1px solid #d6e9c6;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;

        }

        .answer-sheet td {
            border: 1px solid #ddd;
            width: 60px;
            height: 50px;
        }

        .answer-sheet-a {
            display: block;
            width: 55px;
            height: 35px;
            padding: 1px 0 0 8px;
            font-size: 15px;
            border-radius: 3px;
            background-color: #5bc0de;
            margin: auto;
            color: #ffffff;
        }
        table td {
            padding-left: 0px;
            border: 1px solid #dddddd;
            line-height: 40px;
            font-size: 15px;
        }
    </style>
</head>
<body>
<#include "navbar.ftl">

<div class="main-content">
    <form id="exam" action="<%=basePath%>exam" method="post">
        <div class="main-content-title">${testpaper.papername}</div>

        <div class="exam-explain">
            <div style="font-weight: bolder;">试卷说明:</div>
            <div>1、作答时间为${testpaper.totaltime}分钟,总分100分.</div>
            <div>2、试题年份:2019</div>
            <div>3、试卷来源:考试资料网在线考试中心.</div>
            <div>4、鼠标左键双击标题可在答题卡制作标记.</div>
        </div>

        <div class="test-question">
            <#if topicItemList??>
            <#list topicItemList as topicItem>
                <div class="test-question-item">
                    <a name="a${topicItem_index }" id="#a${topicItem_index}"></a>
                    <div class="question">
                            ${topicItem_index+1}.${topicItem.description}
                        <a href="javascript:void(0)" onclick="onfirmAnswer(${topicItem_index})">【答题标志】</a>

                    </div>
                    <div class="answer">
                        <#--<input type="radio" name="title${topicItem_index + 1}-answer" value="A">-->
                        <input type="radio" name="title${topicItem.id}-answer" value="A">
                        A.${topicItem.ansItemsA}
                    </div>
                    <div class="answer">
                        <input type="radio" name="title${topicItem.id}-answer" value="B">
                        B.${topicItem.ansItemsB}
                    </div>
                    <div class="answer">
                        <input type="radio" name="title${topicItem.id}-answer" value="C">
                        C.${topicItem.ansItemsC}
                    </div>
                    <div class="answer">
                        <input type="radio" name="title${topicItem.id}-answer" value="D">
                        D.${topicItem.ansItemsD}
                    </div>
                </div>
            </#list>
            </#if>
        </div>
    </form>
</div>
<div class="exam-time">
    <div class="text">考试剩余时间</div>
    <div class="value"><span id="exam_time_m"></span>分<span id="exam_time_s"></span>秒</div>
</div>

<div class="answer-sheet">
    <div class="title">答题卡</div>
    <div class="body">
        <table style="margin: 0 auto;">
            <tr>
            <#if topicItemList??>
            <#list topicItemList as topicItem>
                <#if topicItem_index+1 %3==0>
            <tr>
                </#if>
                <td style="text-align: center">
                    <a id="${topicItem.id}" class="answer-sheet-a" href="javascript:void(0);"
                       onclick="getIndex(${topicItem_index})">${topicItem_index + 1}</a>
                </td>
                <#if topicItem_index+1 %3==0>
            </tr>
                </#if>
            <#else>
                <td>没有试题信息</td>
            </#list>
            </#if>
            </tr>


        </table>
    </div>
    <div class="submit">
        <button type="button" class="btn btn-success btn-sm" style="background-color: #5cb85c;line-height: 1;"
                onclick="onSubmit()">交卷
        </button>
    </div>
</div>

<script>

    var topiclist=[];
    var answerlist=[];
    var idlist=[];
    var subject="";

    countTime(1 * 60 * ${testpaper.totaltime});
    //30分钟的倒计时
    function countTime(leftTime) {
        //单位：秒
        // var leftTime = 1 * 60 * 30;
        if (leftTime >= 0) {
            m = parseInt(leftTime / 60) ; //保留整数部分
            s = leftTime % 60 ;         //取余灵敏部分
            document.getElementById("exam_time_m").innerText = m;
            document.getElementById("exam_time_s").innerText = s;
        }else {
            onSubmit();
        }
        leftTime--;
        setTimeout(countTime, 1000 * 1,leftTime);
    }

    function coutScore(itmelist) {
        console.log("----coutScore----");
        var count=0;
        var total=100;
        var aveScore=100/answerlist.length;
        for (var i = 0; i < itmelist.length; i++){
            console.log(itmelist[i]);
            if(answerlist[i]==itmelist[i]){
                count=count+1;
            }
        }

        return count*Math.round(aveScore);
    }

    function onSubmit() {
        // document.getElementById("exam").submit()
        <#--title${topicItem.id}-answer-->
        var itemlist=[];
        console.log("------onSubmit()-------");
        for (var i = 0; i < idlist.length; i++){

        var tempid=idlist[i];
        <#--${topicItem.id}-->
        var pre="title";
        var subfix='-answer';
        console.log(tempid);
        var item = $('input[name='+pre+tempid+subfix+']:checked').val();
        // alert(item);
        console.log(item);
        itemlist.push(item);

        }
       var couts= coutScore(itemlist);
        console.log("------onSubmit()-------");
        console.log(couts);
        location.href="${request.contextPath}/Mobile/Score/web/grade/"+couts+"/"+subject;
    }

    function onfirmAnswer(index) {
        var id = "answer-sheet" + index;
        var answerSheet = document.getElementById(id);
        if (answerSheet.classList.contains("answer-sheet-a-comfirm")) {
            answerSheet.classList.remove("answer-sheet-a-comfirm")
        } else {
            answerSheet.classList.add("answer-sheet-a-comfirm")
        }
    }





    $(document).ready(function() {
        var items="";
        <#--item = $('input[name=${}]:checked').val();-->
        // alert(item);

        axios.get('${request.contextPath}/Admin/Testing/exam/${tesstingId}').then(function (response) {


            console.log(response);
            if(response.data.status){
                topiclist=response.data.data;
                console.log(topiclist);
                subject=topiclist[0].subject;
                // console.log(subject);
                for (var i = 0; i < topiclist.length; i++){
                    console.log(topiclist[i].answer);
                    answerlist.push(topiclist[i].answer);
                    idlist.push(topiclist[i].id);
                    // console.log(answerlist[0]);
                }
            }else {
                console.log(response.msg);

            }
        })
            .catch(function (error) {
                console.log(error);
            });


    });





</script>

<#include "./forecomment/footer.ftl">
</body>
</html>
