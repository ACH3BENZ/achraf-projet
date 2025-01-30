package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class GetUserIdServlet
 */
@WebServlet("/loginClients")
public class loginClients extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginClients () {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Étape 1 : Connexion à la base de données
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cars", "root", "");

            // Étape 2 : Récupérer les paramètres utilisateur
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
                request.setAttribute("message", "Veuillez remplir tous les champs.");
                request.getRequestDispatcher("loginClients.jsp").forward(request, response);
                return;
            }

            // Étape 3 : Préparer la requête SQL
            String query = "SELECT id_client FROM clients WHERE email = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);

            // Étape 4 : Exécuter la requête
            rs = ps.executeQuery();

            if (rs.next()) {
                // Récupérer l'ID depuis la base
                int id_client = rs.getInt("id_client");

                // Étape 5 : Stocker l'ID dans la session
                HttpSession session = request.getSession();
                session.setAttribute("id_client", id_client);
                session.setAttribute("email", email);

                // Redirection vers la page de session
                response.sendRedirect("navetteClients.jsp");
            } else {
                // Si aucune correspondance trouvée
                request.setAttribute("message", "Email ou mot de passe incorrect.");
                request.getRequestDispatcher("loginClients.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Une erreur est survenue. Veuillez réessayer plus tard.");
            request.getRequestDispatcher("loginClients.jsp").forward(request, response);
        } finally {
            // Étape 6 : Fermer les ressources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
