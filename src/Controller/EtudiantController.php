<?php

namespace App\Controller;

use App\Entity\Etudiant;
use App\FonctionStatic\EtatMenu;
use App\Form\EtudiantType;
use App\Repository\EtudiantRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Annotations\AccesPageRole;

/**
 * @Route("/etudiant")
 */
class EtudiantController extends AbstractController
{
    /**
     * @Route("/", name="app_etudiant_index", methods={"GET"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function index(EtudiantRepository $etudiantRepository): Response
    {
        return $this->render('etudiant/index.html.twig', [
            'etudiants' => $etudiantRepository->findAll(),
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/new", name="app_etudiant_new", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function new(Request $request, EtudiantRepository $etudiantRepository): Response
    {
        $etudiant = new Etudiant();
        $form = $this->createForm(EtudiantType::class, $etudiant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $etudiantRepository->add($etudiant, true);

            return $this->redirectToRoute('app_stage_new', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('etudiant/new.html.twig', [
            'etudiant' => $etudiant,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_etudiant_show", methods={"GET"})
     * @AccesPageRole(access="oui", exceptedRoles={""})
 */
    public function show(Etudiant $etudiant): Response
    {
        return $this->render('etudiant/show.html.twig', [
            'etudiant' => $etudiant,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}/edit", name="app_etudiant_edit", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function edit(Request $request, Etudiant $etudiant, EtudiantRepository $etudiantRepository): Response
    {
        $form = $this->createForm(EtudiantType::class, $etudiant);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $etudiantRepository->add($etudiant, true);

            return $this->redirectToRoute('app_etudiant_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('etudiant/edit.html.twig', [
            'etudiant' => $etudiant,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_etudiant_delete", methods={"POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function delete(Request $request, Etudiant $etudiant, EtudiantRepository $etudiantRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $etudiant->getId(), $request->request->get('_token'))) {
            $etudiantRepository->remove($etudiant, true);
        }

        return $this->redirectToRoute('app_etudiant_index', [], Response::HTTP_SEE_OTHER);
    }
}
