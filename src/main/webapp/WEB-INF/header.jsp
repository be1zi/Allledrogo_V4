<link rel="stylesheet" href="../resources/CSS/header.css">

<div class="container-fluid" style="border: solid greenyellow">
    <nav class="navbar" style="border: solid red">
        <div class="navbar-brand" style="border: solid saddlebrown">
                <span class="navbar-logo" style="border: solid violet">
                  <a href="/home"><img src="../resources/images/logo.png" alt="ALLLEDROGO" title="" media-simple="true" style="height: 4.2rem;"></a>
                 </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-secondary display-4" href="/home">
                    ALLLEDROGO</a>
                </span>
        </div>

            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Szukaj">
                </div>
                <button type="submit" class="btn btn-primary">Szukaj</button>
            </form>


            <ul class="nav navbar-nav navbar-right">
                <%--<li><a href="/register"><span class="glyphicon glyphicon-user"></span>  Zarejestruj  </a></li>--%>
                <%--<li><a href="/login"><span class="glyphicon glyphicon-log-in"></span>  Zaloguj  </a></li>--%>
                <%--<li></li>--%>
                <%--<li>--%>
                        <%--<a class="btn btn-sm btn-primary display-4" href="/register"><span class="headerButton"></span>Zarejestruj</a>--%>
                <%--</li>--%>
                <%--<li> <div class="navbar-buttons mbr-section-btn">--%>
                    <%--<a class="btn btn-sm btn-primary display-4" href="/login"><span class="headerButton"></span>--%>
                    <%--Zaloguj</a>--%>
                <%--</div>--%>
                <%--</li>--%>

                    <a href="/register"><button type="button" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-user"></span>Zarejestruj</button></a>
                    <a href="/login"><button type="button" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-log-in"></span> Zaloguj </button></a>
            </ul>

    </nav>
</div>
