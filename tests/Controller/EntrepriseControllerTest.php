<?php

namespace App\Test\Controller;

use App\Entity\Entreprise;
use App\Repository\EntrepriseRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class EntrepriseControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private EntrepriseRepository $repository;
    private string $path = '/entreprise/';

    public function testIndex(): void
    {
        $crawler = $this->client->request('GET', $this->path);

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Entreprise index');

        // Use the $crawler to perform additional assertions e.g.
        // self::assertSame('Some text on the page', $crawler->filter('.p')->first());
    }

    public function testNew(): void
    {
        $originalNumObjectsInRepository = count($this->repository->findAll());

        $this->markTestIncomplete();
        $this->client->request('GET', sprintf('%snew', $this->path));

        self::assertResponseStatusCodeSame(200);

        $this->client->submitForm('Save', [
            'entreprise[nom]' => 'Testing',
            'entreprise[rue]' => 'Testing',
            'entreprise[ville]' => 'Testing',
            'entreprise[pays]' => 'Testing',
            'entreprise[cp]' => 'Testing',
            'entreprise[num_rue]' => 'Testing',
            'entreprise[activite]' => 'Testing',
            'entreprise[specialisations]' => 'Testing',
        ]);

        self::assertResponseRedirects('/entreprise/');

        self::assertSame($originalNumObjectsInRepository + 1, count($this->repository->findAll()));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Entreprise();
        $fixture->setNom('My Title');
        $fixture->setRue('My Title');
        $fixture->setVille('My Title');
        $fixture->setPays('My Title');
        $fixture->setCp('My Title');
        $fixture->setNum_rue('My Title');
        $fixture->setActivite('My Title');
        $fixture->setSpecialisations('My Title');

        $this->repository->add($fixture, true);

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Entreprise');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Entreprise();
        $fixture->setNom('My Title');
        $fixture->setRue('My Title');
        $fixture->setVille('My Title');
        $fixture->setPays('My Title');
        $fixture->setCp('My Title');
        $fixture->setNum_rue('My Title');
        $fixture->setActivite('My Title');
        $fixture->setSpecialisations('My Title');

        $this->repository->add($fixture, true);

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'entreprise[nom]' => 'Something New',
            'entreprise[rue]' => 'Something New',
            'entreprise[ville]' => 'Something New',
            'entreprise[pays]' => 'Something New',
            'entreprise[cp]' => 'Something New',
            'entreprise[num_rue]' => 'Something New',
            'entreprise[activite]' => 'Something New',
            'entreprise[specialisations]' => 'Something New',
        ]);

        self::assertResponseRedirects('/entreprise/');

        $fixture = $this->repository->findAll();

        self::assertSame('Something New', $fixture[0]->getNom());
        self::assertSame('Something New', $fixture[0]->getRue());
        self::assertSame('Something New', $fixture[0]->getVille());
        self::assertSame('Something New', $fixture[0]->getPays());
        self::assertSame('Something New', $fixture[0]->getCp());
        self::assertSame('Something New', $fixture[0]->getNum_rue());
        self::assertSame('Something New', $fixture[0]->getActivite());
        self::assertSame('Something New', $fixture[0]->getSpecialisations());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();

        $originalNumObjectsInRepository = count($this->repository->findAll());

        $fixture = new Entreprise();
        $fixture->setNom('My Title');
        $fixture->setRue('My Title');
        $fixture->setVille('My Title');
        $fixture->setPays('My Title');
        $fixture->setCp('My Title');
        $fixture->setNum_rue('My Title');
        $fixture->setActivite('My Title');
        $fixture->setSpecialisations('My Title');

        $this->repository->add($fixture, true);

        self::assertSame($originalNumObjectsInRepository + 1, count($this->repository->findAll()));

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertSame($originalNumObjectsInRepository, count($this->repository->findAll()));
        self::assertResponseRedirects('/entreprise/');
    }

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->repository = (static::getContainer()->get('doctrine'))->getRepository(Entreprise::class);

        foreach ($this->repository->findAll() as $object) {
            $this->repository->remove($object, true);
        }
    }
}
