<?php

namespace App\Entity;

use App\Repository\EtudiantRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=EtudiantRepository::class)
 */
class Etudiant
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
    private $nom;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $prenom;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $specialisation;

    /**
     * @ORM\ManyToMany(targetEntity=Stage::class, inversedBy="etudiants")
     */
    private $stages;

    public function __construct()
    {
        $this->stages = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self
    {
        $this->prenom = $prenom;

        return $this;
    }
//
//    public function getEmail(): ?string
//    {
//        return $this->email;
//    }
//
//    public function setEmail(string $email): self
//    {
//        $this->email = $email;
//
//        return $this;
//    }
//
//    public function getNumTel(): ?string
//    {
//        return $this->numTel;
//    }
//
//    public function setNumTel(string $numTel): self
//    {
//        $this->numTel = $numTel;
//
//        return $this;
//    }

    public function getSpecialisation(): ?string
    {
        return $this->specialisation;
    }

    public function setSpecialisation(string $specialisation): self
    {
        $this->specialisation = $specialisation;

        return $this;
    }

    /**
     * @return Collection<int, Stage>
     */
    public function getStages(): Collection
    {
        return $this->stages;
    }

    public function addStage(Stage $stage): self
    {
        if (!$this->stages->contains($stage)) {
            $this->stages[] = $stage;
        }

        return $this;
    }

    public function removeStage(Stage $stage): self
    {
        $this->stages->removeElement($stage);

        return $this;
    }

}
