<div class="inner_content">
    <!-- /inner_content_w3_agile_info-->

    <!-- breadcrumbs -->
    <div class="w3l_agileits_breadcrumbs">
        <div class="w3l_agileits_breadcrumbs_inner">
            <ul>
                <li><a href="${request.contextPath}/Admin/">主页</a><span>«</span></li>
                <li>试题管理</li>
            </ul>
        </div>
    </div>


    <div class="inner_content_w3_agile_info two_in">
        <h2 class="w3_inner_tittle">试题管理</h2>
        <!-- tables -->
        <#---->
        <button onclick="add()" class="btn btn-info">增加试题</button>
        <button onclick="upload()" class="btn btn-info">批量导入试题</button>
        <div class="agile-tables">
            <div class="w3l-table-info agile_info_shadow">
                <h3 class="w3_inner_tittle two">试题列表</h3>
                <table id="table">
                    <thead>
                    <tr>
                        <th>试题ID</th>
                        <th>试题标题</th>
                        <th>试题类型</th>
                        <th>试题科目</th>
                        <th>试题答案</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list topicList as topicItem>
                        <tr>
                            <#if topicItem.id??>
                                <td>${topicItem.id}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>
                            <#if topicItem.title??>
                                <td>${topicItem.title}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>

                            <td>
                        <#if topicItem.type??>
                                <#switch topicItem.type>
                                    <#case "0">选择题<#break>
                                    <#case "1">填空题<#break>
                                    <#case "2">判断题<#break>

                                </#switch>
                                <#else>
                            没有信息
                            </#if>
                               </td>

                            <#if topicItem.subject??>
                                <td>${topicItem.subject}</td>
                            <#else>

                                <td>没有信息</td>
                            </#if>
                            <#if topicItem.answer??>
                                <td>${topicItem.answer}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>

                            <td><button id="delbtn" onclick='del("${topicItem.id}")' class="btn btn-info">删除</button>
                                <button id="addbtn" onclick='edit("${topicItem.id}")' class="btn btn-info">修改</button>
                            </td>

                        </tr>
                    </#list>

                    </tbody>
                </table>


            </div>

            <div id="page" class="m-pagination"></div>
        </div>


    </div>

</div>



<div id="topicItemAddInfoForm" style="display:none;"  class="form-control">

    <br/>

    <div class="row">
        <div class="col-xs-3" id="topicTitle">试题标题</div>
        <div class="col-xs-3"><input id="addtopicTitleinput" class="input-lg"/></div>
    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="topicType">试题类型</div>
        <div class="col-xs-3" >

            <select id="addtopicTypeinput">
                <option value ="0" >选择题</option>
                <option value ="1" >填空题</option>
                <option value ="2" >判断题</option>
            </select>
        </div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="topicSubject">试题科目</div>
        <div class="col-xs-3"><input id="addtopicSubjectinput" class="input-lg"/></div>
    </div><br/>
    <div class="row">
        <div class="col-xs-3" id="topicDescription">试题描述</div>
        <div class="col-xs-3" ><textarea id="addtopicDescriptionInput" rows="3" cols="10" >这里输入题目描述.....</textarea></div>

    </div>
    <br/>



    <div class="row"  id="topicAnswers">
        <div class="col-xs-3" >试题答案选项</div>
        <div class="col-xs-3" >
            <div class="col-xs-5" >
                A:</div><div class="col-xs-5" ><input id="addAtopicAnswerinput" class="input-lg"/></div><br/>
            <div class="col-xs-5" >
                B:</div><div class="col-xs-5" ><input id="addBtopicAnswer" class="input-lg"/></div><br/>
            <div class="col-xs-5" >
                C:</div><div class="col-xs-5" ><input id="addCtopicAnswer" class="input-lg"/></div><br/>
            <div class="col-xs-5" >
                D:</div><div class="col-xs-5" ><input id="addDtopicAnswer" class="input-lg"/></div>
        </div>

    </div>

    <br/>
    <div class="row">
        <div class="col-xs-3" id="topicAnwser">试题答案</div>
        <div class="col-xs-3" ><input id="addtopicAnwserinput" class="input-lg"/></div>

    </div>
    <br/>

    <br/>

    <div class="row">
        <div class="col-xs-3"/><div class="col-xs-3"><button id="addSubmitBtn" class="btn btn-info">提交</button></div><div class="col-xs-3"/>
    </div>



</div>



