package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FortuneAction
 */
@WebServlet("/ForturnAction")
public class FortuneAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FortuneAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		out.println("<meta charset='UTF-8'>");
		out.println("<h1>이름 : "+name+"</h1>");
		out.println("<h1>생일 :"+birth+".</h1>");
		out.println("<h1>성별" + gender +"</h1>");
		
		if(birth.equals("19951024")) {
			out.println("<h2>운세 총운은 '청출어람' 입니다.</h2>");

			out.println("<h2>주인 없는 풍요로운 들판을 지나듯 이익이 사방에 널려 있는 것 같은 느낌이 드는 하루입니다. 기대하지 않던 곳에서 뜻밖의 희소식을 듣게 되는 일도 있습니다. 그토록 바래왔던 일이 바로 성사되는 기쁨을 맛 볼 수도 있으며 행운의 중심에 자신이 주인공으로 있는 듯한 기분을 느낄 수 있습니다. 여유로운 마음과 풍족한 생활로 인해 자신이 걸어가는 길이 좀 더 편안해 지는 것을 느낄 수 있습니다. 이는 곧 길을 가다 야생의 사과나무며 잣나무 따위를 발견하는 것처럼 오늘은 어디를 가도 좋은 일이 생깁니다</h2>");
		}	
		out.println("</body>");
		out.println("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
