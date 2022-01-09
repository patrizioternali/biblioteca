<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Modifica utente</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="icon" type="image/x-icon" href="../../image/modify-page.ico">
    </head>
    <body>
    <div class="container">
        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="my-3">Modifica il tuo profilo</h4>
                <form:form modelAttribute="utente_modify" action="/utente/conferma-modifica/${utente.id}" method="post">
                <hr class="my-4">
                <div class="row g-3">
                    <div class="col-5">
                        <label for="username" class="form-label">Modifica username:</label>
                        <div class="input-group has-validation">
                            <form:input type="text" id="username" name="username" value="${utente.username}" class="form-control" path="username" />
                        </div>
                    </div>

                    <div class="col-7">
                        <label for="email" class="form-label">Modifica email:</label>
                        <form:input type="email" id="email" name="email" value="${utente.email}" class="form-control" path="email" />
                    </div>



                    <div class="col-7">
                        <label for="data" class="form-label">Modifica data di nascita:</label>
                        <div class="input-group has-validation">
                            <form:input type="date" id="data" name="data" value="${utente.dataDiNascita}" class="form-control" path="dataDiNascita" />
                        </div>
                    </div>


                    <div class="mt-5">
                        <button type="submit" class="btn btn-outline-info">Conferma modifica</button>
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