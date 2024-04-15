<?php

// src/EventListener/BeforeControllerListener.php
namespace App\EventListener; 

use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\HttpFoundation\RequestStack;

use App\Controller\LoginController; // Import du LoginController

class ControllerListener
{
    private $urlGenerator;
    private $requestStack;
    private $ignoredControllers; // Tableau des contrôleurs à ignorer

    public function __construct(UrlGeneratorInterface $urlGenerator, RequestStack $requestStack)
    {
        $this->urlGenerator = $urlGenerator;
        $this->requestStack = $requestStack;
        $this->ignoredControllers = [
            'App\Controller\LoginController',
        
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

        
        // Vérifier si l'utilisateur est authentifié
        if (!($session->get('user_authentication', ['is_authenticated' => false])['is_authenticated']))
        {
            $currentRoute = $event->getRequest()->attributes->get('_route');

            // Vérifier si l'utilisateur n'est pas déjà sur la page de connexion
            if ($currentRoute !== 'app_login') {
                // Redirection vers la page de connexion
                $url = $this->urlGenerator->generate('app_login');
                $response = new RedirectResponse($url);
                $event->setController(function () use ($response) {
                    return $response;
                });
            }
        }
    }
}