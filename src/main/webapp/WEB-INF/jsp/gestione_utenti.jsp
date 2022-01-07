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

        <title>Gestione utenti</title>
    </head>

    <body>
    <button type="button" class="btn btn-warning" onclick="location.href='/homepage'">Homepage</button>
    <button type="button" class="btn btn-warning" onclick="location.href='/admin/gestione/utenti/form-aggiungi-utente'">Aggiungi Utente</button>
    <table class="table container">
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
                <td><button type="button" class="btn btn-primary" onclick="location.href='/admin/gestione/utenti/modifica/${utente.id}'">Modifica</button></td>
                <td><button type="button" class="btn btn-danger" onclick="location.href='/admin/gestione/utenti/delete/${utente.id}'">Elimina</button></td>
                <c:set var="count" value="${count + 1}" scope="page"/>
            </tr>
        </c:forEach>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    </body>

</html>