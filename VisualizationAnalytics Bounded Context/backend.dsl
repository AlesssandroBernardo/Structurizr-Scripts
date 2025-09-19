workspace "Fleet Monitoring System" "Fleet monitoring system for logistics management" {

    model {
        // External actors
        frontendApp = softwareSystem "Frontend Application" "Angular web application"
        mobileApp = softwareSystem "Mobile Application" "Flutter mobile application"
        
        // Database
        database = softwareSystem "PostgreSQL Database" "Main analytics database" "PostgreSQL"

        // Backend system
        backendSystem = softwareSystem "Backend API System" "REST API for analytics and visualization" {
            
            // Spring Boot Container
            springBootApp = container "Spring Boot Application" "REST API for Visualization & Analytics" "Java 17, Spring Boot 3.x" {
                
                // REST Controllers
                tripAnalyticsController = component "Trip Analytics Controller" "Trip analytics endpoints" "Spring REST Controller"
                incidentAnalyticsController = component "Incident Analytics Controller" "Incident analytics endpoints" "Spring REST Controller"
                driverAnalyticsController = component "Driver Analytics Controller" "Driver performance endpoints" "Spring REST Controller"
                
                // Analytics Services
                tripAnalyticsService = component "Trip Analytics Service" "Trip data analysis business logic" "Spring Service"
                incidentAnalyticsService = component "Incident Analytics Service" "Incident analysis business logic" "Spring Service"
                driverAnalyticsService = component "Driver Analytics Service" "Driver performance analysis logic" "Spring Service"
                temperatureAnalysisService = component "Temperature Analysis Service" "Temperature data processing service" "Spring Service"
                
                // Data Processing Services
                dataAggregationService = component "Data Aggregation Service" "Data aggregation and grouping operations" "Spring Service"
                statisticsCalculationService = component "Statistics Calculation Service" "Statistical calculations for analytics" "Spring Service"
                trendAnalysisService = component "Trend Analysis Service" "Trend detection and analysis" "Spring Service"
                
                // Repositories
                tripRepository = component "Trip Repository" "Trip data access" "Spring Data JPA Repository"
                incidentRepository = component "Incident Repository" "Incident data access" "Spring Data JPA Repository"
                driverRepository = component "Driver Repository" "Driver data access" "Spring Data JPA Repository"
                temperatureReadingRepository = component "Temperature Reading Repository" "Temperature data access" "Spring Data JPA Repository"
                
                // Custom Query Repositories
                tripAnalyticsRepository = component "Trip Analytics Repository" "Custom trip analytics queries" "Spring Data JPA Repository"
                incidentAnalyticsRepository = component "Incident Analytics Repository" "Custom incident analytics queries" "Spring Data JPA Repository"
                driverPerformanceRepository = component "Driver Performance Repository" "Custom driver performance queries" "Spring Data JPA Repository"
                
                // Entities
                tripEntity = component "Trip Entity" "Trip data entity" "JPA Entity"
                incidentEntity = component "Incident Entity" "Incident data entity" "JPA Entity"
                driverEntity = component "Driver Entity" "Driver data entity" "JPA Entity"
                temperatureReadingEntity = component "Temperature Reading Entity" "Temperature reading entity" "JPA Entity"
                
                // Utility Components
                dateRangeProcessor = component "Date Range Processor" "Date range filtering utility" "Spring Component"
                chartDataFormatter = component "Chart Data Formatter" "Chart data formatting utility" "Spring Component"
                exportUtility = component "Export Utility" "Data export utility" "Spring Component"
                
                // Cache Management
                analyticsCacheManager = component "Analytics Cache Manager" "Analytics data caching" "Spring Cache Component"
                
                // Exception Handlers
                analyticsExceptionHandler = component "Analytics Exception Handler" "Analytics-specific exception handling" "Spring Controller Advice"
            }
        }

        // External relationships
        frontendApp -> tripAnalyticsController "HTTP trip analytics requests"
        frontendApp -> incidentAnalyticsController "HTTP incident analytics requests"
        frontendApp -> driverAnalyticsController "HTTP driver performance requests"
        mobileApp -> tripAnalyticsController "HTTP trip analytics requests"
        mobileApp -> driverAnalyticsController "HTTP driver performance requests"
        
        // Controller relationships
        tripAnalyticsController -> tripAnalyticsService "Delegates trip analytics logic"
        incidentAnalyticsController -> incidentAnalyticsService "Delegates incident analytics logic"
        driverAnalyticsController -> driverAnalyticsService "Delegates driver analytics logic"
        
        // Service relationships
        tripAnalyticsService -> temperatureAnalysisService "Analyzes temperature data"
        tripAnalyticsService -> dataAggregationService "Aggregates trip data"
        incidentAnalyticsService -> statisticsCalculationService "Calculates incident statistics"
        driverAnalyticsService -> trendAnalysisService "Analyzes driver trends"
        
        // Data processing relationships
        temperatureAnalysisService -> dataAggregationService "Aggregates temperature readings"
        dataAggregationService -> statisticsCalculationService "Calculates aggregated statistics"
        trendAnalysisService -> statisticsCalculationService "Uses statistical calculations"
        
        // Service to repository relationships
        tripAnalyticsService -> tripAnalyticsRepository "Executes custom trip queries"
        tripAnalyticsService -> temperatureReadingRepository "Accesses temperature data"
        incidentAnalyticsService -> incidentAnalyticsRepository "Executes custom incident queries"
        driverAnalyticsService -> driverPerformanceRepository "Executes driver performance queries"
        
        // Analytics repository to standard repository relationships
        tripAnalyticsRepository -> tripRepository "Uses trip repository"
        incidentAnalyticsRepository -> incidentRepository "Uses incident repository"
        driverPerformanceRepository -> driverRepository "Uses driver repository"
        
        // Repository to database relationships
        tripRepository -> database "Reads/writes trip data"
        incidentRepository -> database "Reads/writes incident data"
        driverRepository -> database "Reads/writes driver data"
        temperatureReadingRepository -> database "Reads temperature readings"
        
        // Entity relationships
        tripRepository -> tripEntity "Maps trip entity"
        incidentRepository -> incidentEntity "Maps incident entity"
        driverRepository -> driverEntity "Maps driver entity"
        temperatureReadingRepository -> temperatureReadingEntity "Maps temperature entity"
        
        // Utility relationships
        tripAnalyticsService -> dateRangeProcessor "Processes date filters"
        incidentAnalyticsService -> chartDataFormatter "Formats chart data"
        driverAnalyticsService -> exportUtility "Exports performance reports"
        
        // Cache relationships
        tripAnalyticsService -> analyticsCacheManager "Caches trip analytics"
        incidentAnalyticsService -> analyticsCacheManager "Caches incident analytics"
        driverAnalyticsService -> analyticsCacheManager "Caches driver analytics"
        
        // Exception handling
        tripAnalyticsController -> analyticsExceptionHandler "Handles exceptions"
        incidentAnalyticsController -> analyticsExceptionHandler "Handles exceptions"
        driverAnalyticsController -> analyticsExceptionHandler "Handles exceptions"
    }

    views {
        component springBootApp "SpringBootAnalyticsComponents" {
            title "Visualization/Analytics - Backend Spring Boot Components"
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
            element "Spring Component" {
                background #20c997
                color #ffffff
            }
            element "Spring Cache Component" {
                background #e83e8c
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