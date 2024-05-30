<?php

namespace App\Controller;

use App\Entity\Statut;
use App\FonctionStatic\EtatMenu;
use App\Form\StatutType;
use App\Repository\StatutRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Annotations\AccesPageRole;

/**
 * @Route("/statut")
 */
class StatutController extends AbstractController
{
    /**
     * @Route("/", name="app_statut_index", methods={"GET"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function index(StatutRepository $statutRepository): Response
    {
        return $this->render('statut/index.html.twig', [
            'statuts' => $statutRepository->findAll(),
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/new", name="app_statut_new", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function new(Request $request, StatutRepository $statutRepository): Response
    {
        $statut = new Statut();
        $form = $this->createForm(StatutType::class, $statut);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $statutRepository->add($statut, true);

            // Récupérer l'URL de la page précédente
            $referer = $request->headers->get('referer');

            // Rediriger vers l'URL de la page précédente
            return $this->redirect($referer, Response::HTTP_FOUND);
        }

        return $this->renderForm('statut/new.html.twig', [
            'statut' => $statut,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_statut_show", methods={"GET"})
     * @AccesPageRole(access="oui", exceptedRoles={""})
 */
    public function show(Statut $statut): Response
    {
        return $this->render('statut/show.html.twig', [
            'statut' => $statut,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}/edit", name="app_statut_edit", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function edit(Request $request, Statut $statut, StatutRepository $statutRepository): Response
    {
        $form = $this->createForm(StatutType::class, $statut);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $statutRepository->add($statut, true);

            // Récupérer l'URL de la page précédente
            $referer = $request->headers->get('referer');

            // Rediriger vers l'URL de la page précédente
            return $this->redirect($referer, Response::HTTP_FOUND);
        }

        return $this->renderForm('statut/edit.html.twig', [
            'statut' => $statut,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_statut_delete", methods={"POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function delete(Request $request, Statut $statut, StatutRepository $statutRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $statut->getId(), $request->request->get('_token'))) {
            $statutRepository->remove($statut, true);
        }

        return $this->redirectToRoute('app_statut_index', [], Response::HTTP_SEE_OTHER);
    }
}
