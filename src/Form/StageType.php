<?php

namespace App\Form;

use App\Entity\Entreprise;
use App\Entity\Etudiant;
use App\Entity\Professionelle;
use App\Entity\Stage;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;

class StageType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('date', TextType::class, [
                'label' => 'Date du stage (YYYY)',
                'constraints' => [new Length(['min' => 4, 'max' => 4])]
            ])
            ->add('niveau')
            ->add('entreprise', EntityType::class, [
                'class' => Entreprise::class,
                'choice_label' => 'nom',
            ])
            ->add('etudiants', EntityType::class, [
                'class' => Etudiant::class,
                'choice_label' => function ($etudiant) {
                    return $etudiant->getNom() . ' ' . $etudiant->getPrenom();
                },
                'multiple' => true,
                'expanded' => true,
                'required' => true,
                'by_reference' => false,
            ])
            ->add('professionelles', EntityType::class, [
                'class' => Professionelle::class,
                'choice_label' => function ($professionelle) {
                    return $professionelle->getNom() . ' ' . $professionelle->getPrenom();
                },
                'multiple' => true,
                'expanded' => true,
                'required' => true,
                'by_reference' => false,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Stage::class,
        ]);
    }
}
