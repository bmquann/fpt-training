package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import models.Class_Topic;
import models.Topic;
import models.Lop;
import models.Trainer;
import utils.DBConnectionUtils;

public class ClassTopicDAO extends AbstractDAO {

    public List<Class_Topic> findAll() {
        con = DBConnectionUtils.getConnection();
        List<Class_Topic> CTList = new ArrayList<Class_Topic>();
        String sql = "SELECT DISTINCT topic_class.topic_id as topicid,"
                + "topic.name AS topicname,topic_class.class_id as classid,"
                + "class.name as classname FROM topic_class "
                + "INNER JOIN topic on topic_class.topic_id=topic.id "
                + "INNER JOIN class on topic_class.class_id=class.id "
                + "ORDER BY topic.id DESC";
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Class_Topic objCT = new Class_Topic(new Topic(rs.getInt("topicid"),
                        rs.getString("topicname"), null),
                        new Lop(rs.getInt("classid"),rs.getString("classname")));
                CTList.add(objCT);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return CTList;
    }

    public int add(int topicid,int classid) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "INSERT INTO topic_class(topic_id,class_id) VALUE(?,?)";
        try {
            pst = con.prepareStatement(sql);                       
            pst.setInt(1, topicid);
            pst.setInt(2, classid);

            result = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void delete(int topicid,int classid) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "DELETE FROM topic_class "
                + "WHERE topic_id=? and class_id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, topicid);
            pst.setInt(2, classid);
            pst.executeUpdate();
        } catch (Exception e) {
        }

    }
    public List<Class_Topic> findAllByClassId(int classid) {
        con = DBConnectionUtils.getConnection();
        List<Class_Topic> CTList = new ArrayList<Class_Topic>();
        String sql = "SELECT DISTINCT topic_class.topic_id as topicid,"
                + "topic.name AS topicname,topic_class.class_id as classid,"
                + "class.name as classname FROM topic_class "
                + "INNER JOIN topic on topic_class.topic_id=topic.id "
                + "INNER JOIN class on topic_class.class_id=class.id "
                + "where topic_class.class_id=? ";

        try {
            pst = con.prepareCall(sql);
            pst.setInt(1, classid);
            rs = pst.executeQuery();
            while (rs.next()) {
               Class_Topic objCT = new Class_Topic(new Topic(rs.getInt("topicid"),
                        rs.getString("topicname"), null),
                        new Lop(rs.getInt("classid"),rs.getString("classname")));
                CTList.add(objCT);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return CTList;
    }
//
//    public void update(String name, int id) {
//        con = DBConnectionUtils.getConnection();
//        String sql = "UPDATE category SET name=? WHERE id=?";
//        try {
//            pst = con.prepareStatement(sql);
//            pst.setString(1, name);          
//            pst.setInt(2, id);
//            pst.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//
//    public List<Category> findAllById(int id) {
//        con = DBConnectionUtils.getConnection();
//        List<Category> cateList = new ArrayList<Category>();
//        String sql = "SELECT * from category where id=?";
//        try {
//            pst = con.prepareCall(sql);
//            pst.setInt(1, id);
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                Category objCate = new Category(rs.getInt(1),
//                        rs.getString(2));
//
//                cateList.add(objCate);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return cateList;
//    }

    public static void main(String[] args) {
        ClassTopicDAO dao = new ClassTopicDAO();
//        dao.findAllById(4);
//        dao.delete(4);
//        dao.add(1,5);
//        dao.add(1, 1);
//        dao.delete(1, 1);
        dao.findAllByClassId(1);
        List<Class_Topic> list = dao.findAll();

        System.out.println(dao.findAllByClassId(1));
    }
}
