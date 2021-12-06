package service;

import java.util.List;

import util.RecordDAO;
import vo.RecordVO;

public class RecordService {
	RecordDAO dao=new RecordDAO();
	
	
	public List<RecordVO> selectList (){
		return dao.selectList();
	}
	
	public int insert(RecordVO vo) {
		return dao.insert(vo);
	}
	
	
	
	
	
	
}//class
