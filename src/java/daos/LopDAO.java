package daos;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Lop;
import utils.DBConnectionUtils;

public class LopDAO extends AbstractDAO{

	public List<Lop> findAll() {
		con = DBConnectionUtils.getConnection();
		List<Lop> lopList = new ArrayList<Lop>();
		String sql = "SELECT * from class";
		try {
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Lop objLop = new Lop(rs.getInt(1), rs.getString(2));
				lopList.add(objLop);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lopList;
	}

	public int add(Lop objL) {
		con = DBConnectionUtils.getConnection();
		int result = 0;
		String sql = "INSERT INTO class(name) VALUE(?)";
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, objL.getTenLop());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
        public void delete(int id) {
        con = DBConnectionUtils.getConnection();
        int result = 0;
        String sql = "DELETE FROM class \n"
                + "WHERE id=?";
        try {
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (Exception e) {
        }

    }

        public static void main(String[] args) {
        LopDAO dao=new LopDAO();
            System.out.println(dao.findAll());
    }
	
	
}
