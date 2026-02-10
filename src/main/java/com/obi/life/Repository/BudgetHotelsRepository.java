package com.obi.life.Repository;

import com.obi.life.Entity.BudgetHotelsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BudgetHotelsRepository extends JpaRepository<BudgetHotelsEntity, Long> {
}