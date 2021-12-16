package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import models.Topic;
import models.Topic_Trainer;
import models.Trainer;
import utils.DBConnectionUtils;

public class WorkPlanDAO extends AbstractDAO {

    public List<Topic_Trainer> findAll() {
        con = DBConnectionUtils.getConnection();
        List<Topic_Trainer> WList = new ArrayList<Topic_Trainer>();
        String sql = "SELECT DISTINCT topic_trainer.topic_id as topicid,"               
                + " topic.name as topicname,"
                + " topic_trainer.trainer_id as trainerid,"
                + " trainer.name as trainername,"
                + " trainer.email as email,trainer.sdt as sdt"
                + " FROM topic_trainer INNER JOIN topic"
                + " ON topic_trainer.topic_id=topic.id"
                + " INNER JOIN trainer ON topic_trainer.trainer_id=trainer.id";
//                + " ORDER BY topic.id DESC";
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Topic_Trainer objW = new Topic_Trainer(new Topic(rs.getInt("topicid"),
                        rs.getString("topicname"), null),
                        new Trainer(rs.getInt("trainerid"),rs.getString("trainername"), rs.getString("email"), rs.getInt("sdt"), null));
                WList.add(objW);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return WList;
    }

    public int add(int trainerid,int topicid) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "INSERT INTO topic_trainer(trainer_id,topic_id) VALUE(?,?)";
        try {
            pst = con.prepareStatement(sql);                       
            pst.setInt(1, trainerid);
            pst.setInt(2, topicid);

            result = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void delete(int trainerid,int topicid) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "DELETE FROM topic_trainer "
                + "WHERE trainer_id=? and topic_id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, trainerid);
            pst.setInt(2, topicid);
            pst.executeUpdate();
        } catch (Exception e) {
        }

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
        WorkPlanDAO dao = new WorkPlanDAO();
//        dao.findAllById(4);
//        dao.delete(4);
        dao.add(1,5);
        List<Topic_Trainer> list = dao.findAll();

        System.out.println(list);
    }
}
