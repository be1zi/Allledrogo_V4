<%@ page import="com.belzowski.Model.AccountModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="list" scope="request" type="java.util.List"/>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/home.css">
    <link rel="stylesheet" href="../resources/CSS/footer.css">
    <link rel="stylesheet" href="/resources/CSS/rating.css">

    <title>ALLLEDROGO</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container" style="padding-top: 55px; padding-bottom: 55px">

    <div class="col-md-3"></div>
    <div class="col-md-12" style="padding-top: 60px">
        <jsp:include page="MyAccount/commentList.jsp"></jsp:include>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
