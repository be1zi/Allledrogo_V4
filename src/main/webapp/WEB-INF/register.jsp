<%--
  Created by IntelliJ IDEA.
  User: ${USER}
  Date: ${DATE}
  Time: ${TIME}
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="accForm" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="userForm" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/CSS/header.css">
    <link rel="stylesheet" href="../resources/CSS/main.css">

    <title>ALLLEDROGO</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<userForm:form  modelAttribute="userModel" action="save" method="post">
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="login" class="col-form-label">Login</label>
            <userForm:input path="login" type="text" class="form-control" id="login" placeholder="Login" required =""/>
        </div>
        <div class="form-group col-md-6">
            <label for="password" class="col-form-label">Password</label>
            <accForm:input path="password" type="password" class="form-control" id="password" placeholder="Password"/>
        </div>
    </div>

    <accForm:form modelAttribute="accountModel" action="save" method="post">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="firstName" class="col-form-label">Imie</label>
                <userForm:input path="firstName" type="text" class="form-control" id="firstName" placeholder="Imie" required =""/>
            </div>
        </div>
    <button type="submit" class="btn btn-primary">Zarejestruj</button>
    </accForm:form>
</userForm:form>


<script src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
