<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.Semester, com.auca.dao.SemesterDao, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Semester Management</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script>
        $(function() {
            $("#startDate").datepicker({
                dateFormat: "yy-mm-dd",
                minDate: 0, 
                changeMonth: true,
                changeYear: true
            });

            $("#endDate").datepicker({
                dateFormat: "yy-mm-dd",
                minDate: 0, 
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
</head>
<body>
<a class="home-link" href="index.jsp">home</a><br>
    

    <form method="post" action="${pageContext.request.contextPath}/semesters">
    <h1>Delete Semester</h1>
        <input type="hidden" name="action" value="delete">

        <label for="updateUnitId">Select Semester Unit ID to Update:</label>
        <select name="id" id="updateUnitId">
            <option value="" selected>Select an Semester Unit ID to Update</option>
            
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            SemesterDao semesterDao = new SemesterDao(em);
            List<Semester> semesterList = semesterDao.findAll();
            
            for (Semester unit : semesterList) {
            %>
                <option value="<%= unit.getId() %>"><%= unit.getId() %></option>
            <%
            }
            em.close();
            emf.close();
            %>
        </select>

        <input type="submit" value="delete Semester"class="form-button">
    </form>
</body>
</html>
