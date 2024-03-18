package com.auca.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import com.auca.model.Semester;
import java.util.List;

public class SemesterDao {

    private EntityManager entityManager;

    public SemesterDao(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public void save(Semester semester) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(semester);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    public Semester findById(String id) {
        return entityManager.find(Semester.class, id);
    }

    public List<Semester> findAll() {
        TypedQuery<Semester> query = entityManager.createQuery("SELECT s FROM Semester s", Semester.class);
        return query.getResultList();
    }

    public void update(Semester semester) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(semester);
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
            Semester semester = entityManager.find(Semester.class, id);
            if (semester != null) {
                entityManager.remove(semester);
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
