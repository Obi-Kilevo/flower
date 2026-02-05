package com.obi.life.Repository;

import com.obi.life.Entity.NationalParksEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NationalParksRepository extends JpaRepository<NationalParksEntity, Long> {
}