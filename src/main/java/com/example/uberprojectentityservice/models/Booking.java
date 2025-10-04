package com.example.uberprojectentityservice.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Booking extends BaseModel{

    @Enumerated(value=EnumType.STRING)
    private BookingSatus bookingStatus;

    @Temporal(TemporalType.TIMESTAMP)
    private Date startTime;

    @Temporal(TemporalType.TIMESTAMP)
    private Date endTime;

    private Long totalDistance;

    @ManyToOne(fetch = FetchType.LAZY)
    private Driver driver; // many bookings can be associated with one driver

    @ManyToOne(fetch = FetchType.LAZY)
    private Passenger passenger; // many bookings can be associated with one passenger

    @OneToOne
    private ExactLocation startLocation;

    @OneToOne
    private ExactLocation endLocation;
}
