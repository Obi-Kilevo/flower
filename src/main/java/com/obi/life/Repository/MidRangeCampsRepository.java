package com.obi.life.Repository;

import com.obi.life.Entity.MidRangeCampsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MidRangeCampsRepository extends JpaRepository<MidRangeCampsEntity, Long> {
}