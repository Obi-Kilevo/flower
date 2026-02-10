package com.obi.life.Repository;

import com.obi.life.Entity.LuxuryRoutesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LuxuryRoutesRepository extends JpaRepository<LuxuryRoutesEntity, Long> {
}