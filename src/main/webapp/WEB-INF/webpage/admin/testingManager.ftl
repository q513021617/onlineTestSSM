<div class="inner_content">
    <!-- /inner_content_w3_agile_info-->

    <!-- breadcrumbs -->
    <div class="w3l_agileits_breadcrumbs">
        <div class="w3l_agileits_breadcrumbs_inner">
            <ul>
                <li><a href="${request.contextPath}/Admin/">主页</a><span>«</span></li>
                <li>考试管理</li>
            </ul>
        </div>
    </div>


    <div class="inner_content_w3_agile_info two_in">
        <h2 class="w3_inner_tittle">考试管理</h2>
        <!-- tables -->

        <div class="agile-tables">
            <div class="w3l-table-info agile_info_shadow">
                <h3 class="w3_inner_tittle two">考试列表</h3>
                <button onclick="add()" class="btn btn-info">增加考试</button>
                <table id="table">
                    <thead>
                    <tr>
                        <th>考试id</th>
                        <th>考试名称</th>
                        <th>考试试卷</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th>考试方式</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if testlist??>
                    <#list testlist as item>
                        <tr>
                            <#if (item.id)??>
                                <td>${item.id}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>
                            <#if (item.testname)??>
                                <td>${item.testname}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>

                            <#if (item.testpaperid)??>
                                <td>${item.testpaperid}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>

                            <#if (item.starttime)??>
                                <td>${item.starttime?time}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>

                            <#if (item.endtime)??>
                                <td>${item.endtime?time}</td>
                            <#else>
                                <td>没有信息</td>
                            </#if>
                            <#if (item.type)??>
                            <td> <#switch item.type>
                                    <#case 0>实时考试<#break>
                                    <#case 1>模拟考试<#break>
                                    <#default >类别错误
                                </#switch></td>
                            <#else>
                            <td> 没有信息</td>
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
                    <#else>
                    <td>没有试卷信息</td>
                    </#if>
                    </tbody>
                </table>


            </div>
            <div id="page" class="m-pagination"></div>

        </div>


    </div>

</div>





<div id="testingAddInfoForm" style="display:none;">

    <br/>

    <div class="row">
        <div class="col-xs-3" id="testname">考试标题</div>
        <div class="col-xs-3"><input id="addtestnameinput" class="input-lg"/></div>
    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="type">考试类型</div>
        <div class="col-xs-3" >

            <select id="addTypeinput">
                <option value ="0" >实时考试</option>
                <option value ="1" >模拟考试</option>
            </select>
        </div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="starttime">开始时间</div>
        <div class="col-xs-3"><input id="addstarttimeinput" class="input-lg"/></div>
    </div><br/>
    <div class="row">
        <div class="col-xs-3" id="endtime">结束时间</div>
        <div class="col-xs-3" ><input id="addendtimeinput" class="input-lg"/></div>

    </div>
    <br/>

    <div class="row"  id="testpaperid">
        <div class="col-xs-3" >考试试卷</div>
        <div class="col-xs-3">
            <select id="addtestpaperidinput">
                <#list paperlist as item>
                    <option value ="${item.id}" >${item.id}</option>
                </#list>
            </select>
        </div>

    </div>

    <br/>


    <div class="row">
        <div class="col-xs-3"/><div class="col-xs-3"><button id="addSubmitBtn" class="btn btn-info">提交</button></div><div class="col-xs-3"/>
    </div>



</div>



