
    <!-- /inner_content_w3_agile_info-->

    <!-- breadcrumbs -->
    <div class="w3l_agileits_breadcrumbs">
        <div class="w3l_agileits_breadcrumbs_inner">
            <ul>
                <li><a href="${request.contextPath}/Admin/">主页</a><span>«</span></li>

                <li>用户管理</li>
            </ul>
        </div>
    </div>
    <!-- //breadcrumbs -->

    <div class="inner_content_w3_agile_info two_in">
        <h2 class="w3_inner_tittle">用户管理</h2>
        <!-- tables -->

        <div class="agile-tables">
            <div class="w3l-table-info agile_info_shadow">
                <h3 class="w3_inner_tittle two">用户列表</h3>
                <button id="add" onclick="add()" class="btn btn-info">增加用户</button>
                <table id="table">
                    <thead>
                    <tr>
                        <th>用户ID</th>
                        <th>用户名</th>
                        <th>用户密码</th>
                        <th>电话号码</th>
                        <th>用户类型</th>

                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list userlist as item>
                    <tr>
                        <#if item.id??>
                            <td>${item.id}</td>
                        <#else>
                            <td>没有信息</td>
                        </#if>
                        <#if item.uname??>
                        <td>${item.uname}</td>
                            <#else>
                                <td>没有信息</td>
                        </#if>

                        <#if item.pwd??>
                            <td>${item.pwd}</td>
                        <#else>
                            <td>没有信息</td>
                        </#if>

                        <#if item.phone??>
                            <td>${item.phone}</td>
                        <#else>
                            <td>没有信息</td>
                        </#if>


                            <td>
                        <#if item.type??>
                                <#switch item.type>
                                    <#case 0>学生<#break>
                                    <#case 1>老师<#break>
                                    <#case 2>管理员<#break>
                                </#switch>
                                <#else>
                        没有信息
                        </#if>
                            </td>


                        <td><button id="delbtn" onclick='del("${item.id}")' class="btn btn-info">删除</button>
                            <button id="addbtn" onclick='edit("${item.id}")' class="btn btn-info">修改</button>
                        </td>
                    </tr>
                    <#else>
                        <td>没有用户信息</td>
                    </#list>


                    </tbody>
                </table>


            </div>
            <div id="page" class="m-pagination"></div>

        </div>


    </div>


<div id="userAddInfoForm" style="display:none;" class="login-form">
    <div class="row">
        <div class="col-xs-3" id="username">用户名</div>
        <div class="col-xs-3"><input id="usernameinput" class="input-lg"/></div>
    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="userpassword">用户密码</div>
        <div class="col-xs-3" ><input id="userpasswordinput" class="input-lg"/></div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="phonenumber">电话号码</div>
        <div class="col-xs-3" ><input id="phonenumberinput" class="input-lg"/></div>

    </div>
    <br/>
    <div class="row">
        <div class="col-xs-3" id="usertype">用户类型</div>
        <div class="col-xs-3" >
            <select id="usertypeinput">
                <option value ="0">学生</option>
                <option value ="1">教师</option>
                <option value="2">管理员</option>
            </select>
        </div>

    </div>
    <br/>

    <br/>
    <div class="row">
        <div class="col-xs-3"/><div class="col-xs-3"><button id="addSubmitBtn" class="btn btn-info">提交</button></div><div class="col-xs-3"/>
    </div>



</div>



    <div id="userEditInfoForm" style="display:none;">
        <div class="row">
            <div class="col-xs-3" id="username">用户名</div>
            <div class="col-xs-3"><input id="editusernameinput" class="input-lg"/></div>
        </div>
        <br/>
        <div class="row">
            <div class="col-xs-3" id="userpassword">用户密码</div>
            <div class="col-xs-3" ><input id="edituserpasswordinput" class="input-lg"/></div>

        </div>
        <br/>
        <div class="row">
            <div class="col-xs-3" id="phonenumber">电话号码</div>
            <div class="col-xs-3" ><input id="editphonenumberinput" class="input-lg"/></div>

        </div>
        <br/>
        <div class="row">
            <div class="col-xs-3" id="usertype">用户类型</div>
            <div class="col-xs-3" >
                <select id="editusertypeinput">
                    <option value ="0">学生</option>
                    <option value ="1">教师</option>
                    <option value="2">管理员</option>
                </select>
            </div>

        </div>
        <br/>

        <br/>
        <div class="row">
            <div class="col-xs-3"/><div class="col-xs-3"><button id="editSubmitBtn" class="btn btn-info">提交</button></div><div class="col-xs-3"/>
        </div>
    </div>

