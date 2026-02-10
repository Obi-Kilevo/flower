package com.obi.life.Repository;

import com.obi.life.Entity.FaceRouteEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FaceRouteRepository extends JpaRepository<FaceRouteEntity, Long> {
}
