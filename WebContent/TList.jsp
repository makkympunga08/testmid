<%@page import="com.auca.model.Teacher"%>
<%@page import="com.auca.model.CourseDefinition"%>
<%@page import="com.auca.model.StudentRegisteration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.Course, com.auca.model.AcademicUnit, com.auca.model.Semester, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Teacher list</title>
    
     <link rel="shortcut icon" href="fav.jpg"/>
    
    <style type="text/css">
    
    body {
background: url('gistr.jpg') no-repeat center center fixed;
    background-size: cover;
    min-height: 100vh;
    margin: 0;
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
}

form {
    max-width: 800px;
    margin: 120px auto;
}

form .image {
    float: left;
    background-image: url("https://dl.dropboxusercontent.com/s/5lg1zkgu8esm5jw/desk.jpg?dl=0");
    height: 500px;
    width: 50%;
    background-size: cover;
    background-position: 25%;
}

form .frm {
    float: right;
    direction: rtl;
    text-align: right;
    height: 500px;
    width: 50%;
    min-width: 250px;
    padding: 0 35px;
    background-size: 100% 100%;
    background-color: white;
}

form h1 {
    margin-top: 30px;
    margin-bottom: 20px;
}

form .form-control {
    width: 90%;
    padding: 12px 20px;
    height: auto;
}

form .btn {
    width: 100%;
    margin-top: 20px;
}

@media screen and (max-width: 700px) {
    form .image {
        width: 30%;
        background-position: 60%;
    }

    form .frm {
        width: 70%;
    }

    form .form-control {
        width: 100%;
    }
}

@media screen and (max-width: 500px) {
    form .image {
        display: none;
    }

    form .frm {
        width: 100%;
    }

    form h1 {
        text-align: center;
    }

    form .btn {
        width: 100%;
        margin-top: 20px;
    }
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
    
</head>
<body>
<a class="home-link" href="index.jsp">home</a><br>
    <h1>All Course Definition</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Qualification</th>
        </tr>
        <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            List<Teacher> teacher = em.createQuery("SELECT s FROM Teacher s", Teacher.class).getResultList();
            for (Teacher teach : teacher) {
         %>
        <tr>
            <td><%= teach.getId() %></td>
            <td><%= teach.getName() %></td>
            <td><%= teach.getQualification() %></td>
        </tr>
        <%
            }
            em.close();
            emf.close();
        %>
    </table>
</body>
</html>