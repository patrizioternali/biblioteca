<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Login</title>
        <link rel="icon" type="image/x-icon" href="../../image/favicon-login-2.ico">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <form class="form-signin" method="post" action="/login">
                <c:if test="${login_error == true}">
                    <h6 style="color: red">Errore, i dati inseriti non sono corretti.</h6>
                </c:if>

                <!-- RISOLVERE ERRORE QUANDO SI SBAGLIANO LE CREDENZIALI. -->

                <h2 class="form-signin-heading">Accedi</h2>
                <p>
                    <label for="username" class="sr-only">Username</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                </p>
                <p>
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                </p>
                <p>
                    <a href="/registercheck">Registrati</a>
                </p>
                <input name="_csrf" type="hidden" value="${_csrf.token}">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
                <%--b069403a-8787-4e9a-a25b-9551c7cb1ffe--%>
            </form>
        </div>
    </body>
</html>
