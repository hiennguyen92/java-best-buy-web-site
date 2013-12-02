package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
        return (T) currentSession().get(cls, id);
    }
    
    public T get(String id) {
        return (T) currentSession().get(cls, id);
    }

    public List<T> getList() {
        return currentSession().createQuery("from " + cls.getSimpleName()).list();
    }

    public boolean add(T temp) {
        try {
            currentSession().save(temp);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public boolean update(T temp) {
        try {
            currentSession().update(temp);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    public boolean delete(T temp) {
        try {
            currentSession().delete(temp);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
