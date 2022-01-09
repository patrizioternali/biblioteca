<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="icon" type="image/x-icon" href="../../image/gestione-utenti.ico">

        <title>Gestione utenti</title>

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="../../css/style.css">
    </head>

    <body>
    <!-- header section starts  -->

    <header class="header">

        <div class="header-1">

            <a href="#" class="logo" style="text-decoration:none;"> <i class="fas fa-book"></i> Biblioteca </a>

            <form action="" class="search-form">
                <input type="search" name="" placeholder="Cerca qui..." id="search-box">
                <label for="search-box" class="fas fa-search"></label>
            </form>

            <div class="icons">
                <div id="search-btn" class="fas fa-search"></div>
                <div id="login-btn" class="fas fa-user"></div>
            </div>

        </div>

        <div class="header-2">
            <nav class="navbar justify-content-center">
                <a href="#home" onclick="location.href='/homepage'" style="text-decoration:none;">HOME</a>
                <c:choose>
                    <c:when test="${admin == true}">
                        <a href="/catalogo-libri/show/true" style="text-decoration:none;">CATALOGO</a>
                    </c:when>
                    <c:when test="${admin == null}">
                        <a href="/catalogo-libri/show/false" style="text-decoration:none;">CATALOGO</a>
                    </c:when>
                </c:choose>
                <c:if test="${admin == true}">
                    <a href="/admin/gestione/utenti/form-aggiungi-utente" onclick="location.href='/admin/gestione/utenti/form-aggiungi-utente'" style="text-decoration:none;">AGGIUNGI UTENTE</a>
                </c:if>
                <a href="/logout" style="text-decoration:none;">LOGOUT</a>
            </nav>
        </div>
    </header>
    <!-- header section ends -->

    <!-- bottom navbar  -->

    <nav class="bottom-navbar">
        <a href="#home" class="fas fa-home" onclick="location.href='/homepage'"></a>
        <a href="#catalogo" class="fas fa-list"></a>
        <a href="#gestione-libri" class="fas fa-tags"></a>
        <a href="#gestione-catalogo" class="fas fa-comments"></a>
    </nav>

    <!-- login form  -->

    <div class="login-form-container">
        <div id="close-login-btn" class="fas fa-times"></div>
        <form action="">
            <h3>Profilo</h3>
            <div style="text-align: center;">
                <form action="/logout" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <a href="/logout" class="btn">Logout</a>
                </form>
            </div>
        </form>
    </div>


    <table class="table container exm">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Username</th>
            <th scope="col">Password</th>
            <th scope="col">Email</th>
            <th scope="col">Ruolo</th>
            <th scope="col">Data di nascita</th>
        </tr>
        </thead>
        <tbody>
        <c:set var="count" value="0" scope="page" />
        <c:forEach var="utente" items="${lista_utenti}">
        <tr>
            <th scope="row">${utente.id}</th>
            <td>${utente.username}</td>
            <td>${utente.password}</td>
            <td>${utente.email}</td>
            <td>${utente.ruolo}</td>
            <td>${utente.dataDiNascita}</td>
            <td><button type="button" class="bottone btn-primary" onclick="location.href='/admin/gestione/utenti/modifica/${utente.id}'">Modifica</button></td>
            <td><button type="button" class="bottone btn-danger" onclick="location.href='/admin/gestione/utenti/delete/${utente.id}'">Elimina</button></td>
            <c:set var="count" value="${count + 1}" scope="page"/>
        </tr>
        </c:forEach>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>

    <!-- custom js file link  -->
    <script src="../../js/main.js"></script>
    </body>

</html>

