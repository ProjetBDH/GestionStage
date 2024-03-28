<?php

namespace App\Form;

use App\Entity\Entreprise;
use App\Entity\Etudiant;
use App\Entity\Professionelle;
use App\Entity\Stage;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class StageType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('date')
            ->add('niveau')
            ->add('entreprise',EntityType::class, [
                'class' => Entreprise::class,
                'choice_label' => 'nom',
            ])
            ->add('etudiants', EntityType::class, [
                'class' => Etudiant::class,
                'choice_label' => 'nom',
                'multiple' => true,
                'expanded' => true,
            ])
            ->add('professionelles',EntityType::class, [
                'class' => Professionelle::class,
                'choice_label' => 'nom',
                'multiple' => true,
                'expanded' => true,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Stage::class,
        ]);
    }
}
