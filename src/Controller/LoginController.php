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
        // deja logger
        $session = $request->getSession();

        if ($session->get('user_authentication', ['is_authenticated' => false])['is_authenticated'])
        {
            return $this->redirectToRoute('app_entreprise_index');
        }


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
        $session = $request->getSession();
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

            $role = $user->getRole()->getLabelle();
            $name = $user->getUsername();
            
            $session->set('user_authentication', [
                'is_authenticated' => true,
                'name' => $name,
                'role' => $role
            ]);
            // Mot de passe correct, vous pouvez autoriser la connexion de l'utilisateur
            return $this->redirectToRoute('app_entreprise_index');
        } else {
            // Mot de passe incorrect, gérer l'échec de connexion
            
            return $this->redirectToRoute('app_login', ['error' => 'Mot de passe incorrect']);
        }
    }


    /**
     * @Route("/exit-login", name="exit_login")
     */
    public function exitLogin(Request $request): Response
    {
        $session = $request->getSession();
        $session->set('user_authentication', [
            'is_authenticated' => false,
            'role' => ''
        ]);

        return $this->redirectToRoute('app_login');
    }
    
}