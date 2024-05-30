<?php

namespace App\Controller;

use App\Entity\Stage;
use App\FonctionStatic\EtatMenu;
use App\Form\StageType;
use App\Repository\EntrepriseRepository;
use App\Repository\StageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Annotations\AccesPageRole;


/**
 * @Route("/stage")
 */
class StageController extends AbstractController
{
    /**
     * @Route("/", name="app_stage_index", methods={"GET"})
     * @AccesPageRole(access=false, exceptedRoles={"Administrateur", "Enseignant"})
     */
    public function index(StageRepository $stageRepository): Response
    {
        return $this->render('stage/index.html.twig', [
            'stages' => $stageRepository->findAll(),
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/new", name="app_stage_new", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function new(Request $request, StageRepository $stageRepository, EntrepriseRepository $entrepriseRepository): Response
    {
        $stage = new Stage();
        $id_entreprise = $request->query->get('id_entreprise');
        if ($id_entreprise) {
            $stage->setEntreprise($entrepriseRepository->find($id_entreprise));
        }

        $form = $this->createForm(StageType::class, $stage);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $stageRepository->add($stage, true);

            // Récupérer l'URL de la page précédente
            $referer = $request->headers->get('referer');

            // Rediriger vers l'URL de la page précédente
            return $this->redirect($referer, Response::HTTP_FOUND);
        }

        return $this->renderForm('stage/new.html.twig', [
            'stage' => $stage,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_stage_show", methods={"GET"})
     * @AccesPageRole(access="oui", exceptedRoles={""})
 */
    public function show(Stage $stage): Response
    {
        return $this->render('stage/show.html.twig', [
            'stage' => $stage,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}/edit", name="app_stage_edit", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function edit(Request $request, Stage $stage, StageRepository $stageRepository): Response
    {
        $form = $this->createForm(StageType::class, $stage);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $stageRepository->add($stage, true);

            // Récupérer l'URL de la page précédente
            $referer = $request->headers->get('referer');

            // Rediriger vers l'URL de la page précédente
            return $this->redirect($referer, Response::HTTP_FOUND);
        }

        return $this->renderForm('stage/edit.html.twig', [
            'stage' => $stage,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_stage_delete", methods={"POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function delete(Request $request, Stage $stage, StageRepository $stageRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $stage->getId(), $request->request->get('_token'))) {
            $stageRepository->remove($stage, true);
        }

        return $this->redirectToRoute('app_stage_index', [], Response::HTTP_SEE_OTHER);
    }
}
