package com.obi.life.Entity;





import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "nationalparks")
public class NationalParksEntity {

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
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at")
    private LocalDateTime updatedAt = LocalDateTime.now();


    @Column(name = "animalnumber")
    private String animalNumber;

    @Column(name = "visittime")
    private String visitTime;



    @Column(name = "image_url")
    private String imageUrl;

    @Column(name = "form_path")
    private String formPath;
}