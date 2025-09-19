workspace "Fleet Monitoring System" "Fleet monitoring system for logistics management" {

    model {
        // External actors
        frontendApp = softwareSystem "Frontend Application" "Angular web application"
        mobileApp = softwareSystem "Mobile Application" "Flutter mobile application"
        
        // Database
        database = softwareSystem "PostgreSQL Database" "Main database" "PostgreSQL" 

        // Backend system
        backendSystem = softwareSystem "Backend API System" "REST API for fleet monitoring" {
            
            // Spring Boot Container
            springBootApp = container "Spring Boot Application" "REST API for Identity & Access Management" "Java 17, Spring Boot 3.x" {
                
                // REST Controllers
                authController = component "Authentication Controller" "Authentication endpoints" "Spring REST Controller"
                userController = component "User Controller" "User management endpoints" "Spring REST Controller"
                roleController = component "Role Controller" "Role management endpoints" "Spring REST Controller"
                
                // Business Services
                authenticationService = component "Authentication Service" "Authentication and authorization logic" "Spring Service"
                userService = component "User Service" "User business logic" "Spring Service"
                roleService = component "Role Service" "Role and permission business logic" "Spring Service"
                tokenService = component "Token Service" "JWT generation and validation" "Spring Service"
                emailService = component "Email Service" "Email sending for password recovery" "Spring Service"
                
                // Security Configuration
                securityConfig = component "Security Configuration" "Spring Security configuration" "Spring Configuration"
                jwtAuthFilter = component "JWT Authentication Filter" "JWT token validation filter" "Spring Security Filter"
                
                // Repositories
                userRepository = component "User Repository" "User data access" "Spring Data JPA Repository"
                roleRepository = component "Role Repository" "Role data access" "Spring Data JPA Repository"
                refreshTokenRepository = component "Refresh Token Repository" "Refresh token data access" "Spring Data JPA Repository"
                
                // Entities
                userEntity = component "User Entity" "User entity" "JPA Entity"
                roleEntity = component "Role Entity" "Role entity" "JPA Entity"
                refreshTokenEntity = component "Refresh Token Entity" "Refresh token entity" "JPA Entity"
                
                // Utilities
                passwordEncoder = component "Password Encoder" "Password encoding" "Spring Security Component"
                jwtUtil = component "JWT Utility" "JWT handling utilities" "Spring Component"
                
                // Exception Handlers
                globalExceptionHandler = component "Global Exception Handler" "Centralized exception handling" "Spring Controller Advice"
            }
        }

        // External relationships
        frontendApp -> authController "HTTP authentication requests"
        frontendApp -> userController "HTTP user requests"
        mobileApp -> authController "HTTP authentication requests"
        mobileApp -> userController "HTTP user requests"
        
        // Controller relationships
        authController -> authenticationService "Delegates authentication logic"
        userController -> userService "Delegates user logic"
        roleController -> roleService "Delegates role logic"
        
        // Service relationships
        authenticationService -> userService "Gets user information"
        authenticationService -> tokenService "Generates and validates tokens"
        authenticationService -> passwordEncoder "Validates passwords"
        authenticationService -> emailService "Sends recovery emails"
        
        userService -> userRepository "Accesses user data"
        userService -> passwordEncoder "Encodes passwords"
        roleService -> roleRepository "Accesses role data"
        
        tokenService -> jwtUtil "Uses JWT utilities"
        tokenService -> refreshTokenRepository "Manages refresh tokens"
        
        // Security relationships
        securityConfig -> jwtAuthFilter "Configures JWT filter"
        jwtAuthFilter -> tokenService "Validates tokens"
        jwtAuthFilter -> userService "Gets user data"
        
        // Repository relationships with DB
        userRepository -> database "Reads/writes users"
        roleRepository -> database "Reads/writes roles"
        refreshTokenRepository -> database "Reads/writes tokens"
        
        // Entity relationships with repositories
        userRepository -> userEntity "Maps entity"
        roleRepository -> roleEntity "Maps entity"
        refreshTokenRepository -> refreshTokenEntity "Maps entity"
        
        // Exception handling
        authController -> globalExceptionHandler "Handles exceptions"
        userController -> globalExceptionHandler "Handles exceptions"
        roleController -> globalExceptionHandler "Handles exceptions"
    }

    views {
        component springBootApp "SpringBootIAMComponents" {
            title "Identity & Access Management - Backend Spring Boot Components"
            include *
            autoLayout lr
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Spring REST Controller" {
                background #6db33f
                color #ffffff
            }
            element "Spring Service" {
                background #0066cc
                color #ffffff
            }
            element "Spring Configuration" {
                background #ff6b35
                color #ffffff
            }
            element "Spring Security Filter" {
                background #dc3545
                color #ffffff
            }
            element "Spring Data JPA Repository" {
                background #17a2b8
                color #ffffff
            }
            element "JPA Entity" {
                background #fd7e14
                color #ffffff
            }
            element "Java Classes" {
                background #6c757d
                color #ffffff
            }
            element "Spring Security Component" {
                background #e83e8c
                color #ffffff
            }
            element "Spring Component" {
                background #20c997
                color #ffffff
            }
            element "Spring Controller Advice" {
                background #795548
                color #ffffff
            }
            element "PostgreSQL" {
                shape Cylinder
                background #ffa500
                color #ffffff
            }
        }
    }
}