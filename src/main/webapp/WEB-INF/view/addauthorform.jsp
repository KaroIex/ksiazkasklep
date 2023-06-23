<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">
    <title>Autorzy</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-4 mb-4">Dodaj autora</h2>
    <form:form action="saveAuthor" modelAttribute="autor" method="POST">
        <div class="form-group">
            <label for="imie">Imię:</label>
            <form:input path="imie" id="imie" class="form-control"/>
        </div>
        <div class="form-group">
            <label for="nazwisko">Nazwisko:</label>
            <form:input path="nazwisko" id="nazwisko" class="form-control"/>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Zapisz</button>
        </div>
    </form:form>
    <p>
        <a href="${pageContext.request.contextPath}/authors/list" class="btn btn-secondary">Powrót</a>
    </p>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>