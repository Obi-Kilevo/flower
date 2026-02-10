package com.obi.life.Repository;

import com.obi.life.Entity.BudgetRoutesEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BudgetRepository extends JpaRepository<BudgetRoutesEntity, Long> {
}