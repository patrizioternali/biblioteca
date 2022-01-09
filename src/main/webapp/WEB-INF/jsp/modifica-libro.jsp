<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Modifica Libro</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
    <div class="container">
        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="my-3">Modifica libro: ${libro.titolo}</h4>
                <form:form modelAttribute="libro_validator" action="/admin/gestione-catalogo/libro/conferma-modifica/${libro.id}" method="post">
                <hr class="my-4">
                <div class="row g-3">
                    <div class="col-6">
                        <label for="titolo" class="form-label">Modifica titolo:</label>
                        <div class="input-group has-validation">
                            <form:input type="text" id="titolo" name="titolo" value="${libro.titolo}" class="form-control" path="titolo" />
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="autore" class="form-label">Modifica autore:</label>
                        <div class="input-group has-validation">
                            <form:input type="text" id="autore" name="autore" value="${libro.autore}" class="form-control" path="autore" />
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="genere" class="form-label">Modifica genere:</label>
                        <div class="input-group has-validation">
                            <form:input type="text" id="genere" name="genere" value="${libro.genere}" class="form-control" path="genere" />
                        </div>
                    </div>
                    <div class="col-6">
                        <label for="anno" class="form-label">Modifica anno:</label>
                        <div class="input-group has-validation">
                            <form:input type="text" id="anno" name="anno" value="${libro.anno}" class="form-control" path="anno" />
                        </div>
                    </div>


                    <div class="col-6">
                        <label for="stato" class="form-label">Modifica stato:</label>
                        <form:input class="form-control" list="datalistOptions" id="exampleDataList"
                                    placeholder="Scegli..." path="stato" />
                        <datalist id="datalistOptions">
                            <option value="DISPONIBILE">
                            <option value="NON DISPONIBILE">
                        </datalist>
                    </div>

                    <div class="col-6">
                        <label for="image" class="form-label">Modifica immagine:</label>
                        <div class="input-group has-validation">
                            <form:input type="text" id="image" name="image" value="${libro.immagine}" class="form-control" path="immagine" />
                        </div>
                    </div>

                    <div class="mt-5">
                        <button type="submit" class="btn btn-outline-info">Modifica</button>
                    </div>


                    </form:form>
                </div>
            </div>

            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="my-3 fixed-bottom">© 2021–2022 By Patrix</p>
            </footer>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
        </script>
    </body>
</html>