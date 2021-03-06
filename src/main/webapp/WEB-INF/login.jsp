<%@ page import="com.belzowski.Support.Enum.Alert" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="userForm" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/home.css">
    <link rel="stylesheet" href="../resources/CSS/footer.css">


    <title>ALLLEDROGO</title>
</head>
<body>


<jsp:include page="header.jsp"></jsp:include>

<div class="py-5 bg-primary">
    <div class="container">
        <div class="row bg-primary">
            <div class="col-md-3"> </div>
            <div class="col-md-6">
                <div class="card text-white p-5 bg-primary border border-success">
                    <div class="card-body">
                        <h1 class="mb-4 text-center text-secondary" style="padding-bottom: 20px">Zaloguj</h1>

                        <% if(session.getAttribute("alert") == Alert.NOT_FOUND){%>
                        <div class="alert alert-error alert-danger" role="alert" id="loginAlert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
                            <h4 class="alert-heading">Nie udało się zalogować</h4>
                            <p class="mb-0">Niestety konto o podanym <b>loginie</b> nie istnieje. Prosimy wybrać inny i spróbować ponownie. </p>
                        </div>
                       <%} %>

                        <userForm:form modelAttribute="userModel" action="check" method="post">
                            <div class="form-group">
                                <label class="text-secondary">Login</label>
                                <userForm:input path="login" type="text" class="form-control" placeholder="Login" required=""/> </div>
                            <div class="form-group">

                                <% if(session.getAttribute("alert") == Alert.FOUND){%>
                                <div class="alert alert-danger" role="alert" id="emailAlert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">×</button>
                                    <h4 class="alert-heading">Nie udało się zalogować</h4>
                                    <p class="mb-0">Niestety podane<b> hasło</b> nie pasuje do loginu. Prosimy wybrać inne lub użyć opcji przypominania haseł.&nbsp;</p>
                                </div>
                                <%} %>

                                <label class="text-secondary">Haslo</label>
                                <userForm:input path="password" type="password" class="form-control" placeholder="Hasło" required=""/> </div>
                            <div class="loginButton text-center" style="margin-top: 40px;">
                                <button type="submit" class="btn btn-block btn-lg text-center btn-warning text-white">Zaloguj</button>
                            </div>
                        </userForm:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</body>
</html>
