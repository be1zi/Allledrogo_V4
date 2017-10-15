<%--
  Created by IntelliJ IDEA.
  User: ${USER}
  Date: ${DATE}
  Time: ${TIME}
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="accForm" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

    <link rel="stylesheet" href="webjars/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <title>Allledrogo</title>
</head>
<body>


<accForm:form  modelAttribute="userModel" action="check" method="post">
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="login" class="col-form-label">Login</label>
            <accForm:input path="login" type="text" class="form-control" id="login" placeholder="Login" required =""/>
        </div>
        <div class="form-group col-md-6">
            <label for="password" class="col-form-label">Password</label>
            <accForm:input path="password" type="password" class="form-control" id="password" placeholder="Password"/>
        </div>
    </div>
    <button type="submit" class="btn btn-primary">Zaloguj</button>
</accForm:form>


<script src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
