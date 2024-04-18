<?php

namespace App\FonctionStatic;

use Symfony\Component\HttpFoundation\Session\Session;

// src/FonctionStatic/etatMenu.php

class EtatMenu 
{
    public static function getMenuData(): array
    {
        
        $session = new Session();

        return [
            'userName' => $session->get('user_authentication')['name'] ?? 'ERREUR_NAME',
            'userRole' => $session->get('user_authentication')['role'] ?? 'ERREUR_ROLE'
        ];
    }
}