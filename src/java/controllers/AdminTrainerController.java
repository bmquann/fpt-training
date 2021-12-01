/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import daos.GiangVienDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Trainer;

/**
 *
 * @author manhq
 */
@WebServlet(name = "AdminTrainerController", urlPatterns = {"/admin/trainer"})
public class AdminTrainerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession session = request.getSession();
		if(session.getAttribute("userInfor") == null) {
			response.sendRedirect(request.getContextPath()+"/auth/login");
			return;
		}
		
		GiangVienDAO giangvienDAO = new GiangVienDAO();
		List<Trainer> giangvienList = giangvienDAO.findAll();
		request.setAttribute("giangvienList", giangvienList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/trainer.jsp");
		rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		GiangVienDAO giangvienDAO = new GiangVienDAO();
		
		
		int	magv = Integer.parseInt(request.getParameter("magv"));
		
		String tengv = request.getParameter("tengv");
		String diachi = request.getParameter("diachi");
		int sdt = 0;
		try {
			sdt = Integer.parseInt(request.getParameter("sdt"));
		} catch (NumberFormatException e) {
			System.out.println("Lỗi..!");
		}
		String email = request.getParameter("email");

		Trainer objGV = new Trainer(magv, tengv, diachi, sdt, email);
		int add = giangvienDAO.add(objGV);
		if(add > 0) {
			response.sendRedirect(request.getContextPath()+"/admin/trainer?msg=OK");
			return;
		}else {
			response.sendRedirect(request.getContextPath()+"/admin/trainer?msg=ERROR");
			return;
		}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
