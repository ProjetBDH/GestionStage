<?php

namespace App\Entity;

use App\Repository\JuryRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=JuryRepository::class)
 */
class Jury
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=4)
     */
    private $date;

    /**
     * @ORM\ManyToMany(targetEntity=Professionelle::class, inversedBy="juries")
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

    public function getDate(): ?string
    {
        return $this->date;
    }

    public function setDate(string $date): self
    {
        $this->date = $date;

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
