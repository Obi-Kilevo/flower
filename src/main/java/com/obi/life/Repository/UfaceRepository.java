package com.obi.life.Repository;

import com.obi.life.Entity.UfaceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UfaceRepository extends JpaRepository<UfaceEntity, Long> {
}