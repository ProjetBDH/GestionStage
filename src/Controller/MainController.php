<?php

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class MainController extends AbstractController
{
    //methode verifi
    public function Autorisation()
    {
        if ($session->get('utilisateur_ok', false))
        {
            return $this->redirectToRoute('app_login');
        }
        
    }
}