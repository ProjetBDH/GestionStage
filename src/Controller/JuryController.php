<?php

namespace App\Controller;

use App\Entity\Jury;
use App\FonctionStatic\EtatMenu;
use App\Form\JuryType;
use App\Repository\JuryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Annotations\AccesPageRole;

/**
 * @Route("/jury")
 */
class JuryController extends AbstractController
{
    /**
     * @Route("/", name="app_jury_index", methods={"GET"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function index(JuryRepository $juryRepository): Response
    {
        return $this->render('jury/index.html.twig', [
            'juries' => $juryRepository->findAll(),
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/new", name="app_jury_new", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function new(Request $request, JuryRepository $juryRepository): Response
    {
        $jury = new Jury();
        $form = $this->createForm(JuryType::class, $jury);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $juryRepository->add($jury, true);

            return $this->redirectToRoute('app_entreprise_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('jury/new.html.twig', [
            'jury' => $jury,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_jury_show", methods={"GET"})
     * @AccesPageRole(access="oui", exceptedRoles={""})
 */
    public function show(Jury $jury): Response
    {
        return $this->render('jury/show.html.twig', [
            'jury' => $jury,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}/edit", name="app_jury_edit", methods={"GET", "POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function edit(Request $request, Jury $jury, JuryRepository $juryRepository): Response
    {
        $form = $this->createForm(JuryType::class, $jury);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $juryRepository->add($jury, true);

            return $this->redirectToRoute('app_entreprise_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('jury/edit.html.twig', [
            'jury' => $jury,
            'form' => $form,
        ] + EtatMenu::getMenuData());
    }

    /**
     * @Route("/{id}", name="app_jury_delete", methods={"POST"})
     * @AccesPageRole(access="non", exceptedRoles={"Administrateur"})
     */
    public function delete(Request $request, Jury $jury, JuryRepository $juryRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $jury->getId(), $request->request->get('_token'))) {
            $juryRepository->remove($jury, true);
        }

        return $this->redirectToRoute('app_entreprise_index', [], Response::HTTP_SEE_OTHER);
    }
}
