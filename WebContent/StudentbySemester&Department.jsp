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
            font-family: 'Oswald', sans-serif;
            background: url('dashbord.jpg') no-repeat center center fixed;
            background-color: #f2f2f2;
            padding: 20px;
        }

        .home-link {
            display: block;
            margin-bottom: 20px;
            font-size: 18px;
            text-decoration: none;
            color: #3498db;
        }

        h1 {
            text-align: center;
            font-size: 36px;
            color: #3498db;
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
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #2980b9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        
        a {
            position: inherit;
            display: inline-flex;
            padding: 25px 30px;
            color: #03e9f4;
            text-decoration: none;
            text-transform: uppercase;
            transition: 0.5s;
            letter-spacing: 4px;
            overflow: hidden;
        }

        a:hover {
            background: #03e9f4;
            color: #050801;
            box-shadow: 0 0 5px #03e9f4, 0 0 25px #03e9f4, 0 0 50px #03e9f4, 0 0 200px #03e9f4;
            -webkit-box-reflect: below 1px linear-gradient(transparent, #0005);
        }

        a:nth-child(1) {
            filter: hue-rotate(270deg);
        }

        a span {
            position: absolute;
            display: block;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, #03e9f4);
            animation: animate 1s linear infinite;
        }

    </st</style>
</head>
<body>
<a class="home-link" href="index.jsp"><span></span><span></span><span></span><span></span>DashBoard</a>
    <h1>Student by Semester and Department</h1>
    
    <form method="post" action="<%= request.getRequestURI() %>">
        Enter Semester: <input type="text" name="semesterName">
        Enter Department: <input type="text" name="departmentName"><br>
        <input type="submit" value="Search" class="form-button">
    </form>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Registration Date</th>
        </tr>
        <%
        String requestedSemester = request.getParameter("semesterName");
        String requestedDepartment = request.getParameter("departmentName");
        if (requestedSemester != null && requestedDepartment != null) {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            Semester semester = em.createQuery("SELECT s FROM Semester s WHERE s.name = :name", Semester.class)
                    .setParameter("name", requestedSemester)
                    .getSingleResult();
            AcademicUnit department = em.createQuery("SELECT au FROM AcademicUnit au WHERE au.name = :name", AcademicUnit.class)
                    .setParameter("name", requestedDepartment)
                    .getSingleResult();
                
            List<StudentRegisteration> studentRegistrations = em.createQuery("SELECT sr FROM StudentRegisteration sr WHERE sr.semester = :semester AND sr.academicUnit = :department", StudentRegisteration.class)
                        .setParameter("semester", semester)
                        .setParameter("department", department)
                        .getResultList();
                
                for (StudentRegisteration student : studentRegistrations) {
        %>
        <tr>
            <td><%= student.getStudent().getId() %></td>
            <td><%= student.getStudent().getName() %></td>
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
