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

        <link rel="icon" type="image/x-icon" href="../../image/favicon_catalogo.ico">

        <title>Lista generi</title>
        <!-- custom css file link  -->
        <link rel="stylesheet" href="../../css/style.css">

        <style>
            .bottone{
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 4px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 15px;
                cursor: pointer;
                border-radius: 25px;
                text-transform:uppercase;
            }
            .bottone:hover{
                background-color: lightblue;
                transition: all .5s;
                transform:scale(1.3);

            }

        </style>
    </head>

    <body>
    <table class="table container">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Nome Genere</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="genere" items="${lista_generi}">
            <tr>
                <th scope="row">${genere.id}</th>
                <td>${genere.genere}</td>
                <td><button type="button" class="bottone btn-danger" onclick="location.href='/admin/gestione-catalogo/genere/delete/${genere.id}'">Elimina</button></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div style="text-align:center;">
        <a href="#home" onclick="location.href='/homepage'" style="text-decoration:none;"class="bottone btn-outline-info">Home</a>
        <button type="button" class="bottone btn-warning mx-3" onclick="location.href='/admin/gestione-catalogo/genere/form-aggiungi-genere'">Aggiungi Genere</button>
        <a href="#catalogo" onclick="location.href='/catalogo-libri/show/true'" style="text-decoration:none;"class="bottone btn-outline-info">Catalogo</a>
    </div>
    </body>

</html>
