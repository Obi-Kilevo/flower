package com.obi.life.Repository;

import com.obi.life.Entity.LuxuryHotelsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LuxuryHotelsRepository extends JpaRepository<LuxuryHotelsEntity, Long> {

}
