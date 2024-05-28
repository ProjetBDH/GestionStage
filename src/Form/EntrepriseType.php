<?php

namespace App\Form;

use App\Entity\Activite;
use App\Entity\Entreprise;
use App\Entity\Specialisation;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EntrepriseType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', TextType::class)
            ->add('rue', TextType::class)
            ->add('ville', TextType::class)
            ->add('pays', TextType::class)
            ->add('cp', TextType::class)
            ->add('num_rue', TextType::class)
            ->add('activite', EntityType::class, [
                'class' => Activite::class,
                'choice_label' => 'labelle',
                'placeholder' => 'Sélectionner une activité',
            ])
            ->add('specialisations', EntityType::class, [
                'class' => Specialisation::class,
                'choice_label' => 'labelle',
                'multiple' => true,
                'expanded' => true,
                'by_reference' => false,
                'placeholder' => 'Sélectionner des spécialisations',
            ]);;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Entreprise::class,
        ]);
    }
}
