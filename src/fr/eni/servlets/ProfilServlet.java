package fr.eni.servlets;

import fr.eni.BusinessException;
import fr.eni.bll.UtilisateurManager;
import fr.eni.bo.Utilisateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/profil")
public class ProfilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UtilisateurManager um = new UtilisateurManager();
        String pseudo = req.getParameter("pseudo");

        if(pseudo == null || (pseudo.trim().equals(""))) {
            //si on a pas de pseudo utilisateur, c'est qu'on est arrivé par la navbar "profil"
            // on souhaite afficher le profil de l'utilisateur en cours via sa session
            HttpSession session = req.getSession();
            Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
            req.setAttribute("utilisateur", utilisateur);
            System.out.println("affichage profil servlet : pseudo de l'utilisateur connecté" + utilisateur.getPseudo());
            req.getRequestDispatcher("WEB-INF/profil.jsp").forward(req, resp);
        }else{
            //On récupère le profil à afficher (vendeur de l'article) par son pseudo car il est unique
            try {
                Utilisateur utilisateurTrouve = um.retournerUtilisateurParPseudo(pseudo);
                System.out.println(utilisateurTrouve.getNom());
                req.setAttribute("vendeur", utilisateurTrouve);
                System.out.println("affichage profil servlet : pseudo du vendeur de l'article" + utilisateurTrouve.getPseudo());
                req.getRequestDispatcher("WEB-INF/profil.jsp").forward(req, resp);
            } catch (BusinessException e) {
                e.printStackTrace();
                req.setAttribute("listeCodesErreur", e.getListeCodesErreur());
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
