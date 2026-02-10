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
@Table(name = "luxury_routes")
public class LuxuryRoutesEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "park_name", nullable = false)
    private String parkName;

    @Column(name = "route_name", nullable = false)
    private String routeName;

    @Column(name = "description")
    private String description;

    @Column(name = "price")
    private Double price;

    @Column(name = "show_price")
    private Boolean showPrice = true;

    @Column(name = "status")
    private String status = "available";

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "desc_adventure_type")
    private String descAdventureType;

    @Column(name = "desc_duration")
    private String descDuration;

    @Column(name = "desc_meals")
    private String descMeals;

    @Column(name = "desc_accommodation")
    private String descAccommodation;

    @Column(name = "desc_activities")
    private String descActivities;

    @Column(name = "desc_transport")
    private String descTransport;


    @Column(name = "form_path")
    private String formPath;
}