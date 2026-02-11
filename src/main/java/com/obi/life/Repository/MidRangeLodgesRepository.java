package com.obi.life.Repository;

import com.obi.life.Entity.MidRangeLodgesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MidRangeLodgesRepository extends JpaRepository<MidRangeLodgesEntity, Long> {
}