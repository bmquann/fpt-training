package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Category;
import utils.DBConnectionUtils;

public class CategoryDAO extends AbstractDAO {

    public List<Category> findAll() {
        con = DBConnectionUtils.getConnection();
        List<Category> cateList = new ArrayList<Category>();
        String sql = "SELECT * FROM category";
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                Category objCate = new Category(rs.getInt(1),
                        rs.getString(2));
                cateList.add(objCate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cateList;
    }

    public int add(Category objCate) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "INSERT INTO category(name) VALUE(?)";
        try {
            pst = con.prepareStatement(sql);                       
            pst.setString(1, objCate.getName());

            result = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void delete(int id) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "DELETE FROM category "
                + "WHERE id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void update(String name, int id) {
        con = DBConnectionUtils.getConnection();
        String sql = "UPDATE category SET name=? WHERE id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, name);          
            pst.setInt(2, id);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }


    public List<Category> findAllById(int id) {
        con = DBConnectionUtils.getConnection();
        List<Category> cateList = new ArrayList<Category>();
        String sql = "SELECT * from category where id=?";
        try {
            pst = con.prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                Category objCate = new Category(rs.getInt(1),
                        rs.getString(2));

                cateList.add(objCate);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cateList;
    }

    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        dao.findAllById(4);
        dao.delete(4);
        List<Category> list = dao.findAll();

        System.out.println(list);
    }
}
