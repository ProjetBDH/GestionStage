<?php

namespace App\Form;

use App\Entity\Professionelle;
use App\Entity\Statut;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProfessionelleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom')
            ->add('prenom')
            ->add('email')
            ->add('numTel')
            ->add('metier')
            ->add('statuts', EntityType::class, [
                'class' => Statut::class,
                'choice_label' => 'labelle',
                'multiple' => true,
                'by_reference' => false
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Professionelle::class,
        ]);
    }
}
