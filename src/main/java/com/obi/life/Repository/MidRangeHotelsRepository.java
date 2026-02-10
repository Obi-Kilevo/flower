package com.obi.life.Repository;

import com.obi.life.Entity.MidrangeHotelsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MidRangeHotelsRepository extends JpaRepository<MidrangeHotelsEntity, Long> {
}