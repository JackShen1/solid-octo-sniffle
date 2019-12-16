import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class DBManager {

    private final SessionFactory sessionFactory;

    public DBManager() {
        try {
            sessionFactory = new Configuration()
                .addAnnotatedClass(Alternative.class)
                .addAnnotatedClass(Answer.class)
                .addAnnotatedClass(Expert.class)
                .addAnnotatedClass(Metadata.class)
                .addAnnotatedClass(Poll.class)
                .addAnnotatedClass(Question.class)
                .addAnnotatedClass(QuestionType.class)
                .addAnnotatedClass(Session.class)
                .addAnnotatedClass(Variant.class)
                .configure()
                .buildSessionFactory();
        }catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public void close() {
        sessionFactory.getCurrentSession().close();
        sessionFactory.close();
    }

    public void addPoll(Poll poll) {
        Transaction tx = null;
        org.hibernate.Session session = sessionFactory.getCurrentSession();
        try {
            tx = session.beginTransaction();

            session.save(poll);
            for(Question question : poll.getQuestions()) {
                session.saveOrUpdate(question.getType());
                session.save(question);
                for(Variant variant : question.getVariants()) {
                    Variant link1 = variant.getLink1();
                    if(link1 != null) {
                        session.save(link1);
                    }
                    Variant link2 = variant.getLink2();
                    if(link2 != null) {
                        session.save(link2);
                    }
                    session.save(variant);
                }
                for(Metadata metadata : question.getMetadata()) {
                    session.save(metadata);
                }
            }

            tx.commit();
        }catch(HibernateException e) {
            if(tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        }
    }

    public Poll getPoll(int id) {
        Transaction tx = null;
        org.hibernate.Session session = sessionFactory.getCurrentSession();
        try {
            tx = session.beginTransaction();
            return session.get(Poll.class, id);
        }catch(Exception e) {
            if(tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
            return null;
        }
    }
}
