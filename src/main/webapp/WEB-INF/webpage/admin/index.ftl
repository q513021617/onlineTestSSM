<!DOCTYPE html>
<html lang="en">
<#include "../comment/head.ftl">
<body>

<div class="wthree_agile_admin_info">

    <#include "../comment/w3_agileits_top_nav.ftl">
    <div class="clearfix"></div>

    <div class="inner_content" id="inner_content">
        <!-- /inner_content_w3_agile_info-->
        <div class="inner_content_w3_agile_info">


            <div class="w3ls_agile_cylinder chart agile_info_shadow">
                <h3 class="w3_inner_tittle two">题库图表</h3>

                <div id="chartdiv"></div>


            </div>


            <!-- /agile_top_w3_grids-->
            <div class="row">
                <ul class="ca-menu">
                    <li>
                        <a href="#">

                            <i class="fa fa-building-o" aria-hidden="true"></i>
                            <div class="ca-content">
                                <h4 class="ca-main">16,808</h4>
                                <h3 class="ca-sub">用户数</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <div class="ca-content">
                                <h4 class="ca-main one">26,808</h4>
                                <h3 class="ca-sub one">题目数</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-database" aria-hidden="true"></i>
                            <div class="ca-content">
                                <h4 class="ca-main two">29,008</h4>
                                <h3 class="ca-sub two">访问量</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-tasks" aria-hidden="true"></i>
                            <div class="ca-content">
                                <h4 class="ca-main three">49,436</h4>
                                <h3 class="ca-sub three">注册用户数</h3>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-clone" aria-hidden="true"></i>
                            <div class="ca-content">
                                <h4 class="ca-main four">30,808</h4>
                                <h3 class="ca-sub four">今日开考次数</h3>
                            </div>
                        </a>
                    </li>
                    <div class="clearfix"></div>
                </ul>
            </div>
            <!-- //agile_top_w3_grids-->
            <!-- /agile_top_w3_post_sections-->
            <div class="agile_top_w3_post_sections">
                <div class="col-md-6 agile_top_w3_post agile_info_shadow">
                    <div class="img_wthee_post">
                        <h3 class="w3_inner_tittle">最新报告</h3>
                        <div class="stats-wrap">
                            <div class="count_info"><h4 class="count">65,800,587 </h4><span class="year">最高总分</span></div>
                            <div class="year-info"><span class="year">最近一年</span></div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="stats-wrap">
                            <div class="count_info"><h4 class="count">2,690 </h4><span class="year">最高总分</span></div>
                            <div class="year-info"><span class="year">最近一个月</span></div>
                            <div class="clearfix"></div>
                        </div>
                        <div class="stats-wrap">
                            <div class="count_info"><h4 class="count">24,660 </h4><span class="year">最高总分</span></div>
                            <div class="year-info"><span class="year">最近一天</span></div>
                            <div class="clearfix"></div>
                        </div>


                    </div>
                </div>
                <div class="col-md-6 agile_top_w3_post_info agile_info_shadow">
                    <div class="img_wthee_post1">
                        <h3 class="w3_inner_tittle"> 时钟</h3>
                        <div class="main-example">
                            <div class="clock"></div>
                            <div class="message"></div>

                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>

            <!-- //agile_top_w3_post_sections-->
            <!-- /w3ls_agile_circle_progress-->

            <!-- /w3ls_agile_circle_progress-->
            <!-- /chart_agile-->

            <!-- /w3ls_agile_circle_progress-->
            <div class="w3ls_agile_circle_progress agile_info_shadow">

                <div class="cir_agile_info ">
                    <h3 class="w3_inner_tittle">考试题型占比</h3>
                    <div class="skill-grids">
                        <div class="skills-grid text-center">
                            <div class="circle" id="circles-1"></div>
                            <p>java试题</p>
                        </div>
                        <div class="skills-grid text-center">
                            <div class="circle" id="circles-2"></div>
                            <p>php试题</p>
                        </div>
                        <div class="skills-grid text-center">
                            <div class="circle" id="circles-3"></div>

                            <p>python试题</p>
                        </div>
                        <div class="skills-grid text-center">
                            <div class="circle" id="circles-4"></div>
                            <p>HTML试题</p>
                        </div>



                        <div class="clearfix"></div>

                    </div>
                </div>
            </div>
            <!-- /w3ls_agile_circle_progress-->
            <!--/prograc-blocks_agileits-->
            <div class="prograc-blocks_agileits">


                <div class="col-md-6 bars_agileits agile_info_shadow">
                    <h3 class="w3_inner_tittle two">今日最多考试科目</h3>
                    <div class='bar_group'>
                        <div class='bar_group__bar thin' label='JAVA' show_values='true' tooltip='true' value='343'></div>
                        <div class='bar_group__bar thin' label='Python' show_values='true' tooltip='true' value='235'></div>
                        <div class='bar_group__bar thin' label='Go' show_values='true' tooltip='true' value='550'></div>
                        <div class='bar_group__bar thin' label='PHP' show_values='true' tooltip='true' value='456'></div>
                    </div>
                </div>
                <div class="col-md-6 fallowers_agile agile_info_shadow">
                    <h3 class="w3_inner_tittle two">最近高分榜</h3>
                    <div class="work-progres">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>科目</th>
                                    <th>用户名</th>
                                    <th>总分</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Java</td>
                                    <td>Malorum</td>

                                    <td><span class="label label-danger">98</span></td>

                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Java</td>
                                    <td>Evan</td>

                                    <td><span class="label label-success">90</span></td>

                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Java</td>
                                    <td>John</td>

                                    <td><span class="label label-warning">80</span></td>

                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Java</td>
                                    <td>Danial</td>

                                    <td><span class="label label-info">65</span></td>

                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Tumblr</td>
                                    <td>David</td>

                                    <td><span class="label label-warning">55</span></td>

                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>


                <div class="clearfix"></div>

            </div>

        </div>


        <!-- //inner_content_w3_agile_info-->
    </div>

</div>
<script>

</script>

<#include "../comment/footer.ftl" />
</body>
</html>