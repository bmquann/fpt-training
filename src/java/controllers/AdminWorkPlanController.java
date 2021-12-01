/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GiangVienDAO;
import daos.TopicDAO;
import daos.WorkPlanDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Topic;
import models.Topic_Trainer;
import models.Trainer;

/**
 *
 * @author manhq
 */
public class AdminWorkPlanController extends HttpServlet {

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

        GiangVienDAO GVDAO = new GiangVienDAO();
        List<Trainer> trainerList = GVDAO.findAll();
        request.setAttribute("trainerList", trainerList);

        WorkPlanDAO planDAO = new WorkPlanDAO();
        List<Topic_Trainer> workList = planDAO.findAll();
        request.setAttribute("workList", workList);

        RequestDispatcher rd = request.getRequestDispatcher("/views/addTrainerToTopic.jsp");
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
        WorkPlanDAO dao = new WorkPlanDAO();

        int trainerid = Integer.parseInt(request.getParameter("maGV"));
        int topicid = Integer.parseInt(request.getParameter("topicID"));

        int add = dao.add(trainerid, topicid);
        if (add > 0) {
            response.sendRedirect(request.getContextPath() + "/admin/workplan?msg=OK");
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/workplan?msg=ERROR");
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
