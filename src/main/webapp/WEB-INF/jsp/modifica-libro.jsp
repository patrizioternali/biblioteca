<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Modifica Libro</title>
    </head>
    <body>
        <form:form modelAttribute="libro_validator" action="/admin/gestione-catalogo/libro/conferma-modifica/${libro.id}" method="post">
            <h1>Modifica libro: ${libro.titolo}</h1>
            <br>
            <label for="titolo">Modifica titolo:</label>
            <form:input type="text" id="titolo" name="titolo" value="${libro.titolo}" path="titolo" />
            <br>
            <label for="autore">Modifica autore:</label>
            <form:input type="text" id="autore" name="autore" value="${libro.autore}" path="autore" />
            <br>
            <label for="genere">Modifica genere:</label>
            <form:input type="text" id="genere" name="genere" value="${libro.genere}" path="genere" />
            <br>
            <label for="anno">Modifica anno:</label>
            <form:input type="text" id="anno" name="anno" value="${libro.anno}" path="anno" />
            <br>
            <label for="stato">Modifica stato:</label>
            <form:select id="stato" class="form-control" path="stato" >
                <h5>Default = USER</h5>
                <option selected>Scegli...</option>
                <option>DISPONIBILE</option>
                <option>NON DISPONIBILE</option>
            </form:select>
            <br>
            <label for="immagine">Modifica immagine:</label>
            <form:input type="text" id="immagine" name="immagine" value="${libro.immagine}" path="immagine" />
            <button type="submit" class="btn btn-success">Modifica</button>
        </form:form>
    </body>
</html>