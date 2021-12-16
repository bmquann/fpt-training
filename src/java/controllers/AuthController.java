package controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import daos.TaiKhoanDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.taikhoan;

/**
 *
 * @author manhq
 */
public class AuthController extends HttpServlet {

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
        RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
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

        TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();

        String username = request.getParameter("username");
        String pass = request.getParameter("pass");

        //Kiểm tra thông tin đăng nhập
        taikhoan userInfor = taiKhoanDAO.findUsernameANDPass(username, pass);
        if (userInfor != null) {
            //đăng nhập đúng
            //Lưu thông tin đăng nhập(session)
            taikhoan taikhoan = taiKhoanDAO.viewAll(username);
            if (taikhoan != null) {
                HttpSession session = request.getSession();
                session.setAttribute("userInfor", taikhoan);
                taikhoan objTK = (taikhoan) session.getAttribute("userInfor");
                if (objTK.getRole().getId() == 1) {
                    response.sendRedirect(request.getContextPath() + "/admin/home");
                } else if (objTK.getRole().getId() == 2) {
                    response.sendRedirect(request.getContextPath() + "/trainer");
                } else {
                    response.sendRedirect(request.getContextPath() + "/trainee");
                }

            }
        } else {
            // đăng nhập sai
            response.sendRedirect(request.getContextPath() + "/auth/login?msg=ERROR");
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
