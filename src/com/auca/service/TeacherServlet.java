package com.auca.service;

import com.auca.dao.AcademicUnitDao;
import com.auca.dao.StudentDao;
import com.auca.dao.TeacherDao;
import com.auca.model.AcademicUnit;
import com.auca.model.EAcademicUnit;
import com.auca.model.EQualification;
import com.auca.model.Teacher;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Enumerated;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/teachers")
public class TeacherServlet extends HttpServlet {
    private TeacherDao teacherDao;
    private AcademicUnitDao academicUnitDao;

    public void init() {
    	  EntityManagerFactory emf = Persistence.createEntityManagerFactory("YourPersistenceUnit");
          EntityManager em = emf.createEntityManager();
          teacherDao = new TeacherDao(em);
          academicUnitDao = new AcademicUnitDao(em); // Initialize academicUnitDao
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // Display a list of teachers (read operation)
            List<Teacher> teachers = teacherDao.findAll();
            request.setAttribute("teachers", teachers);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (action.equals("new")) {
            // Show the form to create a new teacher
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (action.equals("update")) {
            // Display the form to edit an existing teacher
            String id = request.getParameter("id");
            Teacher teacher = teacherDao.findById(id);
            request.setAttribute("teacher", teacher);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            // Delete a teacher
            String id = request.getParameter("id");
            teacherDao.delete(id);
            response.sendRedirect(request.getContextPath() + "/teachers");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("create")) {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String qualificationValue = request.getParameter("qualification");
            EQualification qualification = EQualification.valueOf(qualificationValue);

            Teacher teacher = new Teacher(id, name, qualification, null);

            teacherDao.save(teacher); 

            response.sendRedirect(request.getContextPath() + "/teachers");
        
        } else if (action.equals("update")) {
            // Update an existing teacher
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String qualification = request.getParameter("qualification");
            
            // Retrieve other teacher attributes as needed
            Teacher teacher = teacherDao.findById(id);
            teacher.setName(name);
            teacher.setQualification(EQualification.valueOf(qualification));
            teacherDao.update(teacher);
            response.sendRedirect(request.getContextPath() + "/teachers");
        }else if ("delete".equals(action)) {
            String id = request.getParameter("id");
            Teacher teacher = teacherDao.findById(id);

            if (teacher != null) {
                teacherDao.delete(id);
            }

            response.sendRedirect(request.getContextPath() + "/teachers");
        }
    }
}
