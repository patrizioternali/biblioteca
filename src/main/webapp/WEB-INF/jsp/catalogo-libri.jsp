<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <link rel="icon" type="image/x-icon" href="../../image/favicon_catalogo.ico">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="../../css/style.css">

        <title>Catalogo Libri</title>
    </head>
    <body>
    <header class="header">

        <div class="header-1">

            <a href="#" class="logo" style="text-decoration:none;"> <i class="fas fa-book"></i> Biblioteca </a>

            <%--<form action="" class="search-form">
                <input type="search" name="" placeholder="Cerca qui..." id="search-box">
                <label for="search-box" class="fas fa-search"></label>
            </form>--%>

            <div class="icons">
                <%--<div id="search-btn" class="fas fa-search"></div>--%>
                <div id="login-btn" class="fas fa-user"></div>
            </div>

        </div>

        <div class="header-2">
            <nav class="navbar justify-content-center">
                <a href="#home" onclick="location.href='/homepage'" style="text-decoration:none;">HOME</a>
                <c:if test="${admin == true}">
                    <a href="/admin/gestione/utenti" style="text-decoration:none;">GESTIONE UTENTI</a>
                    <a href="/admin/gestione-catalogo/genere/lista-generi" style="text-decoration: none;">LISTA GENERI</a>
                </c:if>
                <c:if test="${admin == true}">
                    <a href="/admin/gestione-catalogo/libro/form-aggiungi-libro" onclick="location.href='/admin/gestione-catalogo/libro/form-aggiungi-libro'" style="text-decoration:none;">AGGIUNGI LIBRO</a>
                </c:if>
                <a href="/logout" style="text-decoration:none;">LOGOUT</a>
            </nav>
        </div>
    </header>
    <!-- bottom navbar  -->

    <nav class="bottom-navbar">
        <a href="#home" class="fas fa-home"></a>
        <a href="#catalogo" class="fas fa-list"></a>
        <a href="#gestione-libri" class="fas fa-tags"></a>
        <a href="#gestione-catalogo" class="fas fa-comments"></a>
    </nav>

    <div class="login-form-container" style="text-align: center">

        <div id="close-login-btn" class="fas fa-times"></div>

        <form action="">
            <h3>il tuo profilo</h3>
            <hr style="border-top: 3px solid #bbb">
            <p style="color: black; text-align: center">USERNAME: ${utente.username}</p>
            <p style="color: black; text-align: center">EMAIL: ${utente.email}</p>
            <p style="color: black; text-align: center">DATA DI NASCITA: ${utente.dataDiNascita}</p>
            <p style="color: green; text-align: center"><a href="/utente/modifica-form/${utente.id}">MODIFICA PROFILO</a></p>
            <hr style="border-top: 3px solid #bbb">
            <form action="/logout" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <a href="/logout" class="btn">Logout</a>
            </form>
        </form>

    </div>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <!-- Team Member 1 -->
            <c:choose>
                <c:when test="${admin == null}">
                    <c:choose>
                        <c:when test="${year_true == true}">
                            <c:forEach var="libro" items="${libri_filtrati}">
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-0 shadow" >
                                        <img src='${libro.immagine}' class="card-img-top" alt="...">
                                        <div class="card-body text-center">
                                            <h5 class="card-title mb-0">${libro.titolo}</h5>
                                            <div class="card-text text-black-50"><span style="color: #080710">Autore</span> ${libro.autore}</div>
                                            <div class="card-text text-black-50"><span style="color: #080710">Anno di uscita:</span> ${libro.anno}</div>
                                            <div class="card-text text-black-50"><span style="color: #080710">Genere:</span> ${libro.genere}</div>
                                            <div class="card-text text-black-50"><span style="color: #080710">Stato:</span> <c:choose>
                                                <c:when test="${libro.stato == 'DISPONIBILE'}">
                                                    <span style="color: green">${libro.stato}</span>
                                                </c:when>
                                                <c:when test="${libro.stato == 'NON DISPONIBILE'}">
                                                    <span style="color: red">${libro.stato}</span>
                                                </c:when>
                                            </c:choose></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="libro" items="${catalogo}">
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-0 shadow">
                                        <img src='${libro.immagine}' class="card-img-top" alt="...">
                                        <div class="card-body text-center">
                                            <h6 class="card-title mb-0">${libro.titolo}</h6>
                                            <div class="card-text text-black-50"><span style="color: #080710">Autore:</span> ${libro.autore}</div>
                                            <div class="card-text text-black-50"><span style="color: #080710">Anno di uscita:</span> ${libro.anno}</div>
                                            <div class="card-text text-black-50"><span style="color: #080710">Genere:</span> ${libro.genere}</div>
                                            <div class="card-text text-black-50"><span style="color: #080710">Stato:</span> <c:choose>
                                                <c:when test="${libro.stato == 'DISPONIBILE'}">
                                                    <span style="color: green">${libro.stato}</span>
                                                </c:when>
                                                <c:when test="${libro.stato == 'NON DISPONIBILE'}">
                                                    <span style="color: red">${libro.stato}</span>
                                                </c:when>
                                            </c:choose></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:when test="${admin == true}">
                    <c:forEach var="libro" items="${catalogo_admin}">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-0 shadow">
                                <img src='${libro.immagine}' class="card-img-top" alt="...">
                                <div class="card-body text-center">
                                    <h6 class="card-title mb-0">${libro.titolo}</h6>
                                    <div class="card-text text-black-50"><span style="color: #080710">Autore:</span> ${libro.autore}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Anno di uscita:</span> ${libro.anno}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Genere:</span> ${libro.genere}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Stato:</span><c:choose>
                                        <c:when test="${libro.stato == 'DISPONIBILE'}">
                                            <span style="color: green">${libro.stato}</span>
                                        </c:when>
                                        <c:when test="${libro.stato == 'NON DISPONIBILE'}">
                                            <span style="color: red">${libro.stato}</span>
                                        </c:when>
                                    </c:choose></div>
                                    <div class="card-text text-black-50">
                                        <button type="button" class="btn btn-success" onclick="location.href='/admin/gestione-catalogo/libro/modifica-libro-form/${libro.id}'">Modifica</button>
                                        <button type="button" class="btn btn-success" onclick="location.href='/admin/gestione-catalogo/libro/delete/${libro.id}'">Elimina</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
    </div>
    <!-- custom js file link  -->
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <script src="../../js/main.js"></script>
    </body>

</html>