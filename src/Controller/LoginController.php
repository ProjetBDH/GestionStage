<?php
namespace App\Controller;

use App\Entity\Abonne;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\Routing\Annotation\Route;


Class LoginController extends AbstractController {
    
    /**
     * @Route("login", name="login")
     */
    function login() {

        //$login = new Login;


    return $this->render('login.html.twig'/*, ['username' => $username, 'password' => $password]*/);
    }
}