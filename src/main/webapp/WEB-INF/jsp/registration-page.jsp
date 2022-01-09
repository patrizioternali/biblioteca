<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Registrazione</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="icon" type="image/x-icon" href="../../image/favicon-login.ico">
    </head>
    <body>
        <div class="container">
            <form:form method="post" action="/register" modelAttribute="utente_register">
                <h2 class="form-signin-heading">Registrati</h2>
                <c:if test="${reg_error == true}">
                    <h6>Errore, dati non validi.</h6>
                </c:if>
                <c:if test="${already_exist == true}">
                    <h6>Utente gia' registrato</h6>
                </c:if>
                <p>
                    <label for="username" class="sr-only">Username</label>
                    <form:input type="text" id="username" name="username" class="form-control" placeholder="Username" path="username" />
                </p>
                <p>
                    <label for="email" class="sr-only">Email</label>
                    <form:input type="email" id="email" name="email" class="form-control" placeholder="Email" path="email" />
                </p>
                <p>
                    <label for="password" class="sr-only">Password</label>
                    <form:input type="password" id="password" name="password" class="form-control" placeholder="Password" path="password" />
                </p>
                <p>
                    <label for="date" class="sr-only">Data di nascita</label>
                    <form:input type="date" id="date" name="date" class="form-control" placeholder="Data di nascita" path="dataDiNascita" />
                </p>
                <p>
                    <a href="/login">Login</a>
                </p>
                <input type="hidden" value="${_csrf.token}">
                <button class="btn btn-lg btn-primary btn-block" type="submit">Registrati</button>
            </form:form>
        </div>
    </body>
</html>