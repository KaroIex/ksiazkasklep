<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Książki</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-4">Dodaj książkę</h2>
    <form:form class="mt-4" action="saveBook" modelAttribute="bookDTO" method="POST">
        <form:hidden path="id" />

        <div class="form-group">
            <label>Tytuł:</label>
            <form:input path="nazwa" class="form-control" />
        </div>

        <div class="form-group">
            <label>Wydawca:</label>
            <form:input path="wydawnictwo" class="form-control" />
        </div>

        <div class="form-group">
            <label>Cena:</label>
            <form:input path="cena" class="form-control" />
        </div>

        <div class="form-group">
            <label>Kategoria:</label>
            <form:select path="kategoriaid" class="form-control">
                <form:options items="${categories}" itemValue="id" itemLabel="nazwa" />
            </form:select>
        </div>

        <div class="form-group">
            <label>Autorzy:</label>
            <form:select path="autorzy" class="form-control" multiple="true">
                <form:options items="${authors}" itemValue="id" itemLabel="fullName" />
            </form:select>
        </div>

        <button type="submit" class="btn btn-primary">Zapisz</button>
    </form:form>

    <p class="mt-4">
        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/books/list">Powrót</a>
    </p>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>