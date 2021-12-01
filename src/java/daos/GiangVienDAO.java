package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Trainer;
import utils.DBConnectionUtils;

public class GiangVienDAO extends AbstractDAO{

		public List<Trainer> findAll() {
		con = DBConnectionUtils.getConnection();
		List<Trainer> giangvienList = new ArrayList<Trainer>();
		String sql = "SELECT * FROM trainer "
                        + "ORDER BY trainer.id DESC";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Trainer objGV = new Trainer(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5));
				giangvienList.add(objGV);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return giangvienList;
	}

	public int add(Trainer objGV) {
		con = DBConnectionUtils.getConnection();
		int result = 0;
		String sql ="INSERT INTO trainer(id,name,address,sdt,email) VALUE(?,?,?,?,?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setInt(1, objGV.getMaGV());
			pst.setString(2, objGV.getTenGV());
			pst.setString(3, objGV.getDiaChi());
			pst.setInt(4, objGV.getSdt());
			pst.setString(5, objGV.getEmail());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
        public void delete(int id) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "DELETE FROM trainer \n"
                + "WHERE id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void update(String tenGV, String diaChi,int sdt,String email,int id) {
        con = DBConnectionUtils.getConnection();
        String sql = "UPDATE trainer SET name=?,address=?,sdt=?,email=? WHERE id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setString(1, tenGV);
            pst.setString(2, diaChi);
            pst.setInt(3, sdt);
            pst.setString(4, email);
            pst.setInt(5, id);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
     public List<Trainer> findAllByEmail(String email) {
        con = DBConnectionUtils.getConnection();
        List<Trainer> GVList = new ArrayList<Trainer>();
        String sql = "SELECT * FROM trainer  WHERE email=?"
                + "ORDER BY trainer.id DESC";
        try {
           pst=con.prepareCall(sql);
            pst.setString(1,email);
            rs=pst.executeQuery();
            while (rs.next()) {
                Trainer objGV = new Trainer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
                        
             GVList.add(objGV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return GVList;
    }
     public List<Trainer> findAllById(int id) {
        con = DBConnectionUtils.getConnection();
        List<Trainer> GVList = new ArrayList<Trainer>();
        String sql = "SELECT * from trainer where id=?";
        try {
           pst=con.prepareCall(sql);
            pst.setInt(1,id);
            rs=pst.executeQuery();
            while (rs.next()) {
                 Trainer objGV = new Trainer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5));
                        
             GVList.add(objGV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return GVList;
    }

	    public static void main(String[] args) {
                GiangVienDAO gv=new GiangVienDAO();
//                                gv.delete("3");
                
//                gv.update("2", "3", 1234, "4", 2);
//                gv.add(new giangvien(2, "tets", "HN", 123, "tets@"));

List<Trainer> list=gv.findAllByEmail("trainer@gmail.com");
                
                System.out.println(list);
    }
	
	
}
