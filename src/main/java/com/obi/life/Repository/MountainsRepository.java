package com.obi.life.Repository;

import com.obi.life.Entity.MountainsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MountainsRepository extends JpaRepository<MountainsEntity, Long> {

    Optional<MountainsEntity> findByNameIgnoreCase(String name);
    // or
    Optional<MountainsEntity> findByFormPath(String formPath);
}