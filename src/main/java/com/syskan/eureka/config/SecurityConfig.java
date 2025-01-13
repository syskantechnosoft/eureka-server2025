package com.syskan.eureka.config;

//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig {
//
//    @Bean
//    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//        http
//            .csrf().disable()
//            .authorizeHttpRequests()
//            .requestMatchers("/actuator/**").permitAll()
//            .requestMatchers("/eureka/**").hasRole("ADMIN")
//            .anyRequest().authenticated()
//            .and()
//            .httpBasic();
//        return http.build();
//    }
//}