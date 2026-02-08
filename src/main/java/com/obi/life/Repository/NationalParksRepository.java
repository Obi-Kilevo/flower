package com.obi.life.Repository;

import com.obi.life.Entity.MountainsEntity;
import com.obi.life.Entity.NationalParksEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface NationalParksRepository extends JpaRepository<NationalParksEntity, Long> {

    List<NationalParksEntity> findAll();
    Optional<NationalParksEntity> findByFormPath(String formPath);
}