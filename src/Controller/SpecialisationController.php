<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use App\Entity\Specialisation;
use App\Form\SpecialisationType;
use App\Repository\SpecialisationRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
//PERSO
use App\FonctionStatic\EtatMenu;

/**
 * @Route("/specialisation")
 */
class SpecialisationController extends AbstractController
{
    /**
     * @Route("/", name="app_specialisation_index", methods={"GET"})
     */
    public function index(SpecialisationRepository $specialisationRepository): Response
    {
        return $this->render('specialisation/index.html.twig', [
            'specialisations' => $specialisationRepository->findAll(),
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/new", name="app_specialisation_new", methods={"GET", "POST"})
     */
    public function new(Request $request, SpecialisationRepository $specialisationRepository): Response
    {
        $specialisation = new Specialisation();
        $form = $this->createForm(SpecialisationType::class, $specialisation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $specialisationRepository->add($specialisation, true);

            // Récupérer l'URL de la page précédente
            $referer = $request->headers->get('referer');

            // Rediriger vers l'URL de la page précédente
            return $this->redirect($referer, Response::HTTP_FOUND);
        }

        return $this->renderForm('specialisation/new.html.twig', [
            'specialisation' => $specialisation,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_specialisation_show", methods={"GET"})
     */
    public function show(Specialisation $specialisation): Response
    {
        return $this->render('specialisation/show.html.twig', [
            'specialisation' => $specialisation,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}/edit", name="app_specialisation_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Specialisation $specialisation, SpecialisationRepository $specialisationRepository): Response
    {
        $form = $this->createForm(SpecialisationType::class, $specialisation);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $specialisationRepository->add($specialisation, true);

            // Récupérer l'URL de la page précédente
            $referer = $request->headers->get('referer');

            // Rediriger vers l'URL de la page précédente
            return $this->redirect($referer, Response::HTTP_FOUND);
        }

        return $this->renderForm('specialisation/edit.html.twig', [
            'specialisation' => $specialisation,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_specialisation_delete", methods={"POST"})
     */
    public function delete(Request $request, Specialisation $specialisation, SpecialisationRepository $specialisationRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $specialisation->getId(), $request->request->get('_token'))) {
            $specialisationRepository->remove($specialisation, true);
        }

        return $this->redirectToRoute('app_specialisation_index', [], Response::HTTP_SEE_OTHER);
    }
}
