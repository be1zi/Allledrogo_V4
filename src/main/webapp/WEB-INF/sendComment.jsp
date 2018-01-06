<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="commentForm" uri="http://www.springframework.org/tags/form" %>
<%--<%@taglib prefix="singleMessageForm" uri="http://www.springframework.org/tags/form" %>--%>

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
                        <h1 class="mb-4 text-center text-secondary" style="padding-bottom: 20px">Komentarz</h1>

                        <commentForm:form modelAttribute="comment" action="send" method="post">
                                <div class="form-group">
                                    <label class="text-secondary">Tytuł</label>
                                    <commentForm:input path="auctionTitle" type="text" class="form-control" placeholder="Tytuł" disabled="true" required=""/>
                                </div>
                                <div class="form-group">
                                    <label class="text-secondary">Wiadomość</label>
                                    <commentForm:textarea path="description" type="text" rows="10"  class="form-control" placeholder="Wiadomość..." required=""/>
                                </div>
                                <div class="form-group">
                                    <commentForm:select path="type" class="form-control" id="type" required = "true">
                                        <commentForm:option value="Positiv">Pozytywny</commentForm:option>
                                        <commentForm:option value="Neutral">Neutralny</commentForm:option>
                                        <commentForm:option value="Negativ">Negatywny</commentForm:option>
                                    </commentForm:select>
                                </div>
                                <div class="form-group">
                                    <label class="text-secondary">Ocena</label>
                                    <commentForm:select path="rate" class="form-control" id="type" required = "true">
                                        <commentForm:option value="5"></commentForm:option>
                                        <commentForm:option value="4"></commentForm:option>
                                        <commentForm:option value="3"></commentForm:option>
                                        <commentForm:option value="2"></commentForm:option>
                                        <commentForm:option value="1"></commentForm:option>
                                    </commentForm:select>
                                </div>

                                <div class="loginButton text-center" style="margin-top: 40px;">
                                    <button type="submit" class="btn btn-block btn-lg text-center btn-warning text-white">Wyślij</button>
                                </div>

                        </commentForm:form>

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