<div id="topicItemEditInfoForm" style="display:none;">
    <br/>
    <div class="row">
        <div class="col-xs-3" id="topicTitle">试题标题</div>
        <div class="col-xs-3"><input id="edittopicTitleinput" class="input-lg"/></div>
    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="topicType">试题类型</div>
        <div class="col-xs-3" >

            <select id="edittopicTypeinput">
                <option value ="0">选择题</option>
                <option value ="1" >填空题</option>
                <option value ="2" >判断题</option>
            </select>
        </div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="edittopicSubject">试题科目</div>
        <div class="col-xs-3"><input id="edittopicSubjectinput" class="input-lg"/></div>
    </div><br/>

    <div class="row">
        <div class="col-xs-3" id="topicDescription">试题描述</div>
        <div class="col-xs-3" ><textarea id="edittopicDescriptionInput" rows="3" cols="10">这里输入题目描述.....</textarea></div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="topicAnswer">试题答案选项</div>
        <div class="col-xs-3" >
            <div class="col-xs-5" >
                A:</div><div class="col-xs-5" ><input id="editAtopicAnswerinput"/></div><br/>
            <div class="col-xs-5" >
            B:</div><div class="col-xs-5" ><input id="editBtopicAnswer"/></div><br/>
            <div class="col-xs-5" >
            C:</div><div class="col-xs-5" ><input id="editCtopicAnswer"/></div><br/>
            <div class="col-xs-5" >
            D:</div><div class="col-xs-5" ><input id="editDtopicAnswer"/></div>
        </div>

    </div>

    <br/>
    <div class="row">
        <div class="col-xs-3" id="topicAnwser">试题答案</div>
        <div class="col-xs-3" ><input id="edittopicAnwserinput" class="input-lg"/></div>

    </div>
    <br/>

    <br/>
    <div class="row">
        <div class="col-xs-3"/><div class="col-xs-3"><button id="editSubmitBtn" class="btn btn-info">提交</button></div><div class="col-xs-3"/>
    </div>
</div>

<div id="uploadInfoForm" style="display:none;">
    <br/>
    <form name="Form2" method="POST"  enctype="multipart/form-data">
        <h1>上传文件</h1>
        <input type="file" id="file">
        <input type="submit" value="确定上传" id="uploadBtn" class="btn btn-info" onclick="uploadSubmit()"/>
    </form>

</div>


