<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="messageForm" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="singleMessageForm" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/CSS/main.css">
    <link rel="stylesheet" href="/resources/CSS/home.css">
    <link rel="stylesheet" href="/resources/CSS/footer.css">


    <title>ALLLEDROGO</title>
</head>
<body>


<jsp:include page="header.jsp"></jsp:include>

<div class="py-5 bg-primary">
    <div class="container">
        <div class="row bg-primary">
            <div class="col-md-2"> </div>
            <div class="col-md-8">
                <div class="card text-white p-5 bg-primary border border-success">
                    <div class="card-body">
                        <h1 class="mb-4 text-center text-secondary" style="padding-bottom: 20px">Wiadomość</h1>

                        <messageForm:form modelAttribute="message" action="send" method="post">
                            <div class="form-group">
                                <label class="text-secondary">Tytuł</label>
                                <messageForm:input path="topic" type="text" class="form-control" placeholder="Tytuł" disabled="true" required=""/>
                            </div>
                            <singleMessageForm:form modelAttribute="singleMessage" action="send" method="post">
                                <div class="form-group">
                                    <label class="text-secondary">Wiadomość</label>
                                    <singleMessageForm:textarea path="content" type="text" rows="10"  class="form-control" placeholder="Wiadomość..." required=""/>
                                </div>
                                <div class="loginButton text-center" style="margin-top: 40px;">
                                    <button type="submit" class="btn btn-block btn-lg text-center btn-warning text-white">Wyślij</button>
                                </div>

                            </singleMessageForm:form>
                        </messageForm:form>

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
