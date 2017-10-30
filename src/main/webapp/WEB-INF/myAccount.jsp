<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/details/shopping.css">


    <title>ALLLEDROGO</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="py-5 bg-primary">
    <div class="container-fluid bg-primary p-4">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-3">
                <ul class="list-group">
                    <a class="list-group-item bg-warning text-white"><i class="fa fa-user-o"></i>&nbsp;&nbsp;Moje Konto </a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/myaccount/">Dane Logowania</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/">Dane Konta</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/">Komentarze</a>
                    <a class="list-group-item list-group-item-action text-secondary" href="/">Historia Konta</a>
                </ul>
            </div>
            <div class="col-md-7 border border-success bg-primary " style="padding-top: 25px">
                <div class="loginTitle text-center text-secondary p-4">
                    <h2> LOGIN </h2>
                </div>
                <div class="row" style="padding-bottom: 75px">
                    <div class="col-md-6">
                        <div class="input">
                            <input type="text" class="form-control" placeholder="Login"> </div>
                    </div>
                    <div class="col-md-3">
                        <div class="editButton px-4">
                            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="editButton px-4">
                            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Zapisz</button>
                        </div>
                    </div>
                </div>
                <div class="passwordTitle text-center text-secondary p-4">
                    <h2>HASLO</h2>
                </div>
                <div class="row" style="padding-bottom: 75px">
                    <div class="col-md-6">
                        <div class="input " style="padding-bottom: 25px">
                            <input type="text" class="form-control" placeholder="Obecne Haslo"> </div>
                        <div class="input" style="padding-bottom: 25px">
                            <input type="text" class="form-control" placeholder="Nowe Haslo"> </div>
                        <div class="input" style="padding-bottom: 25px">
                            <input type="text" class="form-control" placeholder="Powtorz Nowe Haslo"> </div>
                    </div>
                    <div class="col-md-6">
                        <div class="editButton p-4">
                            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
                        </div>
                        <div class="saveButton p-4">
                            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Zapisz</button>
                        </div>
                    </div>
                </div>
                <div class="emailTitle text-center text-secondary p-4">
                    <h2>EMAIL</h2>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="input" style="padding-bottom: 25px">
                            <input type="text" class="form-control" placeholder="Email"> </div>
                    </div>
                    <div class="col-md-6">
                        <div class="saveButton px-4" style="padding-bottom: 25px">
                            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Edytuj</button>
                        </div>
                    </div>
                </div>
                <div class="row" style="padding-bottom: 75px">
                    <div class="col-md-6">
                        <div class="input" style="padding-bottom: 25px">
                            <input type="text" class="form-control" placeholder="Potwierdz Email"> </div>
                    </div>
                    <div class="col-md-6">
                        <div class="saveButton px-4" style="padding-bottom: 25px">
                            <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Zapisz</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<script src="webjars/jquery/1.11.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
</body>
</html>
