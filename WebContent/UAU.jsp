<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, com.auca.model.AcademicUnit, com.auca.dao.AcademicUnitDao, javax.persistence.EntityManager, javax.persistence.EntityManagerFactory, javax.persistence.Persistence" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="style.css" />
    <title>Academic Unit Management</title>
    <link rel="stylesheet" type="text/css" href="semester.css">
    
    
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
    </style>
</head>
<body>
<a class="home-link" href="index.jsp">home</a><br>
    

    <form method="post" action="${pageContext.request.contextPath}/academic-units">
    <h1>Academic Unit Management</h1>
        <input type="hidden" name="action" value="update">

        <label for="updateUnitId">Select Academic Unit ID to Update:</label>
        <select name="id" id="updateUnitId">
            <option value="" selected>Select an Academic Unit ID to Update</option>
            
            <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
            EntityManager em = emf.createEntityManager();
            AcademicUnitDao academicUnitDao = new AcademicUnitDao(em);
            List<AcademicUnit> academicUnitsList = academicUnitDao.findAll();
            
            for (AcademicUnit unit : academicUnitsList) {
            %>
                <option value="<%= unit.getId() %>"><%= unit.getId() %></option>
            <%
            }
            // Close the EntityManager here
            em.close();
            emf.close();
            %>
        </select>

        <label for="unitName">Academic Unit Name:</label>
        <input type="text" name="name" id="unitName">
        
        <label for="updateUnitType">Update Academic Unit Type:</label>
        <select name="type" id="updateUnitType">
            <option value="PROGRAMME">PROGRAMME</option>
            <option value="FACULTY">FACULTY</option>
            <option value="DEPARTMENT">DEPARTMENT</option>
        </select>

        <label for="selfReferenceId">Self-Reference ID:</label>
        <select name="unit" id="selfReferenceId">
            <option value="" selected>Select a Self-Reference ID</option>
        </select>
        
        <br>
        <%
        // Reopen EntityManager for another query
        emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
        em = emf.createEntityManager();
        List<AcademicUnit> selfReferenceUnits = em.createQuery("SELECT au FROM AcademicUnit au", AcademicUnit.class)
            .getResultList();
        // Close the EntityManager here
        em.close();
        emf.close();
        %>
        <input type="submit" value="Update Academic Unit"class="form-button">
    </form>

    <script>
        var allOptions = [
            { type: 'PROGRAMME', options: [] },
            { type: 'FACULTY', options: [] },
            { type: 'DEPARTMENT', options: [] }
        ];
        
        <%
        for (AcademicUnit unit : academicUnitsList) {
            String optionValue = unit.getId();
            String unitType = unit.getType().toString();
        %>
            allOptions.find(item => item.type === "<%= unitType %>").options.push("<%= optionValue %>");
        <%
        }
        %>
        
        // Function to load Self-Reference IDs based on the unit type above the selected one
        function loadSelfReferenceIds() {
            var unitTypeSelect = document.getElementById("updateUnitType");
            var selfReferenceIdSelect = document.getElementById("selfReferenceId");
            selfReferenceIdSelect.innerHTML = '';

            // Get the selected unit type
            var unitType = unitTypeSelect.value;

            if (unitType !== "PROGRAMME") {
                
                var unitTypeAbove = unitType === "DEPARTMENT" ? "FACULTY" :
                                    unitType === "FACULTY" ? "PROGRAMME" : "";
                
                var options = allOptions.find(item => item.type === unitTypeAbove).options;

                options.forEach(function (option) {
                    var optionElement = document.createElement("option");
                    optionElement.value = option;
                    optionElement.text = option;
                    selfReferenceIdSelect.appendChild(optionElement);
                });
            }
        }

        loadSelfReferenceIds();
        
        document.getElementById("updateUnitType").addEventListener("change", loadSelfReferenceIds);
    </script>
</body>
</html>
