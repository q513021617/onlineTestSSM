<div class="inner_content">
    <!-- /inner_content_w3_agile_info-->

    <!-- breadcrumbs -->
    <div class="w3l_agileits_breadcrumbs">
        <div class="w3l_agileits_breadcrumbs_inner">
            <ul>
                <li><a href="${request.contextPath}/Admin/">主页</a><span>«</span></li>
                <li>试卷管理</li>
            </ul>
        </div>
    </div>


    <div class="inner_content_w3_agile_info two_in">
        <h2 class="w3_inner_tittle">试卷管理</h2>
        <!-- tables -->

        <div class="agile-tables">
            <div class="w3l-table-info agile_info_shadow">
                <h3 class="w3_inner_tittle two">试卷列表</h3>
                <button id="add" onclick="add()" class="btn btn-info">增加试卷</button>
                <table id="table">
                    <thead>
                    <tr>
                        <th>试卷ID</th>
                        <th>试卷名</th>
                        <th>科目</th>
                        <th>考试用时</th>

                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list paperlist as item>
                        <tr>
                        <#if (item.id)??>
                            <td>${item.id}</td>
                        <#else>
                            <td>没有信息</td>
                        </#if>
                            <#if (item.papername)??>
                                <td>${item.papername}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>



                            <#if (item.subject)??>
                                <td>${item.subject}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>

                            <#if (item.totaltime)??>
                                <td>${item.totaltime}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>

                            <#if (item.id)??>
                                <td><button id="delbtn" onclick='del("${item.id}")' class="btn btn-info">删除</button>
                                    <button id="addbtn" onclick='edit("${item.id}")' class="btn btn-info">修改</button>
                                </td>
                            <#else>
                                <td>没有信息</td>
                            </#if>

                        </tr>
                    <#else>
                        <td>没有试卷信息</td>
                    </#list>

                    </tbody>
                </table>


            </div>
            <div id="page" class="m-pagination"></div>

        </div>


    </div>

</div>


<div id="paperAddInfoForm" style="display:none;">
    <div class="row">
        <div class="col-xs-3" id="papername">试卷名</div>
        <div class="col-xs-3"><input id="addpapernameinput" class="input-lg"/></div>
    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="totaltime">考试时间</div>
        <div class="col-xs-3" >
            <select id="addtotaltimeinput">
                <option value ="90">90分钟</option>
                <option value ="120">120分钟</option>
                <option value="60">60分钟</option>
            </select>
        </div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="subject">考试科目</div>
        <div class="col-xs-3" ><input id="addsubjectinput" class="input-lg"/></div>

    </div>
    <br/>


    <div class="row">
        <div class="col-xs-3"/><div class="col-xs-3"><button id="addSubmitBtn" class="btn btn-info">提交</button></div><div class="col-xs-3"/>
    </div>



</div>



<div id="paperEditInfoForm" style="display:none;">
    <div class="row">
        <div class="col-xs-3" id="papername">试卷名</div>
        <div class="col-xs-3"><input id="editpapernameinput"/></div>
    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="totaltime">考试时间</div>
        <div class="col-xs-3" >
            <select id="edittotaltimeinput">
                <option value ="90">90分钟</option>
                <option value ="120">120分钟</option>
                <option value="60">60分钟</option>
            </select>
        </div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="subject">考试科目</div>
        <div class="col-xs-3" ><input id="editsubjectinput"/></div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3"/><div class="col-xs-3"><button id="editSubmitBtn" class="btn btn-info">提交</button></div><div class="col-xs-3"/>
    </div>
</div>

<script type="text/javascript">

    var temppaperid="";
    var paperadddilog;



    $("#page").on("pageClicked", function (event, data) {
       // console.log(data);

        axios.get('${request.contextPath}/Admin/Testpaper/'+(data.pageIndex+1)+'/'+data.pageSize).then(function (response) {
            // console.log(response);
            if(response.data.status){

                // console.log(response.data.data);
                index = response.data.data.pageindex - 1;
                temptotal=response.data.data.pagesize;
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
        axios.get('${request.contextPath}/Admin/Testpaper/').then(function (response) {
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
        return;
    }
    function del(id) {


        axios.delete('${request.contextPath}/Admin/Testpaper/'+id).then(function (response) {

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

        paperadddilog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '360px'],
            content: $('#paperAddInfoForm').show() //这里content是一个普通的String
        });


    }

    function addSubmit() {

        var papername=$('#addpapernameinput').val();
        var totaltime=$('#addtotaltimeinput').val();
        var subject=$('#addsubjectinput').val();



        var paperData ={'papername':papername,'totaltime':totaltime,'subject':subject};

        axios.post('${request.contextPath}/Admin/Testpaper/',paperData).then(function (response) {

            <#--axios.get('${request.contextPath}/Admin/User/').then(function (response) {-->
            console.log(response.data.status);
            if(response.data.status){
                temptotal=temptotal+1;

                layer.close(paperadddilog);
                layer.alert('添加成功！', {icon: 6});

                reload();
            }else {
                // confirm("失败!");
                layer.close(paperadddilog);
                layer.alert('添加失败', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
    }

    var papereditdilog;
    function edit(id) {
        temppaperid=id;
        var respondata="";
        axios.get('${request.contextPath}/Admin/Testpaper/'+id).then(function (response) {

            if(response.data.status){
                respondata=response.data.data;
                $('#editpapernameinput').val(respondata.papername);
                $('#edittotaltimeinput').val(respondata.totaltime);
                $('#editsubjectinput').val(respondata.subject);

            }else {
                // confirm("失败!");
                layer.alert('获取信息失败!', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
        papereditdilog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '360px'],
            content: $('#paperEditInfoForm').show()
        });

    }

    function editSubmit() {


        var papername=$('#editpapernameinput').val();
        var total=$('#edittotaltimeinput').val();
        var subject=$('#editsubjectinput').val();

        var paperData ={'id':temppaperid,'papername':papername,'total':total,'subject':subject};

        axios.put('${request.contextPath}/Admin/Testpaper/',paperData).then(function (response) {


            console.log(response.data.status);
            if(response.data.status){
                // layer.alert('修改成功！', {icon: 6});
                layer.close(papereditdilog);

                reload();
            }else {
                // confirm("失败!");
                layer.close(papereditdilog);

                layer.alert('修改失败', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
    }



    $(document).ready(function() {


        console.log("-----试卷管理-------");
        initpage(5,temptotal*5);
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