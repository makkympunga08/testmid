package com.auca.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.auca.model.Course;
import com.auca.model.StudentRegisteration;

import java.util.List;

public class StudentRegistrationDao {
	private EntityManager entityManager;

    public StudentRegistrationDao(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public StudentRegisteration findById(String id) {
        return entityManager.find(StudentRegisteration.class, id);
    }

    public List<StudentRegisteration> findAll() {
        String queryString = "SELECT sr FROM studentregisteration sr";
        TypedQuery<StudentRegisteration> query = entityManager.createQuery(queryString, StudentRegisteration.class);
        return query.getResultList();
    }

    public void save(StudentRegisteration studentregisteration) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(studentregisteration);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void update(StudentRegisteration studentregisteration) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(studentregisteration);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void delete(String id) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            StudentRegisteration studentregisteration = entityManager.find(StudentRegisteration.class, id);
            if (studentregisteration != null) {
                entityManager.remove(studentregisteration);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

}
