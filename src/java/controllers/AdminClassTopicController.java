/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.ClassTopicDAO;
import daos.LopDAO;
import daos.TopicDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Class_Topic;
import models.Lop;
import models.Topic;

/**
 *
 * @author manhq
 */
public class AdminClassTopicController extends HttpServlet {

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

        TopicDAO topicDao = new TopicDAO();
        List<Topic> list = topicDao.findAll();
        request.setAttribute("topicList", list);

        LopDAO lopDAO = new LopDAO();
        List<Lop> classList = lopDAO.findAll();
        request.setAttribute("classList", classList);

        ClassTopicDAO CTDAO = new ClassTopicDAO();
        List<Class_Topic> CTList = CTDAO.findAll();
        request.setAttribute("CTList", CTList);

        RequestDispatcher rd = request.getRequestDispatcher("/views/ClassTopic.jsp");
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
        ClassTopicDAO dao = new ClassTopicDAO();

        int classid = Integer.parseInt(request.getParameter("malop"));
        int topicid = Integer.parseInt(request.getParameter("topicid"));

        int add = dao.add(topicid, classid);
        if (add > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/classtopic?msg=OK");
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/classtopic?msg=ERROR");
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
