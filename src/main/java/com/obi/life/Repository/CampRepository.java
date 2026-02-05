package com.obi.life.Repository;

import com.obi.life.Entity.CampEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CampRepository extends JpaRepository<CampEntity, Long> {
}