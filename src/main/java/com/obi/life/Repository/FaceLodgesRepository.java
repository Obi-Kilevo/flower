package com.obi.life.Repository;

import com.obi.life.Entity.FaceLodgesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FaceLodgesRepository extends JpaRepository<FaceLodgesEntity, Long> {
}