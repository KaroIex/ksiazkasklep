<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Książki</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="text-center mt-5 mb-4">Dodaj książkę</h2>
    <form:form action="saveBook" modelAttribute="bookDTO" method="POST" class="px-3">
        <form:hidden path="id" />

        <div class="form-group">
            <label>Tytuł:</label>
            <form:input path="nazwa" class="form-control" />
        </div>

        <div class="form-group">
            <label>Wydawnictwo:</label>
            <form:input path="wydawnictwo" class="form-control" />
        </div>

        <div class="form-group">
            <label>Cena:</label>
            <form:input path="cena" class="form-control" />
        </div>

        <div class="form-group">
            <label for="categories">Kategoria:</label>
            <form:select path="kategoriaid" id="categories" class="form-control">
                <form:options items="${categories}" itemValue="id" itemLabel="nazwa" />
            </form:select>
        </div>

        <div class="form-group">
            <label for="authors">Autorzy:</label>
            <form:select path="autorzy" id="authors" multiple="true" class="form-control">
                <form:options items="${authors}" itemValue="id" itemLabel="fullName" />
            </form:select>
        </div>

        <input type="submit" value="Zapisz" class="btn btn-primary btn-block" />
    </form:form>

    <p class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/books/list">Wróć</a>
    </p>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>