<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;


Class LoginController extends AbstractController {
    
    /**
     * @Route("login", name="login")
     */
    function login(Request $requeteHTTP, ManagerRegistry $doctrine):Response {

        //$login = new Login;

        

    return $this->render('login.html.twig'/*, ['username' => $username, 'password' => $password]*/);
    }
}