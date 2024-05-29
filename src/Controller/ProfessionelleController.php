<?php

namespace App\Controller;

use App\Entity\Professionelle;
use App\FonctionStatic\EtatMenu;
use App\Form\ProfessionelleType;
use App\Repository\ProfessionelleRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Annotations\AccesPageRole;

/**
 * @Route("/professionelle")
 */
class ProfessionelleController extends AbstractController
{
    /**
     * @Route("/", name="app_professionelle_index", methods={"GET"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function index(ProfessionelleRepository $professionelleRepository): Response
    {
        return $this->render('professionelle/index.html.twig', [
            'professionelles' => $professionelleRepository->findAll(),
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/new", name="app_professionelle_new", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function new(Request $request, ProfessionelleRepository $professionelleRepository): Response
    {
        $professionelle = new Professionelle();
        $form = $this->createForm(ProfessionelleType::class, $professionelle);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $professionelleRepository->add($professionelle, true);

            return $this->redirectToRoute('app_stage_new', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('professionelle/new.html.twig', [
            'professionelle' => $professionelle,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_professionelle_show", methods={"GET"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function show(Professionelle $professionelle): Response
    {
        return $this->render('professionelle/show.html.twig', [
            'professionelle' => $professionelle,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}/edit", name="app_professionelle_edit", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function edit(Request $request, Professionelle $professionelle, ProfessionelleRepository $professionelleRepository): Response
    {
        $form = $this->createForm(ProfessionelleType::class, $professionelle);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $professionelleRepository->add($professionelle, true);

            return $this->redirectToRoute('app_professionelle_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('professionelle/edit.html.twig', [
            'professionelle' => $professionelle,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_professionelle_delete", methods={"POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function delete(Request $request, Professionelle $professionelle, ProfessionelleRepository $professionelleRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $professionelle->getId(), $request->request->get('_token'))) {
            $professionelleRepository->remove($professionelle, true);
        }

        return $this->redirectToRoute('app_professionelle_index', [], Response::HTTP_SEE_OTHER);
    }
}
