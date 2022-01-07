<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Aggiungi libro</title>
    </head>

    <body>
        <div class="container">
            <div class="row g-5">
                <div class="col-md-7 col-lg-8">
                    <h4 class="my-3">Aggiungi libro</h4>
                    <form:form modelAttribute="libro_validator" action="/admin/gestione-catalogo/libro/aggiungi-libri" method="post" class="needs-validation" novalidate="">
                        <hr class="my-4">
                        <div class="row g-3">
                            <div class="col-6">
                                <label for="titolo" class="form-label">Titolo</label>
                                <div class="input-group has-validation">
                                    <form:input type="text" class="form-control" id="titolo" placeholder="Titolo" path="titolo" />
                                </div>
                            </div>
                            <div class="col-6">
                                <label for="autore" class="form-label">Autore</label>
                                <div class="input-group has-validation">
                                    <form:input type="text" class="form-control" id="autore" placeholder="Autore" path="autore" />
                                </div>
                            </div>
                            <div class="col-6">
                                <label for="genere" class="form-label">Genere</label>
                                <div class="input-group has-validation">
                                    <form:input type="text" class="form-control" id="genere" placeholder="Genere" path="genere" />
                                </div>
                            </div>
                            <div class="col-6">
                                <label for="anno" class="form-label">Anno pubblicazione</label>
                                <div class="input-group has-validation">
                                    <form:input type="number" class="form-control" id="anno" placeholder="Anno" path="anno" />
                                </div>
                            </div>


                            <div class="col-6">
                                <label for="stato" class="form-label">Stato</label>
                                <form:input class="form-control" list="datalistOptions" id="exampleDataList"
                                       placeholder="Scegli..." path="stato" />
                                <datalist id="datalistOptions">
                                    <option value="DISPONIBILE">
                                    <option value="NON DISPONIBILE">
                                </datalist>
                            </div>

                            <div class="col-6">
                                <label for="image" class="form-label">Immagine</label>
                                <div class="input-group has-validation">
                                    <form:input type="text" class="form-control" id="image" placeholder="Immagine" path="immagine" />
                                </div>
                            </div>

                            <div class="mt-5">
                                <button type="submit" class="btn btn-outline-info">Salva</button>
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