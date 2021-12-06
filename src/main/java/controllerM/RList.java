package controllerM;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.RecordService;
import vo.RecordVO;

@WebServlet("/list")
public class RList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청분석 
		// => Service 준비
		RecordService service = new RecordService();
		List<RecordVO> list = new ArrayList<RecordVO>();
		String uri = "/guguDan/main.jsp"; 
		
		// 2. Service 처리
		list = service.selectList();
		if (list != null) {
			request.getSession().setAttribute("list", list);
			//request.setAttribute("list", list);
		}else {
			request.setAttribute("message", "출력할 기록이 없습니다.");
		}
		
		// 3. 결과(view -> forward) 처리
		response.sendRedirect(uri);
		//request.getRequestDispatcher(uri).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
