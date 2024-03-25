<?php

namespace App\Entity;

use App\Repository\StageRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=StageRepository::class)
 */
class Stage
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
    private $date;

    /**
     * @ORM\ManyToOne(targetEntity=Entreprise::class, inversedBy="stages")
     * @ORM\JoinColumn(nullable=false)
     */
    private $entreprise;

    /**
     * @ORM\ManyToMany(targetEntity=Etudiant::class, mappedBy="stages")
     */
    private $etudiants;

    /**
     * @ORM\ManyToMany(targetEntity=Professionelle::class, mappedBy="stages")
     */
    private $professionelles;

    public function __construct()
    {
        $this->etudiants = new ArrayCollection();
        $this->professionelles = new ArrayCollection();
    }
    
    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDate(): ?string
    {
        return $this->date;
    }

    public function setDate(string $date): self
    {
        $this->date = $date;

        return $this;
    }

    public function getEntreprise(): ?Entreprise
    {
        return $this->entreprise;
    }

    public function setEntreprise(?Entreprise $entreprise): self
    {
        $this->entreprise = $entreprise;

        return $this;
    }

    /**
     * @return Collection<int, Etudiant>
     */
    public function getEtudiants(): Collection
    {
        return $this->etudiants;
    }

    public function addEtudiant(Etudiant $etudiant): self
    {
        if (!$this->etudiants->contains($etudiant)) {
            $this->etudiants[] = $etudiant;
            $etudiant->addStage($this);
        }

        return $this;
    }

    public function removeEtudiant(Etudiant $etudiant): self
    {
        if ($this->etudiants->removeElement($etudiant)) {
            $etudiant->removeStage($this);
        }

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
            $professionelle->addStage($this);
        }

        return $this;
    }

    public function removeProfessionelle(Professionelle $professionelle): self
    {
        if ($this->professionelles->removeElement($professionelle)) {
            $professionelle->removeStage($this);
        }

        return $this;
    }

}
