<?php

namespace App\Entity;

use App\Repository\StatutRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=StatutRepository::class)
 */
class Statut
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $labelle;

    /**
     * @ORM\ManyToMany(targetEntity=Professionelle::class, inversedBy="statuts")
     */
    private $professionelles;

    public function __construct()
    {
        $this->professionelles = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLabelle(): ?string
    {
        return $this->labelle;
    }

    public function setLabelle(string $labelle): self
    {
        $this->labelle = $labelle;

        return $this;
    }

    /**
     * @return Collection<int, Professionelle>
     */
    public function getProfessionelles(): Collection
    {
        return $this->professionelles;
    }

    public function addProfessionelle(Professionelle $professionelle): self
    {
        if (!$this->professionelles->contains($professionelle)) {
            $this->professionelles[] = $professionelle;
        }

        return $this;
    }

    public function removeProfessionelle(Professionelle $professionelle): self
    {
        $this->professionelles->removeElement($professionelle);

        return $this;
    }
}
