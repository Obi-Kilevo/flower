package com.obi.life.Repository;

import com.obi.life.Entity.MidRangeRouteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MidRangeRouteRepository extends JpaRepository<MidRangeRouteEntity, Long> {

    Optional<MidRangeRouteEntity> findByFormPath(String formPath);
}