<script type="text/javascript">

    var temptopicid="";
    var topicadddilog;


    $("#page").on("pageClicked", function (event, data) {
        // console.log(data);

        axios.get('${request.contextPath}/Admin/TopicItem/'+(data.pageIndex+1)+'/'+data.pageSize).then(function (response) {
            // console.log(response);
            if(response.data.status){

                // console.log(response.data.data);
                index = response.data.data.pageindex - 1;
                temptotal=response.data.data.totaldata;
                console.log(temptotal);
                console.log(index);
                console.log(data.pageIndex);
                $("#inner_content").html(response.data.data.page);
            }else {
                confirm("失败!");

            }
        }).catch(function (error) {
            console.log(error);
        });
    });

    function reload() {
        axios.get('${request.contextPath}/Admin/TopicItem/').then(function (response) {
            // console.log(response);
            if(response.data.status){


                // console.log(response.data.data);
                $("#inner_content").html(response.data.data.page);
            }else {
                confirm("失败!");

            }
        }).catch(function (error) {
            console.log(error);
        });

    }
    function del(id) {


        axios.delete('${request.contextPath}/Admin/TopicItem/'+id).then(function (response) {

            <#--axios.get('${request.contextPath}/Admin/User/').then(function (response) {-->
            console.log(response.data.status);
            if(response.data.status){
                temptotal=temptotal-1;
                layer.alert('删除成功！', {icon: 6});
                reload();
            }else {
                // confirm("失败!");
                layer.alert('删除失败', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
    }

    function add() {

        topicadddilog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '520px'],
            content: $('#topicItemAddInfoForm').show() //这里content是一个普通的String
        });


    }

    function addSubmit() {


        // $('#topicItemAddInfoForm').hide();
        var title=$('#addtopicTitleinput').val();
        var type=$('#addtopicTypeinput').val();
        var subject=$('#addtopicSubjectinput').val();
        var ansItemsA="";
        var ansItemsB="";
        var ansItemsC="";
        var ansItemsD="";
        if(type == 0){

            ansItemsA=$('#addAtopicAnswerinput').val();
           ansItemsB=$('#addBtopicAnswer').val();
             ansItemsC=$('#addCtopicAnswer').val();
             ansItemsD=$('#addDtopicAnswer').val();
        }else {
            ansItemsA=null;
            ansItemsB=null;
            ansItemsC=null;
            ansItemsD=null;
        }
        var answer=$('#addtopicAnwserinput').val();
        var description=$('#addtopicDescriptionInput').val();

        var userData ={'title':title,'answer':answer,'ansItemsA':ansItemsA,'ansItemsB':ansItemsB,'ansItemsC':ansItemsC,'ansItemsD':ansItemsD,'type':type,'description':description,'subject':subject};
        // alert(username+" "+pwd+" "+phone+" "+type);
        axios.post('${request.contextPath}/Admin/TopicItem/',userData).then(function (response) {

            <#--axios.get('${request.contextPath}/Admin/User/').then(function (response) {-->
            console.log(response.data.status);
            if(response.data.status){
                // layer.alert('添加成功！', {icon: 6});
                temptotal=temptotal+1;
                layer.close(topicadddilog);
                reload();
            }else {
                // confirm("失败!");
                layer.alert('添加失败', {icon: 6});
                layer.close(topicadddilog);
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });



    }


    function upload() {

        uploadInfodialog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '520px'],
            content: $('#uploadInfoForm').show() //这里content是一个普通的String
        });


    }

    function uploadSubmit() {
        //
       // $("#uploadBtn").disable();
        var formData = new FormData();
        formData.append('file', $('#file')[0].files[0]);
        console.log(formData);
        axios.post('${request.contextPath}/Admin/TopicItem/upload/',formData).then(function (response) {

            <#--axios.get('${request.contextPath}/Admin/User/').then(function (response) {-->
            console.log(response.data.status);
            if(response.data.status){
                // layer.alert('添加成功！', {icon: 6});

                layer.close(uploadInfodialog);
                reload();
            }else {
                // confirm("失败!");
                layer.alert('导入失败', {icon: 6});
                layer.close(uploadInfodialog);
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });

    }
    function edit(id) {
        temptopicid=id;
        var respondata="";
        axios.get('${request.contextPath}/Admin/TopicItem/'+id).then(function (response) {

            if(response.data.status){
                respondata=response.data.data;

                $('#edittopicTitleinput').val(respondata.title);
                $('#edittopicTypeinput').val(respondata.type);

                $('#edittopicSubjectinput').val(respondata.subject);
                $('#edittopicAnwserinput').val(respondata.answer);

                $('#editAtopicAnswerinput').val(respondata.ansItemsA);
                $('#editBtopicAnswer').val(respondata.ansItemsB);
                $('#editCtopicAnswer').val(respondata.ansItemsC);
                $('#editDtopicAnswer').val(respondata.ansItemsD);


                $('#edittopicDescriptionInput').val(respondata.description);

            }else {

                layer.alert('获取信息失败!', {icon: 6});
                reload();
            }
        }).catch(function (error) {
                console.log(error);
            });

        topicadddilog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '360px'],
            content: $('#topicItemEditInfoForm').show()
        });

    }

    function editSubmit() {

        var title=$('#edittopicTitleinput').val();
        var type=$('#edittopicTypeinput').val();
        var subject=$('#edittopicSubjectinput').val();


        var ansItemsA="";
        var ansItemsB="";
        var ansItemsC="";
        var ansItemsD="";

        if(type == '0'){

            ansItemsA=$('#editAtopicAnswerinput').val();
            ansItemsB=$('#editBtopicAnswer').val();
            ansItemsC=$('#editCtopicAnswer').val();
            ansItemsD=$('#editDtopicAnswer').val();
        }else {
            ansItemsA=null;
            ansItemsB=null;
            ansItemsC=null;
            ansItemsD=null;
        }
        var answer=$('#edittopicAnwserinput').val();
        var description=$('#edittopicDescriptionInput').val();

        var topicData ={'id':temptopicid,'title':title,'answer':answer,'ansItemsA':ansItemsA,'ansItemsB':ansItemsB,'ansItemsC':ansItemsC,'ansItemsD':ansItemsD,'type':type,'description':description,'subject':subject};

        axios.put('${request.contextPath}/Admin/TopicItem/',topicData).then(function (response) {


            console.log(response.data.status);
            if(response.data.status){
                // layer.alert('修改成功！', {icon: 6});
                layer.close(topicadddilog);
                reload();
            }else {
                // confirm("失败!");
                layer.close(topicadddilog);
                layer.alert('修改失败', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
    }


    $(document).ready(function() {

        initpage(5,temptotal);
        $("#addSubmitBtn").click(function(){
                addSubmit();
            }
        );

        $("#editSubmitBtn").click(function(){
                editSubmit();
            }
        );

        $('#table').basictable();

        $('#table-breakpoint').basictable({
            breakpoint: 768
        });

        $('#table-swap-axis').basictable({
            swapAxis: true
        });

        $('#table-force-off').basictable({
            forceResponsive: false
        });

        $('#table-no-resize').basictable({
            noResize: true
        });

        $('#table-two-axis').basictable();

        $('#table-max-height').basictable({
            tableWrapper: true
        });





    });
</script>