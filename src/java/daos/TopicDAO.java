package daos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Category;
import models.Topic;
import utils.DBConnectionUtils;

public class TopicDAO extends AbstractDAO {

    public List<Topic> findAll() {
        con = DBConnectionUtils.getConnection();
        List<Topic> topicList = new ArrayList<Topic>();
        String sql = "SELECT topic.id as id, topic.name as name,"
                + " topic.cate_id as cateid, category.name as catename FROM topic "
                + "INNER JOIN category ON topic.cate_id=category.id "
                + "ORDER BY topic.id DESC";
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Topic objTP = new Topic(rs.getInt("id"),
                        rs.getString("name"),
                        new Category(rs.getInt("cateid"),
                                rs.getString("catename")));
                topicList.add(objTP);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return topicList;
    }

//    public List<Topic> findAllById(int id) {
//        con = DBConnectionUtils.getConnection();
//        List<Topic> topicList = new ArrayList<Topic>();
//        String sql = "SELECT topic.id AS id, topic.name as name, "
//                + " topic.cate_id as cate_id, category.name as catename "
//                + " FROM topic INNER JOIN category"
//                + " ON topic.cate_id=category.id WHERE topic.id=1";
//        try {
//            pst = con.prepareCall(sql);
//            pst.setInt(1, id);
//            rs = pst.executeQuery();
//            while (rs.next()) {
//                Topic objTP = new Topic(rs.getInt("id"),
//                        rs.getString("name"),
//                        new Category(rs.getInt("cateid"),
//                                rs.getString("catename")));
//                topicList.add(objTP);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return topicList;
//    }

    public int add(Topic objTP) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "INSERT INTO topic(name,cate_id)"
                + " VALUE(?,?)";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, objTP.getName());
            pst.setInt(2, objTP.getCategory().getId());
            result = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void delete(int id) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "DELETE FROM topic \n"
                + "WHERE id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void update(String name,int cate_id, int id) {
        con = DBConnectionUtils.getConnection();
        String sql = "UPDATE topic SET name=?,cate_id=? WHERE id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, name);
            pst.setInt(2, cate_id);
            pst.setInt(3,id);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public List<Topic> findAllTopicTrainer(int id) {
        con = DBConnectionUtils.getConnection();
        List<Topic> topicList = new ArrayList<Topic>();
        String sql = "SELECT topic.id,topic.name,topic.cate_id,category.name "
                + "FROM topic,category,topic_trainer"
                + " WHERE topic.cate_id=category.id "
                + "and topic.id=topic_trainer.topic_id "
                + "AND topic_trainer.trainer_id=?";
        try {
            pst=con.prepareCall(sql);
            pst.setInt(1,id);
            rs=pst.executeQuery();
            while (rs.next()) {
                Topic objTP = new Topic(rs.getInt(1),
                        rs.getString(2),
                        new Category(rs.getInt(3),
                                rs.getString(4)));
                topicList.add(objTP);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return topicList;
    }

    

    public static void main(String[] args) {
        TopicDAO dao = new TopicDAO();
//        dao.add(new Topic(0,"tets", new Category(1,null)));
        System.out.println(dao.findAllTopicTrainer(1));
    }

}
