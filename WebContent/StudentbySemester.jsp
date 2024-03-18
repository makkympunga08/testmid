<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.StudentRegisteration, com.auca.model.Semester, com.auca.model.AcademicUnit, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Student by Semester</title>
    <link rel="shortcut icon" href="fav.jpg"/>
    
    
    <style type="text/css">
       body {
    font-family: 'Montserrat', sans-serif;
    background: url('background.jpg') no-repeat center center fixed;
    background-color: #f2f2f2;
    padding: 20px;
    color: #333;
}

.home-link {
    display: block;
    margin-bottom: 20px;
    font-size: 18px;
    text-decoration: none;
    color: #ff5722; /* Orange color */
}

h1 {
    text-align: center;
    font-size: 36px;
    color: #ff5722; /* Orange color for headings */
    margin-bottom: 30px;
}

form {
    text-align: center;
    margin-bottom: 30px;
}

input[type="text"] {
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.form-button {
    padding: 10px 20px;
    font-size: 18px;
    background-color: #ff5722; /* Orange color for buttons */
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.form-button:hover {
    background-color: #ff6f42; /* Lighter shade of orange on hover */
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #ff5722; /* Orange color for table headers */
    color: white;
}

tr:hover {
    background-color: #f5f5f5;
}

a {
    display: inline-flex;
    padding: 25px 30px;
    color: #ff5722; /* Orange color */
    text-decoration: none;
    text-transform: uppercase;
    transition: 0.5s;
    letter-spacing: 4px;
    overflow: hidden;
}

a:hover {
    background: #ff5722; /* Orange color on hover */
    color: white;
    box-shadow: 0 0 5px #ff5722, 0 0 25px #ff5722, 0 0 50px #ff5722, 0 0 200px #ff5722;
}

a:nth-child(1) {
    filter: hue-rotate(180deg); /* Rotate color to blue */
}

a span {
    position: absolute;
    display: block;
    width: 100%;
    height: 2px;
    background: linear-gradient(90deg, transparent, #ff5722); /* Orange color gradient */
    animation: animate 1s linear infinite;
}

@keyframes animate {
    0% {
        transform: scaleX(0);
        transform-origin: middle;
    }
    50% {
        transform: scaleX(1);
        transform-origin: left;
    }
    50.1% {
        transform: scaleX(1);
        transform-origin: right;
    }
    100% {
        transform: scaleX(0);
        transform-origin: right;
    }
}

    </st</style>
    
</head>
<body>
<a class="home-link" href="index.jsp"><span></span><span></span><span></span><span></span>DashBoard</a>
    <h1>Student by Semester</h1>
    
    <form method="post" action="<%= request.getRequestURI() %>">
        Enter Semester: <input type="text" name="semesterName">
        <input type="submit" value="Search" class="form-button">
    </form>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Registration Date</th>
        </tr>
        <%
            String requestedSemester = request.getParameter("semesterName");
            if (requestedSemester != null) {
                EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
                EntityManager em = emf.createEntityManager();
                
                Semester semester = em.createQuery("SELECT s FROM Semester s WHERE s.name = :name", Semester.class)
                        .setParameter("name", requestedSemester)
                        .getSingleResult();
                
                List<StudentRegisteration> studentRegistrations = em.createQuery("SELECT sr FROM StudentRegisteration sr WHERE sr.semester = :semester", StudentRegisteration.class)
                        .setParameter("semester", semester)
                        .getResultList();
                
                for (StudentRegisteration student : studentRegistrations) {
        %>
        <tr>
            <td><%= student.getStudent().getId() %></td>
            <td><%= student.getStudent().getName() %></td>
            <td><%= student.getAcademicUnit().getName() %></td>
            <td><%= student.getRegDate()%></td>
        </tr>
        <%
                }
                em.close();
                emf.close();
            }
        %>
    </table>
</body>
</html>
