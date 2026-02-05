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
@Table(name = "luxury_hotels")
public class LuxuryHotelsEntity {

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

    @Column(name = "price", nullable = true)  // Add nullable = true
    private Double price;

    @Column(name = "currency")
    private String currency = "USD";

    // CHANGED: Remove JSON annotations, use TEXT
    @Column(name = "features", columnDefinition = "TEXT")
    private String features;

    @Column(name = "image_url")  // ADD THIS ANNOTATION
    private String imageUrl;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}