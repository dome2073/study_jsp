package org.zerock.ex;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;



/**
 * Servlet implementation class TempPwServlet
 */
@WebServlet("/temp")
public class TempPwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TempPwServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//MimeType
		response.setContentType("image/gif");
		
		OutputStream out = response.getOutputStream();

		BufferedImage image = new BufferedImage(300, 300,  BufferedImage.TYPE_INT_BGR);
			
		Graphics g = image.getGraphics(); //붓을 얻어온다
		
		g.setColor(Color.pink);
		
		g.fillRect(0, 0, 300, 300);
		
		//이미지위에 썪을값
		int value = (int)(Math.random() * 100000);
		
		request.getSession().setAttribute("pw", value);
		
		g.setColor(Color.black);
		
		Font f4 = new Font("Serif", Font.BOLD+Font.ITALIC, 40);
		
		g.setFont(f4);
		
		g.drawString(""+value, 100, 150);
		
		
		
		ImageIO.write(image, "GIF", out); 
	}

}
