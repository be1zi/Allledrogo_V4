<%--
  Created by IntelliJ IDEA.
  User: ${USER}
  Date: ${DATE}
  Time: ${TIME}
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/CSS/main.css">
    <link rel="stylesheet" href="../resources/CSS/home/gallery.css">

    <title>ALLLEDROGO</title>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


<div class="p-5 text-center text-white">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="mb-4 text-secondary">Tytuł Aukcji</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div id="carouselArchitecture" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselArchitecture" data-slide-to="0" class="text-secondary bg-secondary"><i></i></li>
                        <li data-target="#carouselArchitecture" data-slide-to="1" class="text-secondary bg-secondary"><i></i></li>
                        <li data-target="#carouselArchitecture" data-slide-to="2" class="text-secondary bg-secondary"><i></i></li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="carousel-item active">
                            <img class="d-block img-fluid" src="https://pingendo.github.io/templates/sections/assets/gallery_architecture_1.jpg" data-holder-rendered="true"> </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="https://pingendo.github.io/templates/sections/assets/gallery_architecture_2.jpg" data-holder-rendered="true"> </div>
                        <div class="carousel-item">
                            <img class="d-block img-fluid" src="https://pingendo.github.io/templates/sections/assets/gallery_architecture_3.jpg" data-holder-rendered="true"> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="">
    <div class="container">
        <div class="row">
            <div class="col-md-6"> Test test test </div>
            <div class="col-md-6">
                <div class="buyNow">
                    <div class="row p-3">
                        <div class="col-md-4 text-center"> <label class="text-secondary">1099.99</label> </div>
                        <div class="col-md-3 text-center">
                            <input type="number" class="form-control" placeholder="Ilość cztuk" required="" min="1"> </div>
                        <div class="col-md-3 text-center">
                            <button type="button" class="btn btn-warning p-2 text-white text-center btn-block">Kup Teraz</button>
                        </div>
                    </div>
                </div>
                <div class="payInfo">
                    <div class="row p-3">
                        <div class="col-md-4">
                            <input type="number" class="form-control" placeholder="Cena" required="" min="1000"> </div>
                        <div class="col-md-3 text-center">
                            <input type="number" class="form-control" placeholder="Ilość sztuk" required="" min="1"> </div>
                        <div class="col-md-3 text-center">
                            <button type="button" class="btn btn-warning p-2 text-white text-center btn-block">Licytuj</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="py-5">
    <div class="container bg-primary">
        <div class="row">
            <div class="col-md-12">
                <table class="table">
                    <thead class="bg-warning text-white">
                    <tr>
                        <th>#</th>
                        <th>Login</th>
                        <th>Cena</th>
                        <th>Data</th>
                    </tr>
                    </thead>
                    <tbody class="bg-primary text-secondary">
                    <tr>
                        <td>1</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>Otto</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>Otto</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>Otto</td>
                    </tr>
                    </tbody>
                </table>
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
