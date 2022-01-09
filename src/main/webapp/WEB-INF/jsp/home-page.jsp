<%@ page import="it.ternali.biblioteca.model.Libro" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home page</title>

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <link rel="icon" type="image/x-icon" href="../../image/favicon.ico">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="../../css/style.css">

    </head>

    <body>

    <!-- header section starts  -->

    <header class="header">

        <div class="header-1">

            <a href="#" class="logo"> <i class="fas fa-book"></i> Biblioteca </a>

            <form action="" class="search-form">
                <input type="search" name="" placeholder="Cerca qui..." id="search-box">
                <label for="search-box" class="fas fa-search"></label>
            </form>

            <div class="icons">
                <div id="search-btn" class="fas fa-search"></div>
                <div id="book-btn" class="fas fa-book"></div>
                <div id="login-btn" class="fas fa-user"></div>
            </div>

        </div>

        <div class="header-2">
            <nav class="navbar">
                <a href="#home">HOME</a>
                <c:choose>
                    <c:when test="${admin == true}">
                        <a href="/catalogo-libri/show/true">CATALOGO LIBRI</a>
                    </c:when>
                    <c:when test="${admin == null}">
                        <a href="/catalogo-libri/show/false">CATALOGO LIBRI</a>
                    </c:when>
                </c:choose>
                <c:if test="${admin == true}">
                    <a href="/admin/gestione/utenti">GESTIONE UTENTI</a>
                </c:if>
                <a href="/logout">LOGOUT</a>
            </nav>
        </div>

    </header>

    <!-- header section ends -->

    <!-- bottom navbar  -->

    <nav class="bottom-navbar">
        <a href="#home" class="fas fa-home"></a>
        <a href="#catalogo" class="fas fa-list"></a>
        <a href="#gestione-libri" class="fas fa-tags"></a>
        <a href="#gestione-catalogo" class="fas fa-comments"></a>
    </nav>

    <!-- login form  -->

    <div class="login-form-container" style="text-align: center">

        <div id="close-login-btn" class="fas fa-times"></div>

        <form action="">
            <h3>il tuo profilo</h3>
            <hr style="border-top: 3px solid #bbb">
            <p style="color: black; text-align: center">USERNAME: ${utente.username}</p>
            <p style="color: black; text-align: center">EMAIL: ${utente.email}</p><hr>
            <p style="color: black; text-align: center">DATA DI NASCITA: ${utente.dataDiNascita}</p><hr>
            <p style="color: green; text-align: center"><a href="/utente/modifica-form/${utente.id}">MODIFICA PROFILO</a></p>
            <hr style="border-top: 3px solid #bbb">
            <form action="/logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <a href="/logout" class="btn">Logout</a>
            </form>
        </form>

    </div>

    <!-- home section starts  -->

    <section class="home" id="home">

        <div class="row">

            <div class="content">
                <h3>I libri del momento!</h3>
                <p>Qui di fianco i 5 libri in tendenza!</p>
                <a href="#" class="btn">compra ora</a>
            </div>

            <div class="swiper books-slider">
                <div class="swiper-wrapper">
                    <c:forEach var="libro" items="${popularBooks}">
                        <a href="#" class="swiper-slide"><img SRC=${libro.image} alt=""></a>
                    </c:forEach>
                </div>
                <img src="../../image/stand.png" class="stand" alt="">
            </div>

        </div>

    </section>

    <section style="margin-top: 3rem;" class="featured" id="catalogo">

        <h1 class="heading"> <span>catalogo libri</span> </h1>

        <div class="swiper featured-slider">

            <div class="swiper-wrapper">
                <c:choose>
                    <c:when test="${admin == true}">
                        <c:forEach var="libro" items="${not_filtered}">
                            <div class="swiper-slide box">
                                <div class="icons">
                                    <a title="Modifica" href="/admin/gestione-catalogo/libro/modifica-libro-form/${libro.id}" class="fas fa-pen"></a>
                                    <a title="Elimina" href="/admin/gestione-catalogo/libro/delete/${libro.id}" class="fas fa-times"></a>
                                </div>
                                <div class="image">
                                    <img src=${libro.immagine} alt="">
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:when test="${admin == null}">
                        <c:forEach var="libro" items="${libridb}">
                            <div class="swiper-slide boxe">
                                <div class="image">
                                    <img src=${libro.immagine} alt="">
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                </c:choose>
            </div>

            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>

        </div>

    </section>

    <section class="footer">

        <div class="share">
            <a href="#" class="fab fa-facebook-f"></a>
            <a href="#" class="fab fa-twitter"></a>
            <a href="#" class="fab fa-instagram"></a>
            <a href="#" class="fab fa-linkedin"></a>
            <a href="#" class="fab fa-pinterest"></a>
        </div>

        <div class="credit"> creato da <span> Patrix </span> | tutti i diritti riservati! </div>

    </section>

    <!-- loader  -->
    <div class="loader-container">
        <img src="image/loader-img.gif" alt="">
    </div>

    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

    <!-- custom js file link  -->
    <script src="../../js/main.js"></script>

    </body>

</html>