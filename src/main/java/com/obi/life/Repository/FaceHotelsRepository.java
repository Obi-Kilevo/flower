package com.obi.life.Repository;

import com.obi.life.Entity.FaceHotelsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FaceHotelsRepository extends JpaRepository<FaceHotelsEntity, Long> {
}