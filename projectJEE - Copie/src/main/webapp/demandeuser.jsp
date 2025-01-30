<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clientLogin.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>DEMANDE DE NAVETTES</title>
</head>
<body>
<!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-white">
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/images/tr.svg" width="150PX" height="40px" class="navbar-brand" >
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-dark" aria-current="page" href="home.jsp">ACCUEIL</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="navetteuser.jsp">NAVETTE</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="demandeuser.jsp" >DEMANDES DE NAVETTES</a>
                </li>
            </ul>
            <form action="loginClients.jsp" class="d-flex">
                <button class="btn btn-outline-white text-white bg-dark" type="submit">LOGIN</button>
            </form>
        </div>
    </div>
</nav>

    <br>
    <!-- form de demande de navette -->
         <form class="formu" action="DemandeNavette" method="post">
         <h2>Demande d'Offre de Navette</h2>
        <label for="name">Nom et prénom :</label>
        <input type="text" id="name" name="nameC" placeholder="Votre nom complet" required>
        
        <label for="phone">Téléphone :</label>
        <input type="tel" id="phone" name="phone" placeholder="Votre numéro de téléphone" required>
        
        <label for="email">Adresse e-mail :</label>
        <input type="email" id="email" name="email" placeholder="Votre adresse e-mail" required>
        
        <label for="departure">Ville de Départ :</label>
        <input type="text" id="departure" name="VilleD" placeholder="Point de départ" required>
        
        <label for="arrival">Ville D’arrivée :</label>
        <input type="text" id="arrival" name="VilleA" placeholder="Point d’arrivée" required>
        <br> <br>
        <button type="submit">Envoyer</button>
        </form>
  
    
 
   

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
