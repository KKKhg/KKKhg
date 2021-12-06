package controllerM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.RecordService;
import vo.RecordVO;

@WebServlet("/insert")
public class RInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청분석
		request.setCharacterEncoding("utf-8");
		RecordService service=new RecordService();
		RecordVO vo= new RecordVO();
		String message=null;
		String uri="list";
		
		// 2. Service
		// => Parameter -> vo에 set
		// => service, DAO에 update 메서드 추가
		// => 성공 후 => 수정된 정보 확인 : RecordList.jsp
		// => 실패 후 => 다시 수정하기 : 수정가능한 폼을 출력.
		
		if(request.getParameter("name") !=null &&  request.getParameter("name") !="") {
			vo.setName(request.getParameter("name"));
			vo.setScore(Integer.parseInt(request.getParameter("score")));
			System.out.println("name"+request.getParameter("name"));
			System.out.println("score"+request.getParameter("score"));
			
			if (service.insert(vo) >= 0) { //update 성공
			} else { //update 실패
				System.out.println("인서트실패");
			}
		}
		
		// 3. View 처리
		
		response.sendRedirect(uri);
		
		//request.getRequestDispatcher(uri).forward(request, response);	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
