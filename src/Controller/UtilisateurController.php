<?php

namespace App\Controller;

use App\Annotations\AccesPageRole;
use App\Entity\Utilisateur;
use App\FonctionStatic\EtatMenu;
use App\Form\UtilisateurType;
use App\Repository\UtilisateurRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/utilisateur")
 */
class UtilisateurController extends AbstractController
{
    /**
     * @Route("/", name="app_utilisateur_index", methods={"GET"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function index(UtilisateurRepository $utilisateurRepository): Response
    {
        return $this->render('utilisateur/index.html.twig', [
                'utilisateurs' => $utilisateurRepository->findAll(),
            ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/new", name="app_utilisateur_new", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function new(Request $request, UtilisateurRepository $utilisateurRepository): Response
    {
        $utilisateur = new Utilisateur();
        $form = $this->createForm(UtilisateurType::class, $utilisateur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $utilisateur->setPassword(password_hash($utilisateur->getPassword(), PASSWORD_DEFAULT));

            $utilisateurRepository->add($utilisateur, true);

            return $this->redirectToRoute('app_utilisateur_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('utilisateur/new.html.twig', [
            'utilisateur' => $utilisateur,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_utilisateur_show", methods={"GET"})
     * @AccesPageRole(access="oui", exceptedRoles={""})
 */
    public function show(Utilisateur $utilisateur): Response
    {
        return $this->render('utilisateur/show.html.twig', [
            'utilisateur' => $utilisateur,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}/edit", name="app_utilisateur_edit", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function edit(Request $request, Utilisateur $utilisateur, UtilisateurRepository $utilisateurRepository): Response
    {
        $utilisateur= $utilisateur->setPassword('');
        $form = $this->createForm(UtilisateurType::class, $utilisateur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $utilisateur->setPassword(password_hash($utilisateur->getPassword(), PASSWORD_DEFAULT));

            $utilisateurRepository->add($utilisateur, true);

            return $this->redirectToRoute('app_utilisateur_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('utilisateur/edit.html.twig', [
            'utilisateur' => $utilisateur,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_utilisateur_delete", methods={"POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function delete(Request $request, Utilisateur $utilisateur, UtilisateurRepository $utilisateurRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $utilisateur->getId(), $request->request->get('_token'))) {
            $utilisateurRepository->remove($utilisateur, true);
        }

        return $this->redirectToRoute('app_utilisateur_index', [], Response::HTTP_SEE_OTHER);
    }
}
