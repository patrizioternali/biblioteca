<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="it">
    <head>
        <!-- Design by foolishdeveloper.com -->
        <title>Glassmorphism login Form Tutorial in html css</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
        <!--Stylesheet-->
        <style media="screen">
            *,
            *:before,
            *:after{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            body{
                background-color: #080710;
            }
            .background{
                width: 430px;
                height: 520px;
                position: absolute;
                transform: translate(-50%,-50%);
                left: 50%;
                top: 50%;
            }
            .background .shape{
                height: 200px;
                width: 200px;
                position: absolute;
                border-radius: 50%;
            }
            .shape:first-child{
                background: linear-gradient(
                        #1845ad,
                        #23a2f6
                );
                left: -80px;
                top: -80px;
            }
            .shape:last-child{
                background: linear-gradient(
                        to right,
                        #ff512f,
                        #f09819
                );
                right: -30px;
                bottom: -80px;
            }
            form{
                height: 660px;
                width: 400px;
                background-color: rgba(255,255,255,0.13);
                position: absolute;
                transform: translate(-50%,-50%);
                top: 50%;
                left: 50%;
                border-radius: 10px;
                backdrop-filter: blur(10px);
                border: 2px solid rgba(255,255,255,0.1);
                box-shadow: 0 0 40px rgba(8,7,16,0.6);
                padding: 50px 35px;
            }
            form *{
                font-family: 'Poppins',sans-serif;
                color: #ffffff;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }
            form h3{
                font-size: 32px;
                font-weight: 500;
                line-height: 42px;
                text-align: center;
            }

            label{
                display: block;
                margin-top: 30px;
                font-size: 16px;
                font-weight: 500;
            }
            input{
                display: block;
                height: 50px;
                width: 100%;
                background-color: rgba(255,255,255,0.07);
                border-radius: 3px;
                padding: 0 10px;
                margin-top: 8px;
                font-size: 14px;
                font-weight: 300;
            }
            ::placeholder{
                color: #e5e5e5;
            }
            button{
                margin-top: 50px;
                width: 100%;
                background-color: #ffffff;
                color: #080710;
                padding: 15px 0;
                font-size: 18px;
                font-weight: 600;
                border-radius: 5px;
                cursor: pointer;
            }
            .social{
                margin-top: 30px;
                display: flex;
            }
            .social div{
                background: red;
                width: 200px;
                border-radius: 3px;
                padding: 5px 10px 10px 5px;
                background-color: rgba(255,255,255,0.27);
                color: #eaf0fb;
                text-align: center;
            }
            .social div:hover{
                background-color: rgba(255,255,255,0.47);
            }
            .social i{
                margin-right: 4px;
            }
            .go {
                margin-left: 65px;
            }
            .a {
                text-decoration: none;
            }
            .error {
                color: indianred;
                position: center;
            }

        </style>
    </head>
    <body>
    <div class="background">
        <div class="shape"></div>
        <div class="shape"></div>
    </div>
    <form:form action="checkRegistration" method="post" modelAttribute="utente">
        <c:if test="${register_error == true}">
            <span class="error">Errore, inserisci tutti i dati.</span>
        </c:if>
        <h3>Registrati</h3>

        <label for="username">Username</label>
        <form:input path="username" type="text" placeholder="Username" id="username" />

        <label for="email">Email</label>
        <form:input path="email" type="text" placeholder="Email" id="email" />

        <label for="password">Password</label>
        <form:input path="password" type="password" placeholder="Password" id="password" />

        <label for="data">Data di nascita</label>
        <form:input path="dataDiNascita" type="date" id="data" />

        <button>Registrati</button>
        <div class="social">
            <div class="go"><a href="login" class="a">Hai gia un account?</a></div>
        </div>
    </form:form>
    </body>
</html>
