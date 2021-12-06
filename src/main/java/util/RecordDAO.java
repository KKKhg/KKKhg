package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.RecordVO;

//** DAO (Data Access Object)
//=> CRUD
//	C : create -> insert
//  R : read   -> selectList, selectOne
//	U : update -> update
//	D : delete -> delete

public class RecordDAO {
	private Connection cn = DBConnection.getConnection();
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	private String sql;

	public List<RecordVO> selectList() {
		// admin제외 출력
		sql = "select * from record order by score desc";
		List<RecordVO> list = new ArrayList<RecordVO>();
		int count=1;
		try {
			st = cn.createStatement();
			rs = st.executeQuery(sql);
			// 요청객체로 결과 전달
			// => 출력자료 있는지 확인
			if (rs.next()) {
				// => 출력할 1row -> RecordVO 에 담고 -> list에 add
				do {
					if(count>10) break;
					RecordVO vo = new RecordVO();
					vo.setName(rs.getString(1));
					vo.setScore(rs.getInt(2));
					list.add(vo);
					count+=1;
					
				} while (rs.next());
			} else {
				System.out.println("** selectList: 출력할 기록이  없습니다.");
				list = null;
			}

		} catch (Exception e) {
			System.out.println("** selectList Exception => " + e.toString());
			list = null;
		}

		return list;
	}// selectList

	public int insert(RecordVO vo) {
		sql = "insert into record values(?,?)";

		try {
			pst = cn.prepareStatement(sql);
			pst.setString(1, vo.getName());
			pst.setInt(2, vo.getScore());

			return pst.executeUpdate();

		} catch (Exception e) {
			System.out.println("** insert Exception => " + e.toString());
			return 0;
		}
	} // insert

} // class
