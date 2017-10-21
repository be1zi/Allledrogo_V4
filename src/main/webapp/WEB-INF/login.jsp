<%--
  Created by IntelliJ IDEA.
  User: ${USER}
  Date: ${DATE}
  Time: ${TIME}
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="userForm" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/login.css">


    <title>ALLLEDROGO</title>
</head>
<body>


<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">
    <div class="loginFormTitle" style="border: solid greenyellow">
        <h2 class="title" style="border: solid blue">Logowanie</h2>
    </div>

    <div class="loginForm" style="border: solid pink">
        <userForm:form  modelAttribute="userModel" action="check" method="post">
            <div class="form-row">
                 <div class="form-group col-md-6">
                     <label for="login" class="col-form-label">Login</label>
                     <userForm:input path="login" type="text" class="form-control" id="login" placeholder="Login" required =""/>
                 </div>
                <div class="form-group col-md-6">
                    <label for="password" class="col-form-label">Password</label>
                    <userForm:input path="password" type="password" class="form-control" id="password" placeholder="Password"/>
                </div>
            </div>
            <div class="loginButton">
                <a href="/check"><button type="submit" class="btn btn-primary ">Zaloguj</button></a>
            </div>
        </userForm:form>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>


<script src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
