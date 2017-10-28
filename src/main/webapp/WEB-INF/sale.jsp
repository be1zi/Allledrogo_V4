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
                    <li class="list-group-item bg-warning text-white"><i class="fa fa-fw fa-shopping-basket"></i>&nbsp;&nbsp;Zakupy </li>
                    <li class="list-group-item list-group-item-action text-secondary">Wystaw</li>
                    <li class="list-group-item list-group-item-action text-secondary">Sprzedaje</li>
                    <li class="list-group-item list-group-item-action text-secondary">Sprzedane</li>
                    <li class="list-group-item list-group-item-action text-secondary">Niesprzedane</li>
                </ul>
            </div>
            <div class="col-md-7">

                <div class="singleAuction" style="border: solid red; border-radius: 30px; border: 5px solid;">
                    <div class="text-white bg-primary py-2">
                        <div class="container">
                            <div class="row">
                                <div class="align-self-center p-5 col-md-6">
                                    <h3 class="auctionItem text-left text-secondary p-2">Sprzedajacy: Testowy </h3>
                                    <h5 class="auctionItem text-left text-secondary p-2">Data zakupu: 13.10.2017 13:45:27</h5>
                                    <h5 class="auctionItem text-left text-secondary p-2">Ilosc sztuk: 1</h5>
                                    <h5 class="auctionItem text-left text-secondary p-2">Cena: 35.99</h5>
                                    <div class="payInfo">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h5 class="auctionItem text-secondary text-left p-2">Status zaplaty: zaplacono</h5>
                                            </div>
                                            <div class="col-md-4">
                                                <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Zaplać</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="auctionDetails">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h5 class="auctionItem text-secondary text-left p-2">Szczegóły</h5>
                                            </div>
                                            <dic class="col-md-4">
                                                <button type="button" class="btn btn-warning btn-block text-center p-2 text-white">Wyswietl</button>
                                            </dic>
                                        </div>
                                    </div>
                                    <div class="auctionDetails">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h5 class="auctionItem text-secondary text-left p-2">Ocena: brak</h5>
                                            </div>
                                            <dic class="col-md-4">
                                                <button type="button" class="btn btn-warning btn-block p-2 text-white text-center">Wystaw</button>
                                            </dic>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 p-0">
                                    <div id="carousel1" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner" role="listbox">
                                            <div class="carousel-item active">
                                                <img class="d-block img-fluid w-100" src="https://pingendo.github.io/templates/sections/assets/gallery_restaurant_1.jpg" atl="first slide">
                                                <div class="carousel-caption">
                                                    <h3 class="text-secondary bg-primary p-2">Tytul Aukcji</h3>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <img src="https://pingendo.github.io/templates/sections/assets/gallery_restaurant_2.jpg" class="d-block img-fluid w-100" data-holder-rendered="true">
                                                <div class="carousel-caption">
                                                    <h3 class="text-secondary bg-primary p-2">Tytul Aukcji</h3>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <img class="d-block img-fluid w-100" src="https://pingendo.github.io/templates/sections/assets/gallery_restaurant_3.jpg" data-holder-rendered="true">
                                                <div class="carousel-caption">
                                                    <h3 class="text-secondary bg-primary p-2">Tytul Aukcji</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carousel1" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>
                                        <a class="carousel-control-next" href="#carousel1" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
                                    </div>
                                </div>
                            </div>
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
