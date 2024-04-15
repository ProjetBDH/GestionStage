<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class MainController extends AbstractController
{
    

    public function autorisation(Request $request): ?Response
    {
        $session = $request->getSession();

        if ($session->get('utilisateur_ok', false))
        {
            return $this->redirectToRoute('app_entreprise_index');
        }
        
        // Vous pouvez renvoyer null ou une réponse appropriée si aucune redirection n'est nécessaire
        return null;
    }


    //test   return $this->rrr();
    public function rrr(): Response
    {
        return $this->redirectToRoute('app_entreprise_index');
    }
}