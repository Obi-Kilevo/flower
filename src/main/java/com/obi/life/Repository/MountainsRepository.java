package com.obi.life.Repository;

import com.obi.life.Entity.MountainsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MountainsRepository extends JpaRepository<MountainsEntity, Long> {
}