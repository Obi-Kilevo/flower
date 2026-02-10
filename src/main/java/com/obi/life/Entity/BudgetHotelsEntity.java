
package com.obi.life.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "budget_hotels")
public class BudgetHotelsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "city")
    private String city;

    @Column(name = "country")
    private String country;

    @Column(name = "address")
    private String address;

    @Column(name = "price")
    private Double price;

    @Column(name = "currency")
    private String currency = "USD";

    @Column(name = "features", columnDefinition = "TEXT")
    private String features;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "form_path")
    private String formPath; // Mark as nullable=false if you want to enforce it

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    // AUTO-SET TIMESTAMPS BEFORE SAVE/CREATE
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        // Ensure currency defaults to USD if null
        if (currency == null) {
            currency = "USD";
        }
    }

    // AUTO-SET UPDATED_AT BEFORE UPDATE
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}