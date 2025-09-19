workspace "Fleet Monitoring System" "Fleet monitoring system for logistics management" {

    model {
        // External actors
        logisticManager = person "Logistics Manager" "Manages and supervises fleet operations"
        endCustomer = person "End Customer" "Monitors their orders and deliveries"

        // Backend system
        backendSystem = softwareSystem "Backend API" "Backend system that handles business logic"

        // Frontend system
        frontendSystem = softwareSystem "Frontend Web Application" "Angular web application for fleet monitoring" {
            
            // Angular Container
            angularApp = container "Angular Application" "Single Page Web Application" "Angular 17, TypeScript" {
                
                // Authentication and Authorization Components
                loginComponent = component "Login Component" "User login interface" "Angular Component"
                registerComponent = component "Register Component" "User registration interface" "Angular Component"
                forgotPasswordComponent = component "Forgot Password Component" "Password recovery interface" "Angular Component"
                
                // Authentication Services
                authService = component "Authentication Service" "Handles authentication operations" "Angular Service"
                tokenService = component "Token Service" "Manages JWT and refresh tokens" "Angular Service"
                
                // Guards and Interceptors
                authGuard = component "Auth Guard" "Protects routes requiring authentication" "Angular Guard"
                roleGuard = component "Role Guard" "Protects routes based on user roles" "Angular Guard"
                authInterceptor = component "Auth Interceptor" "Intercepts HTTP requests to add tokens" "Angular Interceptor"
                
                // User Management Components
                userProfileComponent = component "User Profile Component" "User profile management" "Angular Component"
                userManagementComponent = component "User Management Component" "User administration (admin only)" "Angular Component"
                
                // User Management Services
                userService = component "User Service" "Handles user operations" "Angular Service"
                roleService = component "Role Service" "Manages roles and permissions" "Angular Service"
                
                // Local Storage
                localStorageService = component "Local Storage Service" "Manages browser local storage" "Angular Service"
                
                // Models and DTOs
                userModel = component "User Models" "User data models" "TypeScript Interfaces"
                authModel = component "Auth Models" "Authentication models" "TypeScript Interfaces"
            }
        }

        // Relationships between actors and system
        logisticManager -> loginComponent "Logs in to manage users"
        endCustomer -> loginComponent "Logs in to view their orders"
        
        // Component relationships
        loginComponent -> authService "Uses for authentication"
        registerComponent -> authService "Uses for user registration"
        forgotPasswordComponent -> authService "Uses for password recovery"
        
        authService -> tokenService "Manages tokens"
        authService -> userService "Gets user information"
        authService -> backendSystem "Sends credentials for validation"
        
        tokenService -> localStorageService "Stores tokens locally"
        
        authGuard -> tokenService "Validates tokens"
        roleGuard -> roleService "Verifies permissions"
        authInterceptor -> tokenService "Gets token for requests"
        
        userProfileComponent -> userService "Gets and updates profile"
        userManagementComponent -> userService "Manages users"
        userManagementComponent -> roleService "Manages roles"
        
        userService -> backendSystem "CRUD operations for users"
        roleService -> backendSystem "Role and permission operations"
        
        // Model usage
        authService -> userModel "Uses"
        authService -> authModel "Uses"
        userService -> userModel "Uses"
    }

    views {
        component angularApp "AngularIAMComponents" {
            title "Identity & Access Management - Frontend Angular Components"
            include *
            autoLayout lr
        }

        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
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
            element "Angular Component" {
                background #dd0031
                color #ffffff
            }
            element "Angular Service" {
                background #0f7b0f
                color #ffffff
            }
            element "Angular Guard" {
                background #ff6b35
                color #ffffff
            }
            element "Angular Interceptor" {
                background #9c27b0
                color #ffffff
            }
            element "TypeScript Interfaces" {
                background #3178c6
                color #ffffff
            }
        }
    }
}