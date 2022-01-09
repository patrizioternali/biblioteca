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

        <title>Catalogo Libri</title>
    </head>
    <body>
    <header>
        <p style="text-align: center"><button type="button" class="btn btn-warning" onclick="location.href='/homepage'">Homepage</button></p>
    </header>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <!-- Team Member 1 -->
            <c:choose>
                <c:when test="${admin == null}">
                    <c:forEach var="libro" items="${catalogo}">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-0 shadow">
                                <img src='${libro.immagine}' class="card-img-top" alt="...">
                                <div class="card-body text-center">
                                    <h5 class="card-title mb-0">${libro.titolo}</h5>
                                    <div class="card-text text-black-50"><span style="color: #080710">Autore:</span> ${libro.autore}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Anno di uscita:</span> ${libro.anno}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Genere:</span> ${libro.genere}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Stato:</span> <c:choose>
                                        <c:when test="${libro.stato == 'DISPONIBILE'}">
                                            <span style="color: #4CAF50">${libro.stato}</span>
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
                <c:when test="${admin == true}">
                    <c:forEach var="libro" items="${catalogo_admin}">
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-0 shadow">
                                <img src='${libro.immagine}' class="card-img-top" alt="...">
                                <div class="card-body text-center">
                                    <h5 class="card-title mb-0">${libro.titolo}</h5>
                                    <div class="card-text text-black-50"><span style="color: #080710">Autore:</span> ${libro.autore}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Anno di uscita:</span> ${libro.anno}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Genere:</span> ${libro.genere}</div>
                                    <div class="card-text text-black-50"><span style="color: #080710">Stato:</span> <c:choose>
                                        <c:when test="${libro.stato == 'DISPONIBILE'}">
                                            <span style="color: #4CAF50">${libro.stato}</span>
                                        </c:when>
                                        <c:when test="${libro.stato == 'NON DISPONIBILE'}">
                                            <span style="color: red">${libro.stato}</span>
                                        </c:when>
                                    </c:choose></div>
                                    <div class="card-text text-black-50">
                                        <button type="button" class="btn btn-primary" onclick="location.href='/admin/gestione-catalogo/libro/modifica-libro-form/${libro.id}'">Modifica</button>
                                        <button type="button" class="btn btn-danger" onclick="location.href='/admin/gestione-catalogo/libro/delete/${libro.id}'">Elimina</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>

                <!-- INSERIRE LISTA FILTRATA PER ETA SUPERIORE AI 45!
                ATTENZIONE! INSERIRE NEL PRIMO C:WHEN!
                -->

            </c:choose><%--
            <!-- Team Member 2 -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-0 shadow">
                    <img src="https://source.unsplash.com/9UVmlIb0wJU/500x350" class="card-img-top" alt="...">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-0">Team Member</h5>
                        <div class="card-text text-black-50">Web Developer</div>
                    </div>
                </div>
            </div>
            <!-- Team Member 3 -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-0 shadow">
                    <img src="https://source.unsplash.com/sNut2MqSmds/500x350" class="card-img-top" alt="...">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-0">Team Member</h5>
                        <div class="card-text text-black-50">Web Developer</div>
                    </div>
                </div>
            </div>
            <!-- Team Member 4 -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card border-0 shadow">
                    <img src="https://source.unsplash.com/7u5mwbu7qLg/500x350" class="card-img-top" alt="...">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-0">Team Member</h5>
                        <div class="card-text text-black-50">Web Developer</div>
                    </div>
                </div>
            </div>--%>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
    <%--<c:forEach var="libro" items="${catalogo}">
        <div class="row">
            <div class="card" style="width: 18rem;">
                <img src="${libro.immagine}" class="card-img-top" alt="...">
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
            </div>
        </div>
    </c:forEach>--%>
    <<%--button type="button" class="btn btn-warning" onclick="location.href='/homepage'">Homepage</button>
    <c:if test="${admin == true}">
        <button type="button" class="btn btn-warning" onclick="location.href='/admin/gestione-catalogo/libro/form-aggiungi-libro'">Aggiungi Libro</button>
        <button type="button" class="btn btn-warning" onclick="location.href='/admin/gestione-catalogo/genere/lista-generi'">Lista Generi</button>
    </c:if>
    <table class="table container">
        <thead>
        <tr>
            <c:if test="${admin==true}">
                <th scope="col">ID</th>
            </c:if>
            <th scope="col">Titolo</th>
            <th scope="col">Autore</th>
            <th scope="col">Genere</th>
            <th scope="col">Anno</th>
            <th scope="col">Stato</th>
            <c:if test="${admin == true}">
                <th scope="col">Immagine</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${admin == true}">
                    <c:forEach var="libro" items="${catalogo_admin}">
                        <tr>
                            <th scope="row">${libro.id}</th>
                            <td>${libro.titolo}</td>
                            <td>${libro.autore}</td>
                            <td>${libro.genere}</td>
                            <td>${libro.anno}</td>
                            <td>${libro.stato}</td>
                            <td>${libro.immagine}</td>
                            <c:if test="${admin == true}">
                                <td><button type="button" class="btn btn-primary" onclick="location.href='/admin/gestione-catalogo/libro/modifica-libro-form/${libro.id}'">Modifica</button></td>
                                <td><button type="button" class="btn btn-danger" onclick="location.href='/admin/gestione-catalogo/libro/delete/${libro.id}'">Elimina</button></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:when test="${admin == null}">
                    <c:choose>
                        <c:when test="${year_true == true}">
                            <c:forEach var="libro" items="${libri_filtrati}">
                                <tr>
                                    <td>${libro.titolo}</td>
                                    <td>${libro.autore}</td>
                                    <td>${libro.genere}</td>
                                    <td>${libro.anno}</td>
                                    <td>${libro.stato}</td>
                                    <c:if test="${admin == true}">
                                        <td><button type="button" class="btn btn-primary" onclick="location.href='/admin/gestione-catalogo/libro/modifica-libro-form/${libro.id}'">Modifica</button></td>
                                        <td><button type="button" class="btn btn-danger" onclick="location.href='/admin/gestione-catalogo/libro/delete/${libro.id}'">Elimina</button></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="libro" items="${catalogo}">
                                <tr>
                                    <td>${libro.titolo}</td>
                                    <td>${libro.autore}</td>
                                    <td>${libro.genere}</td>
                                    <td>${libro.anno}</td>
                                    <td>${libro.stato}</td>
                                    <c:if test="${admin == true}">
                                        <td><button type="button" class="btn btn-primary" onclick="location.href='/admin/gestione-catalogo/libro/modifica-libro-form/${libro.id}'">Modifica</button></td>
                                        <td><button type="button" class="btn btn-danger" onclick="location.href='/admin/gestione-catalogo/libro/delete/${libro.id}'">Elimina</button></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </c:when>
            </c:choose>

        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>--%>
    </body>

</html>