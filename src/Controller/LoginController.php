<?php

namespace App\Controller;

use App\Entity\Utilisateur;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class LoginController extends AbstractController
{

    /**
     * @Route("/", name="app_login")
     */
    public function login(Request $request, AuthenticationUtils $authenticationUtils): Response
    {
        // Récupérer l'erreur de connexion s'il y en a une
        $error = $authenticationUtils->getLastAuthenticationError();

        // Récupérer le dernier nom d'utilisateur saisi (s'il y en a un)
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('login.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,
        ]);
    }

    /**
     * @Route("/check-login", name="check_login")
     */
    public function checkLogin(Request $request): Response
    {
        $username = $request->request->get('_username');
        $password = $request->request->get('_password');

        // Rechercher l'utilisateur dans la base de données
        $user = $this->getDoctrine()->getRepository(Utilisateur::class)->findOneBy(['username' => $username]);

        if (!$user) {
            // Gérer le cas où l'utilisateur n'existe pas
            return $this->redirectToRoute('app_login', ['error' => 'Nom d\'utilisateur incorrect']);
        }


        // Vérifier le mot de passe
        if (password_verify($password, $user->getPassword())) {
            // Mot de passe correct, vous pouvez autoriser la connexion de l'utilisateur
            return $this->redirectToRoute('app_base');
        } else {
            // Mot de passe incorrect, gérer l'échec de connexion
            echo "Error";
            return $this->redirectToRoute('app_login', ['error' => 'Mot de passe incorrect']);
        }
    }

    /**
     * @Route("/principal", name="app_base")
     */
    public function base(Request $request, AuthenticationUtils $authenticationUtils): Response
    {
        return $this->render('base.html.twig');
    }
}