<script type="text/javascript">

    var tempuserid="";
    var useradddilog;

    $("#page").on("pageClicked", function (event, data) {
        // console.log(data);

        axios.get('${request.contextPath}/Admin/User/'+(data.pageIndex+1)+'/'+data.pageSize).then(function (response) {
            // console.log(response);
            if(response.data.status){

                // console.log(response.data.data);
                index = response.data.data.pageindex - 1;
                temptotal=response.data.data.pagesize;
                console.log(temptotal);
                console.log(index);
                console.log(data.pagesize);
                $("#inner_content").html(response.data.data.page);
            }else {
                confirm("失败!");

            }
        }).catch(function (error) {
            console.log(error);
        });
    });

    function reload() {
        axios.get('${request.contextPath}/Admin/User/').then(function (response) {
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


        axios.delete('${request.contextPath}/Admin/User/'+id).then(function (response) {

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

        useradddilog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '360px'],
            content: $('#userAddInfoForm').show() //这里content是一个普通的String
        });


    }

    function addSubmit() {
        $('#userAddInfoForm').hide();
        var username=$('#usernameinput').val();
        var pwd=$('#userpasswordinput').val();
        var phone=$('#phonenumberinput').val();
        var type=$('#usertypeinput').val();

        var userData ={'uname':username,'pwd':pwd,'status':1,'phone':phone,'type':type};
        // alert(username+" "+pwd+" "+phone+" "+type);
        axios.post('${request.contextPath}/Admin/User/',userData).then(function (response) {

        <#--axios.get('${request.contextPath}/Admin/User/').then(function (response) {-->
        console.log(response.data.status);
        if(response.data.status){
            temptotal=temptotal+1;
            layer.close(useradddilog);
        layer.alert('添加成功！', {icon: 6});

        reload();
        }else {
        // confirm("失败!");
            layer.close(useradddilog);
        layer.alert('添加失败', {icon: 6});
        reload();
        }
        })
        .catch(function (error) {
        console.log(error);
        });
    }

    var usereditdilog;
    function edit(id) {
        tempuserid=id;
        var respondata="";
        axios.get('${request.contextPath}/Admin/User/'+id).then(function (response) {

            if(response.data.status){
                respondata=response.data.data;
                $('#editusernameinput').val(respondata.uname);
                $('#edituserpasswordinput').val(respondata.pwd);
               $('#editphonenumberinput').val(respondata.phone);
                $('#editusertypeinput').val(respondata.type);
            }else {
                // confirm("失败!");
                layer.alert('获取信息失败!', {icon: 6});
                reload();
            }
        })
            .catch(function (error) {
                console.log(error);
            });
        usereditdilog=layer.open({
            type: 1,
            offset: 'auto',
            area:['500px', '360px'],
            content: $('#userEditInfoForm').show()
        });

    }

    function editSubmit() {

        var username=$('#editusernameinput').val();
        var pwd=$('#edituserpasswordinput').val();
        var phone=$('#editphonenumberinput').val();
        var type=$('#editusertypeinput').val();

        var userData ={'id':tempuserid,'uname':username,'pwd':pwd,'status':1,'phone':phone,'type':type};

        axios.put('${request.contextPath}/Admin/User/',userData).then(function (response) {


            console.log(response.data.status);
            if(response.data.status){
                // layer.alert('修改成功！', {icon: 6});
                layer.close(usereditdilog);
                $('#userEditInfoForm').hide();
                reload();
            }else {
                // confirm("失败!");
                layer.close(usereditdilog);
                $('#userEditInfoForm').hide();
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