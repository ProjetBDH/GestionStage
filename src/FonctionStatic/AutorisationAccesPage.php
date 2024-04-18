<?php

namespace App\FonctionStatic;

use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

// src/FonctionStatic/AutorisationAccesPage.php

class AutorisationAccesPage
{
    private UrlGeneratorInterface $urlGenerator;

    public function __construct(UrlGeneratorInterface $urlGenerator)
    {
        $this->urlGenerator = $urlGenerator;
    }
    
    public static function autoriserRedirectToRoute(array $roleAutoriser = [], callable $function, UrlGeneratorInterface $urlGenerator)
    {
        $session = new Session();

        // Vérifier si l'utilisateur a le rôle autorisé
        if (in_array($session->get('user_authentication')['role'], $roleAutoriser)) {
            // Si oui, retourner la fonction passée en paramètre
            return $function;
        } else {
            // Si non, créer une redirection vers une page
            return function () use ($urlGenerator) {
                // Générer l'URL de la route pour la page not found
                $url = $urlGenerator->generate('entreprise');
                // Créer une réponse de redirection
                return new RedirectResponse($url);
            };
        }
    }


    public static function modeleRole(string $choix)
    {
        $tableau = [];
        switch ($choix) {
            case "admin":
                $tableau = ["Administrateur"];
            break;
            case "prof":
                $tableau = ["Enseignent", "Administrateur"];
            break;
            default:
                $tableau = [];
        }
    }
}