<div id="testingEditInfoForm" style="display:none;">
    <br/>

    <div class="row">
        <div class="col-xs-3" id="testname">考试标题</div>
        <div class="col-xs-3"><input id="editTestnameinput" class="input-lg"/></div>
    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="type">考试类型</div>
        <div class="col-xs-3" >

            <select id="editTypeinput">
                <option value ="0" >实时考试</option>
                <option value ="1" >模拟考试</option>
            </select>
        </div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="starttime">开始时间</div>
        <div class="col-xs-3"><input id="editstarttimeinput" class="input-lg"/></div>
    </div><br/>
    <div class="row">
        <div class="col-xs-3" id="endtime">结束时间</div>
        <div class="col-xs-3" ><input id="editendtimeinput" class="input-lg"/></div>

    </div>
    <br/>

    <div class="row"  id="testpaperid">
        <div class="col-xs-3" >考试试卷</div>
        <#--paperlist-->
        <div class="col-xs-3">
            <select id="editTestpaperidinput">
                <#list paperlist as item>
                <option value ="${item.id}" >${item.id}</option>
                </#list>
            </select>
        </div>

    </div>

    <br/>
    <div class="row">
        <div class="col-xs-3"/><div class="col-xs-3"><button id="editSubmitBtn" class="btn btn-info">提交</button></div><div class="col-xs-3"/>
    </div>
</div>




<script type="text/javascript">

    var temptestid="";
    var testadddilog;

    $("#page").on("pageClicked", function (event, data) {
        // console.log(data);

        axios.get('${request.contextPath}/Admin/Testing/'+(data.pageIndex+1)+'/'+data.pageSize).then(function (response) {
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
        axios.get('${request.contextPath}/Admin/Testing/').then(function (response) {
            console.log(response);
            if(response.data.status){

                console.log(response.data.data);
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


        axios.delete('${request.contextPath}/Admin/Testing/'+id).then(function (response) {

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

        testadddilog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '360px'],
            content: $('#testingAddInfoForm').show() //这里content是一个普通的String
        });


    }

    function addSubmit() {

        var testname=$('#addtestnameinput').val();
        var type=$('#addTypeinput').val();
        var starttime=$('#addstarttimeinput').val();
        var endtime=$('#addendtimeinput').val();
        var testpaperid=$('#addtestpaperidinput').val();

        var testingData ={'testname':testname,'testpaperid':testpaperid,'starttime':starttime,'endtime':endtime,'type':type};

        axios.post('${request.contextPath}/Admin/Testing/',testingData).then(function (response) {

            <#--axios.get('${request.contextPath}/Admin/User/').then(function (response) {-->
            console.log(response.data.status);
            if(response.data.status){
                temptotal=temptotal+1;
                layer.close(testadddilog);
                layer.alert('添加成功！', {icon: 6});

                reload();
            }else {
                // confirm("失败!");
                layer.close(testadddilog);
                layer.alert('添加失败', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
    }

    var testingeditdilog;
    function edit(id) {
        temptestid=id;
        var respondata="";
        axios.get('${request.contextPath}/Admin/Testing/'+id).then(function (response) {

            if(response.data.status){

                respondata=response.data.data;
                $('#editTestnameinput').val(respondata.testname);
                $('#editTypeinput').val(respondata.type);
                $('#editstarttimeinput').val(respondata.starttime);
                $('#editendtimeinput').val(respondata.endtime);
                $('#editTestpaperidinput').val(respondata.testpaperid);
            }else {
                // confirm("失败!");
                layer.alert('获取信息失败!', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
        testingeditdilog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '360px'],
            content: $('#testingEditInfoForm').show()
        });

    }

    function editSubmit() {


        var testname=$('#editTestnameinput').val();
        var type=$('#editTypeinput').val();
        var starttime=$('#editstarttimeinput').val();
        var endtime=$('#editendtimeinput').val();
        var testpaperid=$('#editTestpaperidinput').val();
        var paperData ={'id':temptestid,'testname':testname,'type':type,'starttime':starttime,'endtime':endtime,'testpaperid':testpaperid};

        axios.put('${request.contextPath}/Admin/Testing/',paperData).then(function (response) {


            console.log(response.data.status);
            if(response.data.status){
                // layer.alert('修改成功！', {icon: 6});
                layer.close(testingeditdilog);

                reload();
            }else {
                // confirm("失败!");
                layer.close(testingeditdilog);

                layer.alert('修改失败', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
    }


    $(document).ready(function() {

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