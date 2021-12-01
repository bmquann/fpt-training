package daos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Lop;
import models.sinhvien;
import utils.DBConnectionUtils;

public class SinhVienDAO extends AbstractDAO {

//    public List<sinhvien> findAll() {
//        con = DBConnectionUtils.getConnection();
//        List<sinhvien> sinhvienList = new ArrayList<sinhvien>();
//        String sql = "SELECT sv.maSV as svMa,"
//                + " sv.tenSV as svTen,"
//                + " sv.diaChi as svDiaChi,"
//                + " sv.sdt as svSDT,"
//                + " sv.email as svEmail,"
//                + " sv.maLop as svMaLop,"
//                + " l.tenLop as lTen,"
//                + " l.maKH as lMaKH,"
//                + " k.tenKH as kTen,"
//                + " k.lienheKH as kLH"
//                + " FROM sinhvien as sv"
//                + " INNER JOIN lop as l ON sv.maLop = l.maLop"
//                + " INNER JOIN khoa as k ON k.maKH = l.maKH"
//                + " ORDER BY sv.maSV DESC";
//        try {
//            st = con.createStatement();
//            rs = st.executeQuery(sql);
//            while (rs.next()) {
//                sinhvien objSV = new sinhvien(rs.getInt("svMa"),
//                        rs.getString("svTen"),
//                        rs.getString("svDiaChi"),
//                        rs.getInt("svSDT"),
//                        rs.getString("svEmail"),
//                        new Lop(rs.getInt("svMaLop"),
//                                rs.getString("lten"),
//                                new Khoa(rs.getString("lMaKH"),
//                                        rs.getString("kTen"),
//                                        rs.getString("kLH"))));
//                sinhvienList.add(objSV);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return sinhvienList;
//    }
    public List<sinhvien> findAll() {
        con = DBConnectionUtils.getConnection();
        List<sinhvien> sinhvienList = new ArrayList<sinhvien>();
        String sql = "SELECT trainee.maSV as id, trainee.tenSV as name,"
                + " trainee.diaChi as addr,trainee.sdt AS phone,"
                + " trainee.email as mail, trainee.maLop as idClass, "
                + "class.name as nameClass FROM trainee "
                + "INNER JOIN class ON trainee.maLop=class.id "
                + "ORDER BY trainee.maSV DESC";
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                sinhvien objSV = new sinhvien(rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("addr"),
                        rs.getInt("phone"),
                        rs.getString("mail"),
                        new Lop(rs.getInt("idClass"),
                                rs.getString("nameClass")));
                sinhvienList.add(objSV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sinhvienList;
    }

    public List<sinhvien> findAllById(int id) {
        con = DBConnectionUtils.getConnection();
        List<sinhvien> sinhvienList = new ArrayList<sinhvien>();
        String sql = "SELECT trainee.maSV, trainee.tenSV,trainee.diaChi,trainee.sdt,trainee.email,trainee.maLop,class.name FROM trainee, class WHERE maSV=? and trainee.maLop=class.id";
        try {
            pst = con.prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                sinhvien objSV = new sinhvien(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        new Lop(rs.getInt(6),
                                rs.getString(7)));
                sinhvienList.add(objSV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sinhvienList;
    }

    public int add(sinhvien objSV) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "INSERT INTO trainee(maSV,tenSV,diaChi,sdt,email,maLop)"
                + " VALUE(?,?,?,?,?,?)";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, objSV.getMaSV());
            pst.setString(2, objSV.getTenSV());
            pst.setString(3, objSV.getDiaChi());
            pst.setInt(4, objSV.getSdt());
            pst.setString(5, objSV.getEmail());
            pst.setInt(6, objSV.getLop().getMaLop());
            result = pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public void delete(int id) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "DELETE FROM trainee \n"
                + "WHERE maSV=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void update(String tenSV, String diaChi, int sdt, String email, Lop lop, int id) {
        con = DBConnectionUtils.getConnection();
        String sql = "UPDATE trainee SET tenSV=?,diaChi=?,sdt=?,email=?,maLop=? WHERE maSV=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, tenSV);
            pst.setString(2, diaChi);
            pst.setInt(3, sdt);
            pst.setString(4, email);
            pst.setInt(5, lop.getMaLop());
            pst.setInt(6, id);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<sinhvien> findAllByEmail(String email) {
        con = DBConnectionUtils.getConnection();
        List<sinhvien> sinhvienList = new ArrayList<sinhvien>();
        String sql = "SELECT trainee.maSV, trainee.tenSV,trainee.diaChi,trainee.sdt,trainee.email,trainee.maLop,class.name FROM trainee, class WHERE email=? and trainee.maLop=class.id";
        try {
            pst = con.prepareCall(sql);
            pst.setString(1, email);
            rs = pst.executeQuery();
            while (rs.next()) {
                sinhvien objSV = new sinhvien(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        new Lop(rs.getInt(6),
                                rs.getString(7)));
                sinhvienList.add(objSV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sinhvienList;
    }

    public List<sinhvien> findAllInClass(int trainerid){
    con = DBConnectionUtils.getConnection();
        List<sinhvien> sinhvienList = new ArrayList<sinhvien>();
        String sql = "SELECT  trainee.maSV, trainee.tenSV,"
                + " trainee.diaChi,trainee.sdt,trainee.email,trainee.maLop,class.name"
                + "  FROM trainee,class,topic_class,topic_trainer "
                + "WHERE trainee.maLop=class.id AND"
                + " class.id=topic_class.class_id and"
                + " topic_class.topic_id=topic_trainer.topic_id and"
                + " topic_trainer.trainer_id=?";
        try {
            pst = con.prepareCall(sql);
            pst.setInt(1, trainerid);
            rs = pst.executeQuery();
            while (rs.next()) {
                sinhvien objSV = new sinhvien(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        new Lop(rs.getInt(6),
                                rs.getString(7)));
                sinhvienList.add(objSV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sinhvienList;
    
    
    }
    public static void main(String[] args) {
        SinhVienDAO dao = new SinhVienDAO();
//        dao.add(new sinhvien(3, "quan", "HN", 123, "quan", new Lop(1, null)));
//        dao.update("updfate", "SG", 123, "quan", new Lop(1,null), 3);

        
        System.out.println(dao.findAllInClass(2));
    }

}
