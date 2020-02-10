
    <title>在线考试系统</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css"
          integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <style>
        .header {
            height: 75px;
            background-color: #293448;
        }

        .header-wyuIcon {
            display: inline-block;
            margin-left: 20%;
        }

        .header-links {
            display: inline-block;
            margin-left: 50px;
        }

        .header-links a {
            margin-top: 8px;
            margin-left: 30px;
            padding-bottom: 0;
            font-size: 1.2rem;
            color: #ffffff;
        }
        .grade-img{
            width: fit-content;
            margin: 20px auto 0;
        }
        .grade-body{
            width: fit-content;
            margin: 40px auto 0;
        }
        table{
            margin-left: 12px;
            background-color: #f1faea;
        }
        table td{
            padding-left: 100px;
            border: 1px solid #dddddd;
            line-height: 40px;
            font-size: 15px;
        }
    </style>
    <style>
        .header {
            height: 75px;
            background-color: #293448;
        }

        .header-wyuIcon {
            display: inline-block;
            margin-left: 20%;
        }

        .header-links {
            display: inline-block;
            margin-left: 50px;
        }

        .header-links a {
            margin-top: 8px;
            margin-left: 30px;
            padding-bottom: 0;
            font-size: 1.2rem;
            color: #ffffff;
        }

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
            width: 290px;
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
            width: 45px;
            height: 40px;
        }

        .answer-sheet-a {
            display: block;
            width: 25px;
            height: 20px;
            padding: 1px 0 0 8px;
            font-size: 15px;
            border-radius: 3px;
            background-color: #5bc0de;
            margin: auto;
            color: #ffffff;
        }

    </style>
    <style>
        .header{
            height: 75px;
            background-color: #293448;
        }
        .header-wyuIcon{
            display: inline-block;
            margin-left: 20%;
        }

        .header-links{
            display: inline-block;
            margin-left: 50px;
        }
        .header-links a{
            margin-top: 8px;
            margin-left: 30px;
            padding-bottom: 0;
            font-size: 1.2rem;
            color: #ffffff;
        }
        .content-selectPaper{
            height: 150px;
            width: fit-content;
            margin: 20px auto 0;
            padding-top: 50px;
            background-color: #f1faea;
        }
        .container{
            max-width: 1200px;
            margin-top: 20px;
        }
        .col{
            width: 72px;
            border: 1px solid #dddddd;
        }
    </style>
    <style>
        .header {
            height: 75px;
            background-color: #293448;
        }

        .header-wyuIcon {
            display: inline-block;
            margin-left: 20%;
        }

        .header-links {
            display: inline-block;
            margin-left: 50px;
        }

        .header-links a {
            margin-top: 8px;
            margin-left: 30px;
            padding-bottom: 0;
            font-size: 1.2rem;
            color: #ffffff;
        }

        .content-grid {
            display: block;
            width: fit-content;
            margin: 66px auto 0;
        }

        .content-table {
            max-width: 1200px;
            border: 1px solid #dddddd;
        }

        .content-table td {
            border: 1px solid #dddddd;
        }

        /* table 科目样式 */
        .table-kskm {
            display: block;
            margin: 35px 0 0 46px;
            font-weight: bold;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            color: #a94442;
        }

        /* table 监考字体 */
        .table-jiankao {
            width: 280px;
            margin: 35px 20px 10px 20px;
            padding: 0px 0 0px 26px;
            background-color: #F1FAEA
        }
    </style>
    <style>
        .backgroup {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background-color: #6699ff;
        }

        .login-title {
            margin: 200px auto 0;
            width: 500px;
            height: 100px;

            text-align: center;
            line-height: 4;
            font-size: 25px;
            font-weight: 300;
            color: #ffffff;
        }

        .login-body {
            width: 500px;
            height: 300px;
            margin: 0 auto;

            /*filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8;*/
        }

        .loginBtn {
            margin: auto;
        }
    </style>



    <style>
        .header {
            height: 75px;
            background-color: #293448;
        }

        .header-wyuIcon {
            display: inline-block;
            margin-left: 20%;
        }

        .header-links {
            display: inline-block;
            margin-left: 50px;
        }

        .header-links a {
            margin-top: 8px;
            margin-left: 30px;
            padding-bottom: 0;
            font-size: 1.2rem;
            color: #ffffff;
        }

        .footer {
            margin-top: 0;
            height: 80px;
            width: 100%;
            background-color: #293448;
        }

        .footer-content {
            margin-left: 30%;
            padding-top: 15px;
            color: #ffffff;
        }

        .content {
            position: relative;
        }

        .content img {
            display: block;
            width: fit-content;
            margin: 30px auto;
        }
    </style>
