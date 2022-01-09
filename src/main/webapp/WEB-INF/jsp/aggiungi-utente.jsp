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

        <link rel="icon" type="image/x-icon" href="../../image/gestione-utenti.ico">

        <title>Aggiungi utente</title>
    </head>

    <body>
    <div class="container">
        <div class="row g-5">
            <div class="col-md-7 col-lg-8">
                <h4 class="my-3">Aggiungi utente</h4>
                <form:form class="needs-validation" novalidate="" modelAttribute="add_user_validator" action="/admin/gestione/utenti/aggiungi-utente" method="post">
                    <hr class="my-4">
                    <div class="row g-3">
                        <div class="col-5">
                            <label for="username" class="form-label">Username</label>
                            <div class="input-group has-validation">
                                <form:input type="text" class="form-control" id="username" placeholder="Username" path="username" />
                            </div>
                        </div>

                        <div class="col-7">
                            <label for="email" class="form-label">Email</label>
                            <form:input type="email" class="form-control" id="email" placeholder="nome@esempio.com" path="email" />
                        </div>

                        <div class="col-5">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group has-validation">
                                <form:input type="password" class="form-control" id="password" placeholder="Password" path="password" />
                            </div>
                        </div>


                        <div class="col-7">
                            <label for="data" class="form-label">Data di nascita</label>
                            <div class="input-group has-validation">
                                <form:input type="date" id="data" class="form-control" path="dataDiNascita" />
                            </div>
                        </div>

                        <div class="col-5">
                            <label for="ruolo" class="form-label">Ruolo</label>
                            <form:input class="form-control" list="datalistOptions" id="exampleDataList"
                                   placeholder="Scegli..." path="ruolo" />
                            <datalist id="datalistOptions">
                                <option value="ADMIN">
                                <option value="USER">
                            </datalist>
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