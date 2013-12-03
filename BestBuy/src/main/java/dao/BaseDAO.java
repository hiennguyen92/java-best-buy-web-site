package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class BaseDAO<T> {

    private Class<T> cls;

    @Autowired
    private SessionFactory sessionFactory;

    public void setCls(Class<T> cls) {
        this.cls = cls;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected final Session currentSession() {
        return sessionFactory.openSession();
    }

    public T get(int id) {
        T temp = null;
        Session session = currentSession();
        try {
            temp = (T) currentSession().get(cls, id);
        } catch (Exception ex) {
            //Log the exception
            System.out.println(ex);
        } finally {
            session.close();
        }
        return temp;
    }
    
    public T get(String id) {
        T temp = null;
        Session session = currentSession();
        try {
            temp = (T) currentSession().get(cls, id);
        } catch (Exception ex) {
            //Log the exception
            System.out.println(ex);
        } finally {
            session.close();
        }
        return temp;
    }

    public List<T> getList() {
        List<T> list = null;
        Session session = currentSession();

        try {
            list = session.createQuery("from " + cls.getSimpleName()).list();
        } catch (Exception ex) {
            //Log the exception
            System.out.println(ex);
        } finally {
            session.close();
        }
        return list;
    }

    public boolean add(T temp) {
        Session session = currentSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(temp);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            return false;
        } finally{
            session.close();
        }
        return true;
    }

    public boolean update(T temp) {
        Session session = currentSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(temp);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            return false;
        } finally{
            session.close();
        }
        return true;
    }

    public boolean delete(T temp) {
        Session session = currentSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(temp);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
            return false;
        } finally{
            session.close();
        }
        return true;
    }
}