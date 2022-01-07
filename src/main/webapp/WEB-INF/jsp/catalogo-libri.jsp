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
    <button type="button" class="btn btn-warning" onclick="location.href='/homepage'">Homepage</button>
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
    </script>
    </body>

</html>