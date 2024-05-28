<?php

// src/EventListener/BeforeControllerAccesPage
namespace App\EventListener; 

use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

/*

Execution :  Avant chaque contrôleur (non ignoré), déclaré dans "services.yaml"
Rôle : vérifie que l'utilisateur s'est bien connecté

*/

class BeforeControllerAccesPage
{
    private $urlGenerator;
    private $requestStack;
    private $ignoredControllers; // Tableau des contrôleurs à ignorer
    private $adminRoutes; // Tableau des routes à ignorer

    public function __construct(UrlGeneratorInterface $urlGenerator, RequestStack $requestStack)
    {
        $this->urlGenerator = $urlGenerator;
        $this->requestStack = $requestStack;
        $this->ignoredControllers = [
            'App\Controller\LoginController',
        ];
        $this->adminRoutes = [
            'app_utilisateur_edit',
            'app_utilisateur_new',
            'app_utilisateur_delete',
            'app_etudiant_edit',
            'app_etudiant_new',
            'app_etudiant_delete',
            'app_entreprise_edit',
            'app_entreprise_new',
            'app_entreprise_delete',
            'app_stage_edit',
            'app_stage_new',
            'app_stage_delete',
            'app_professionnelle_edit',
            'app_professionnelle_new',
            'app_professionnelle_delete',
        ];
    }

    public function onKernelController(ControllerEvent $event)
    {
        $request = $this->requestStack->getCurrentRequest();
        $session = $request->getSession();

        // Récupérer le nom complet du contrôleur actuel
        $controllerName = $event->getRequest()->attributes->get('_controller');
        $controllerClass = explode('::', $controllerName)[0];

        // Vérifier si le contrôleur actuel est dans la liste des contrôleurs à ignorer
        if (in_array($controllerClass, $this->ignoredControllers)) {
            // Ne rien faire si le contrôleur est dans la liste des contrôleurs à ignorer
            return;
        }

        
        // Vérifier si l'utilisateur est connecté ou non, si connecté vérifié si l'utilisateur accede à une page autorisée
        if (!($session->get('user_authentication', ['is_authenticated' => false])['is_authenticated']))
        {
            $currentRoute = $event->getRequest()->attributes->get('_route');

            // Vérifier si l'utilisateur est déjà sur la page de connexion
            if ($currentRoute !== 'app_login') {
                // Redirection vers la page de connexion
                $url = $this->urlGenerator->generate('app_login');
                $response = new RedirectResponse($url);
                $event->setController(function () use ($response) {
                    return $response;
                });
            }
        } else {
            // Vérifier si l'utilisateur accede a une page non autorisée
            $currentRoute = $event->getRequest()->attributes->get('_route');
            if ($session->get('user_authentication')['role']!== 'Administrateur' && in_array($currentRoute, $this->adminRoutes)) {
                // Redirection vers la page d'accueil
                $url = $this->urlGenerator->generate('app_entreprise_index');
                $response = new RedirectResponse($url);
                $event->setController(function () use ($response) {
                    return $response;
                });
            }
        }
    }
}