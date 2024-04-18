<?php

namespace App\Repository;

use App\Entity\Professionelle;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Professionelle>
 *
 * @method Professionelle|null find($id, $lockMode = null, $lockVersion = null)
 * @method Professionelle|null findOneBy(array $criteria, array $orderBy = null)
 * @method Professionelle[]    findAll()
 * @method Professionelle[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProfessionelleRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Professionelle::class);
    }

    public function add(Professionelle $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Professionelle $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

//    /**
//     * @return Professionelle[] Returns an array of Professionelle objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('p.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Professionelle
//    {
//        return $this->createQueryBuilder('p')
//            ->andWhere('p.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
    public function search(string $criteria)
    {
        $qb = $this->createQueryBuilder('p');

        if (!empty($criteria)) {
            $qb->andWhere('p.nom LIKE :nom')
                ->orWhere('p.prenom LIKE :prenom')
                ->orWhere('p.email LIKE :email')
                ->orWhere('p.numTel LIKE :telephone')
                ->setParameter('nom', '%'.$criteria.'%')
                ->setParameter('prenom', '%'.$criteria.'%')
                ->setParameter('email', '%'.$criteria.'%')
                ->setParameter('telephone', '%'.$criteria.'%');
        }

        return $qb->getQuery()->getResult();
    }
}
