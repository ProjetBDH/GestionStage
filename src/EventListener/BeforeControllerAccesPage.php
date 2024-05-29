<?php
// src/EventListener/BeforeControllerAccesPage

namespace App\EventListener;

use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\HttpKernel\Event\ControllerEvent;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Doctrine\Common\Annotations\AnnotationReader;
use App\Annotations\AccesPageRole;

/*

Execution :  Avant chaque contrôleur (non ignoré), déclaré dans "services.yaml"
Rôle : vérifie que l'utilisateur s'est bien connecté

*/

class BeforeControllerAccesPage
{
    private $urlGenerator;
    private $requestStack;

    public function __construct(UrlGeneratorInterface $urlGenerator, RequestStack $requestStack)
    {
        $this->urlGenerator = $urlGenerator;
        $this->requestStack = $requestStack;
    }


    public function onKernelController(ControllerEvent $event)
    {
        // Récupérer le contrôleur actuel
        $controller = $event->getController();

        // ignore si le controller est login ou s'il est un tableau 
        
        if (!is_array($controller) || get_class($controller[0]) === 'App\Controller\LoginController') {
            return;
        }

        // Obtenir la méthode de contrôleur actuelle
        $method = new \ReflectionMethod($controller[0], $controller[1]);

        // Obtenir le cookie de session
        $request = $this->requestStack->getCurrentRequest();
        $session = $request->getSession();

        // Lire l'annotation @AccesPageRole
        $reader = new AnnotationReader();
        $accesPageRoleAnnotation = $reader->getMethodAnnotation($method, AccesPageRole::class);

        // Nom de la route actuel
        $currentRoute = $event->getRequest()->attributes->get('_route');


        // Formatage de l'objet $accesPageRoleAnnotation
        if ($accesPageRoleAnnotation !== null) {
            if (!is_bool($accesPageRoleAnnotation->access)) {
                $accesPageRoleAnnotation->access = in_array($accesPageRoleAnnotation->access, ["oui", "yes", "authorise"]); //si dans la liste; $accesP... = true, si non false (par defaut)
            }
        } else {
            $accesPageRoleAnnotation = (object) ['access' => false, 'exceptedRoles' => []];
        }
        // Vérifier si l'utilisateur s'est bien connecter
        if (!($session->get('user_authentication', ['is_authenticated' => false])['is_authenticated'])) {
            
            // Vérifier si l'utilisateur n'est pas déjà sur la page de connexion
            if ($currentRoute !== 'app_login') {
                // Redirection vers la page de connexion
                $url = $this->urlGenerator->generate('app_login');
                $response = new RedirectResponse($url);
                $event->setController(function () use ($response) {
                    return $response;
                });
            }

            // Vérifier si l'utilisateur accède a une page non autorisée
        } else {

            if (in_array($session->get('user_authentication')['role'], $accesPageRoleAnnotation->exceptedRoles) == $accesPageRoleAnnotation->access) {
                // Redirection vers la page d'accueil
                
                $url = $this->urlGenerator->generate('app_login'); //( Note : Double redirection, redirige vers la page de connexion, qui redirige ensuite vers la page d'accueil de l'entreprise.)
                $response = new RedirectResponse($url);
                $event->setController(function () use ($response) {
                    return $response;
                });
            }
        }
    }
}
