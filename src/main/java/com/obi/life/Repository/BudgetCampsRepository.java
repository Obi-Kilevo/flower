package com.obi.life.Repository;

import com.obi.life.Entity.BudgetCampsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BudgetCampsRepository extends JpaRepository<BudgetCampsEntity, Long> {
}