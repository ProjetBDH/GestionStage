<?php

namespace App\Test\Controller;

use App\Entity\Specialisation;
use App\Repository\SpecialisationRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class SpecialisationControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private SpecialisationRepository $repository;
    private string $path = '/specialisation/';

    public function testIndex(): void
    {
        $crawler = $this->client->request('GET', $this->path);

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Specialisation index');

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
            'specialisation[labelle]' => 'Testing',
            'specialisation[entreprises]' => 'Testing',
        ]);

        self::assertResponseRedirects('/specialisation/');

        self::assertSame($originalNumObjectsInRepository + 1, count($this->repository->findAll()));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Specialisation();
        $fixture->setLabelle('My Title');
        $fixture->setEntreprises('My Title');

        $this->repository->add($fixture, true);

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Specialisation');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Specialisation();
        $fixture->setLabelle('My Title');
        $fixture->setEntreprises('My Title');

        $this->repository->add($fixture, true);

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'specialisation[labelle]' => 'Something New',
            'specialisation[entreprises]' => 'Something New',
        ]);

        self::assertResponseRedirects('/specialisation/');

        $fixture = $this->repository->findAll();

        self::assertSame('Something New', $fixture[0]->getLabelle());
        self::assertSame('Something New', $fixture[0]->getEntreprises());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();

        $originalNumObjectsInRepository = count($this->repository->findAll());

        $fixture = new Specialisation();
        $fixture->setLabelle('My Title');
        $fixture->setEntreprises('My Title');

        $this->repository->add($fixture, true);

        self::assertSame($originalNumObjectsInRepository + 1, count($this->repository->findAll()));

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertSame($originalNumObjectsInRepository, count($this->repository->findAll()));
        self::assertResponseRedirects('/specialisation/');
    }

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->repository = (static::getContainer()->get('doctrine'))->getRepository(Specialisation::class);

        foreach ($this->repository->findAll() as $object) {
            $this->repository->remove($object, true);
        }
    }
}
