workspace "Fleet Monitoring System" "Fleet monitoring system for logistics management" {

    model {
        // External actors
        logisticManager = person "Logistics Manager" "Manages operations from mobile device"
        endCustomer = person "End Customer" "Monitors orders from mobile device"

        // External systems
        backendSystem = softwareSystem "Backend API" "Backend system that handles business logic"
        
        // Local database
        sqliteDB = softwareSystem "SQLite Local Database" "Mobile device local database" "SQLite"

        // Mobile system
        mobileSystem = softwareSystem "Mobile Flutter Application" "Mobile application for fleet monitoring" {
            
            // Flutter Container
            flutterApp = container "Flutter Application" "Cross-platform mobile application" "Flutter, Dart" {
                
                // Authentication Screens
                loginScreen = component "Login Screen" "Login screen" "Flutter StatefulWidget"
                registerScreen = component "Register Screen" "User registration screen" "Flutter StatefulWidget"
                forgotPasswordScreen = component "Forgot Password Screen" "Password recovery screen" "Flutter StatefulWidget"
                profileScreen = component "Profile Screen" "User profile screen" "Flutter StatefulWidget"
                
                // Controllers/BLoCs
                authBloc = component "Authentication BLoC" "Authentication state logic" "Flutter BLoC"
                userBloc = component "User BLoC" "User state logic" "Flutter BLoC"
                
                // Services
                authService = component "Authentication Service" "Authentication service" "Dart Service Class"
                userService = component "User Service" "User management service" "Dart Service Class"
                httpService = component "HTTP Service" "HTTP client for API communication" "Dart HTTP Client"
                
                // Local Storage
                secureStorageService = component "Secure Storage Service" "Secure token storage" "Flutter Secure Storage"
                localDatabaseService = component "Local Database Service" "Local database service" "SQLite Service"
                preferencesService = component "Preferences Service" "User preferences storage" "Shared Preferences"
                
                // Data Models
                userModel = component "User Model" "User data model" "Dart Data Class"
                authModel = component "Auth Model" "Authentication data model" "Dart Data Class"
                tokenModel = component "Token Model" "JWT token model" "Dart Data Class"
                
                // Repositories
                authRepository = component "Auth Repository" "Authentication repository" "Dart Repository"
                userRepository = component "User Repository" "User repository" "Dart Repository"
                
                // Utilities and Helpers
                jwtHelper = component "JWT Helper" "JWT handling utilities" "Dart Helper Class"
                validatorHelper = component "Validator Helper" "Form validations" "Dart Helper Class"
                
                // Security Middleware
                authMiddleware = component "Auth Middleware" "Authentication middleware" "Dart Interceptor"
                
                // Custom Widgets
                customButton = component "Custom Button Widget" "Reusable custom button" "Flutter StatelessWidget"
                customTextField = component "Custom TextField Widget" "Custom text field" "Flutter StatelessWidget"
                loadingWidget = component "Loading Widget" "Loading widget" "Flutter StatelessWidget"
            }
        }

        // User relationships
        logisticManager -> loginScreen "Logs in from mobile"
        endCustomer -> loginScreen "Logs in from mobile"
        
        // Screen and BLoC relationships
        loginScreen -> authBloc "Sends authentication events"
        registerScreen -> authBloc "Sends registration events"
        forgotPasswordScreen -> authBloc "Sends recovery events"
        profileScreen -> userBloc "Sends user events"
        
        // BLoC and repository relationships
        authBloc -> authRepository "Gets authentication data"
        userBloc -> userRepository "Gets user data"
        
        // Repository and service relationships
        authRepository -> authService "Uses auth service"
        authRepository -> localDatabaseService "Stores data locally"
        userRepository -> userService "Uses user service"
        userRepository -> localDatabaseService "Stores data locally"
        
        // Service relationships
        authService -> httpService "Makes HTTP requests"
        authService -> secureStorageService "Stores secure tokens"
        userService -> httpService "Makes HTTP requests"
        
        httpService -> authMiddleware "Uses middleware"
        httpService -> backendSystem "Communicates with backend API"
        
        // Storage relationships
        secureStorageService -> tokenModel "Stores tokens"
        localDatabaseService -> sqliteDB "Accesses local database"
        preferencesService -> userModel "Stores preferences"
        
        // Helper relationships
        authService -> jwtHelper "Uses for JWT"
        loginScreen -> validatorHelper "Validates forms"
        registerScreen -> validatorHelper "Validates forms"
        
        // Model relationships
        authService -> authModel "Uses model"
        authService -> tokenModel "Uses model"
        userService -> userModel "Uses model"
        
        // Custom widget relationships
        loginScreen -> customButton "Uses custom button"
        loginScreen -> customTextField "Uses text field"
        loginScreen -> loadingWidget "Shows loading"
        registerScreen -> customButton "Uses custom button"
        registerScreen -> customTextField "Uses text field"
        
        // Authentication middleware
        authMiddleware -> secureStorageService "Gets tokens"
        authMiddleware -> jwtHelper "Validates tokens"
        userRepository -> localDatabaseService "Almacena datos localmente"
        
        // Relaciones de servicios
        authService -> httpService "Realiza peticiones HTTP"
        authService -> secureStorageService "Almacena tokens seguros"
        userService -> httpService "Realiza peticiones HTTP"
        
        httpService -> authMiddleware "Utiliza middleware"
        httpService -> backendSystem "Se comunica con API backend"
        
        // Relaciones con almacenamiento
        secureStorageService -> tokenModel "Almacena tokens"
        localDatabaseService -> sqliteDB "Accede a base de datos local"
        preferencesService -> userModel "Almacena preferencias"
        
        // Relaciones con helpers
        authService -> jwtHelper "Utiliza para JWT"
        loginScreen -> validatorHelper "Valida formularios"
        registerScreen -> validatorHelper "Valida formularios"
        
        // Relaciones con modelos
        authService -> authModel "Utiliza modelo"
        authService -> tokenModel "Utiliza modelo"
        userService -> userModel "Utiliza modelo"
        
        // Relaciones con widgets personalizados
        loginScreen -> customButton "Utiliza botón personalizado"
        loginScreen -> customTextField "Utiliza campo de texto"
        loginScreen -> loadingWidget "Muestra loading"
        registerScreen -> customButton "Utiliza botón personalizado"
        registerScreen -> customTextField "Utiliza campo de texto"
        
        // Middleware de autenticación
        authMiddleware -> secureStorageService "Obtiene tokens"
        authMiddleware -> jwtHelper "Valida tokens"
    }

    views {
        component flutterApp "FlutterIAMComponents" {
            title "Identity & Access Management - Mobile Flutter Components"
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
            element "Flutter StatefulWidget" {
                background #02569b
                color #ffffff
            }
            element "Flutter StatelessWidget" {
                background #13b9fd
                color #ffffff
            }
            element "Flutter BLoC" {
                background #ff5722
                color #ffffff
            }
            element "Dart Service Class" {
                background #0175c2
                color #ffffff
            }
            element "Dart HTTP Client" {
                background #4caf50
                color #ffffff
            }
            element "Flutter Secure Storage" {
                background #f44336
                color #ffffff
            }
            element "SQLite Service" {
                background #2196f3
                color #ffffff
            }
            element "Shared Preferences" {
                background #9c27b0
                color #ffffff
            }
            element "Dart Data Class" {
                background #607d8b
                color #ffffff
            }
            element "Dart Repository" {
                background #795548
                color #ffffff
            }
            element "Dart Helper Class" {
                background #009688
                color #ffffff
            }
            element "Dart Interceptor" {
                background #e91e63
                color #ffffff
            }
            element "SQLite" {
                shape Cylinder
                background #ffa500
                color #ffffff
            }
        }
    }
}