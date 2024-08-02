package com.ljw.board_back.provider;


import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class Jwtprovider {
    
    @Value("${secret-key}")
    private String secretKey;

    
    public String create(String email){
        Date expireDate = Date.from(Instant.now().plus(1,ChronoUnit.HOURS));

        String jwt = Jwts.builder()
            .signWith(SignatureAlgorithm.ES256, secretKey)
            .setSubject(email).setIssuedAt(new Date()).setExpiration(expireDate)
            .compact();

        return jwt;
    }

    @SuppressWarnings({ "null"})
    public String validate(String jwt){

        Claims claims = null;

        try {
            claims = Jwts.parser().setSigningKey(secretKey).parseClaimsJwt(jwt).getBody();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return claims.getSubject();
    }
}
