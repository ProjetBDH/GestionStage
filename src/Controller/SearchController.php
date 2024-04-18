<?php

namespace App\Controller;

use App\FonctionStatic\EtatMenu;
use App\Form\SearchFormType;
use App\Form\SearchType;
use App\Repository\EntrepriseRepository;
use App\Repository\EtudiantRepository;
use App\Repository\ProfessionelleRepository;
use App\Repository\StageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SearchController extends AbstractController
{
    /**
     * @Route("/search", name="app_search")
     */
    public function search(Request $request,
                           EntrepriseRepository $entrepriseRepository,
                           StageRepository $stageRepository,
                           EtudiantRepository $etudiantRepository,
                           ProfessionelleRepository $professionnelleRepository): Response
    {
        $searchForm = $this->createForm(SearchType::class);
        $searchForm->handleRequest($request);

        $results = [];

        if ($searchForm->isSubmitted() && $searchForm->isValid()) {
            $criteria = $searchForm->getData()['search'];

            // Utilisez les critères pour interroger la base de données
            $results['entreprises'] = $entrepriseRepository->search($criteria);
            $results['stages'] = $stageRepository->search($criteria);
            $results['etudiants'] = $etudiantRepository->search($criteria);
            $results['professionnels'] = $professionnelleRepository->search($criteria);
        }

        return $this->render('search/index.html.twig', [
            'searchForm' => $searchForm->createView(),
            'results' => $results,
        ] + EtatMenu::getMenuData());
    }
}
