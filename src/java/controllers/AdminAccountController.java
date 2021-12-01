/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.RolesDAO;
import daos.TaiKhoanDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.roles;
import models.taikhoan;

/**
 *
 * @author manhq
 */
public class AdminAccountController extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session.getAttribute("userInfor") == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return;
        }

        TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();
        List<taikhoan> accList = taiKhoanDAO.findAll();
        request.setAttribute("accList", accList);

        RolesDAO rolesDAO = new RolesDAO();
        List<roles> roleList = rolesDAO.findAll();
        request.setAttribute("roleList", roleList);

        RequestDispatcher rd = request.getRequestDispatcher("/views/Account.jsp");
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

        String password = request.getParameter("password");

        String email = request.getParameter("email");

        int role = 0;

        try {
            role = Integer.parseInt(request.getParameter("roleId"));
        } catch (NumberFormatException e) {
            System.out.println("Lỗi ... !");
        }

        taikhoan objTK = new taikhoan(0, username, password, email, new roles(role, null));
        int add = taiKhoanDAO.add(objTK);
        if (add > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/account?msg=OK");
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/account?msg=ERROR");
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
