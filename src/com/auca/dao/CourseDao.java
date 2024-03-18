package com.auca.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.auca.model.Course;

import java.util.List;

public class CourseDao {

    private EntityManager entityManager;

    public CourseDao(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public Course findById(String id) {
        return entityManager.find(Course.class, id);
    }

    public List<Course> findAll() {
        String queryString = "SELECT c FROM Course c";
        TypedQuery<Course> query = entityManager.createQuery(queryString, Course.class);
        return query.getResultList();
    }

    public void save(Course course) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(course);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public void update(Course course) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(course);
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
            Course course = entityManager.find(Course.class, id);
            if (course != null) {
                entityManager.remove(course);
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

