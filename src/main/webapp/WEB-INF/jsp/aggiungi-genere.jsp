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

        <link rel="icon" type="image/x-icon" href="../../image/favicon_catalogo.ico">

        <title>Aggiungi genere</title>
    </head>

    <body>
    <div class="container">
        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="my-3">Aggiungi genere</h4>
                <form:form class="needs-validation" novalidate="" modelAttribute="genere_validator" action="/admin/gestione-catalogo/genere/aggiungi-genere" method="post">
                    <hr class="my-4">
                    <div class="row g-3">
                        <div class="col-5">
                            <label for="genere" class="form-label">Genere</label>
                            <div class="input-group has-validation">
                                <form:input type="text" class="form-control" id="genere" placeholder="Genere" path="nome_genere" />
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
<%--
<html>
    <head>
        <title>Aggiungi genere</title>
    </head>
    <body>
        <h1>Aggiungi un genere</h1>
        <form:form modelAttribute="genere_validator" action="/admin/gestione-catalogo/genere/aggiungi-genere" method="post">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="username">Nome genere</label>
                    <form:input type="text" class="form-control" id="username" placeholder="Username" path="nome_genere" />
                </div>
            <button type="submit" class="btn btn-primary">Aggiungi genere</button>
        </form:form>
    </body>
</html>--%>
