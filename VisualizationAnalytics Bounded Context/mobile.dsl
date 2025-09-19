workspace "Fleet Monitoring System" "Fleet monitoring system for logistics management" {

    model {
        // External actors
        logisticManager = person "Logistics Manager" "Views analytics from mobile device"
        endCustomer = person "End Customer" "Views shipment analytics from mobile"

        // External systems
        backendSystem = softwareSystem "Backend API" "Backend system that provides analytics data"
        
        // Local database
        sqliteDB = softwareSystem "SQLite Local Database" "Mobile device analytics cache database" "SQLite" 

        // Mobile system
        mobileSystem = softwareSystem "Mobile Flutter Application" "Mobile application for fleet analytics" {
            
            // Flutter Container
            flutterApp = container "Flutter Application" "Cross-platform mobile analytics application" "Flutter, Dart, FL Chart" {
                
                // Analytics Screens
                analyticsDashboardScreen = component "Analytics Dashboard Screen" "Main analytics dashboard" "Flutter StatefulWidget"
                tripAnalyticsScreen = component "Trip Analytics Screen" "Individual trip temperature analysis" "Flutter StatefulWidget"
                incidentsOverviewScreen = component "Incidents Overview Screen" "Monthly incidents overview" "Flutter StatefulWidget"
                driversRankingScreen = component "Drivers Ranking Screen" "Top N drivers performance" "Flutter StatefulWidget"
                
                // Chart Widgets
                temperatureLineChartWidget = component "Temperature Line Chart Widget" "Temperature vs time line chart" "Flutter StatefulWidget"
                incidentsBarChartWidget = component "Incidents Bar Chart Widget" "Monthly incidents bar chart" "Flutter StatefulWidget"
                customTooltipWidget = component "Custom Tooltip Widget" "Interactive chart tooltip" "Flutter StatelessWidget"
                
                // BLoCs for State Management
                tripAnalyticsBloc = component "Trip Analytics BLoC" "Trip analytics state management" "Flutter BLoC"
                incidentAnalyticsBloc = component "Incident Analytics BLoC" "Incident analytics state management" "Flutter BLoC"
                driverAnalyticsBloc = component "Driver Analytics BLoC" "Driver analytics state management" "Flutter BLoC"
                chartConfigBloc = component "Chart Config BLoC" "Chart configuration state management" "Flutter BLoC"
                
                // Services
                analyticsService = component "Analytics Service" "Analytics data operations" "Dart Service Class"
                chartRenderingService = component "Chart Rendering Service" "Chart rendering and configuration" "Dart Service Class"
                dataTransformationService = component "Data Transformation Service" "Data transformation for mobile charts" "Dart Service Class"
                
                // HTTP and API Services
                analyticsApiService = component "Analytics API Service" "Analytics API communication" "Dart HTTP Service"
                
                // Local Storage Services
                analyticsCacheService = component "Analytics Cache Service" "Local analytics data caching" "SQLite Service"
                chartConfigService = component "Chart Config Service" "Chart configuration storage" "Shared Preferences"
                
                // Repositories
                tripAnalyticsRepository = component "Trip Analytics Repository" "Trip analytics data repository" "Dart Repository"
                incidentAnalyticsRepository = component "Incident Analytics Repository" "Incident analytics data repository" "Dart Repository"
                driverAnalyticsRepository = component "Driver Analytics Repository" "Driver analytics data repository" "Dart Repository"
                
                // Data Models
                tripAnalyticsModel = component "Trip Analytics Model" "Trip analytics data model" "Dart Data Class"
                incidentAnalyticsModel = component "Incident Analytics Model" "Incident analytics data model" "Dart Data Class"
                driverPerformanceModel = component "Driver Performance Model" "Driver performance data model" "Dart Data Class"
                temperatureChartModel = component "Temperature Chart Model" "Temperature chart data model" "Dart Data Class"
                chartConfigModel = component "Chart Config Model" "Chart configuration model" "Dart Data Class"
                
                // Filter and Search Widgets
                dateRangePickerWidget = component "Date Range Picker Widget" "Date range selection for mobile" "Flutter StatefulWidget"
                tripFilterWidget = component "Trip Filter Widget" "Trip filtering for mobile" "Flutter StatefulWidget"
                searchWidget = component "Search Widget" "Search functionality for mobile" "Flutter StatefulWidget"
                
                // Utility Services
                exportService = component "Export Service" "Data export functionality" "Dart Service Class"
                colorSchemeService = component "Color Scheme Service" "Chart color management for mobile" "Dart Service Class"
                formatUtilityService = component "Format Utility Service" "Data formatting utilities" "Dart Service Class"
                
                // Helpers
                chartInteractionHelper = component "Chart Interaction Helper" "Chart touch interaction handling" "Dart Helper Class"
                analyticsCalculationHelper = component "Analytics Calculation Helper" "Local analytics calculations" "Dart Helper Class"
                networkHelper = component "Network Helper" "Network connectivity for analytics" "Dart Helper Class"
                
                // Custom UI Components
                analyticsCardWidget = component "Analytics Card Widget" "Reusable analytics card component" "Flutter StatelessWidget"
                metricDisplayWidget = component "Metric Display Widget" "Metric value display widget" "Flutter StatelessWidget"
                loadingIndicatorWidget = component "Loading Indicator Widget" "Analytics loading indicator" "Flutter StatelessWidget"
            }
        }

        // User relationships
        logisticManager -> analyticsDashboardScreen "Views comprehensive analytics"
        logisticManager -> driversRankingScreen "Reviews driver performance"
        endCustomer -> tripAnalyticsScreen "Views temperature analytics for shipments"
        
        // Screen navigation relationships
        analyticsDashboardScreen -> tripAnalyticsScreen "Navigates to trip details"
        analyticsDashboardScreen -> incidentsOverviewScreen "Navigates to incidents overview"
        analyticsDashboardScreen -> driversRankingScreen "Navigates to drivers ranking"
        
        // Screen to BLoC relationships
        tripAnalyticsScreen -> tripAnalyticsBloc "Sends trip analytics events"
        incidentsOverviewScreen -> incidentAnalyticsBloc "Sends incident analytics events"
        driversRankingScreen -> driverAnalyticsBloc "Sends driver analytics events"
        temperatureLineChartWidget -> chartConfigBloc "Manages chart configuration"
        
        // Chart widget relationships
        tripAnalyticsScreen -> temperatureLineChartWidget "Displays temperature charts"
        incidentsOverviewScreen -> incidentsBarChartWidget "Displays incidents bar chart"
        incidentsBarChartWidget -> customTooltipWidget "Shows tooltip on interaction"
        
        // BLoC to repository relationships
        tripAnalyticsBloc -> tripAnalyticsRepository "Gets trip analytics data"
        incidentAnalyticsBloc -> incidentAnalyticsRepository "Gets incident analytics data"
        driverAnalyticsBloc -> driverAnalyticsRepository "Gets driver analytics data"
        
        // Repository to service relationships
        tripAnalyticsRepository -> analyticsService "Uses analytics service"
        tripAnalyticsRepository -> analyticsCacheService "Caches data locally"
        incidentAnalyticsRepository -> analyticsService "Uses analytics service"
        driverAnalyticsRepository -> analyticsService "Uses analytics service"
        
        // Service relationships
        analyticsService -> analyticsApiService "Makes API calls"
        analyticsService -> dataTransformationService "Transforms data for mobile"
        chartRenderingService -> colorSchemeService "Gets chart colors"
        chartRenderingService -> formatUtilityService "Formats chart data"
        
        // API and backend relationships
        analyticsApiService -> backendSystem "Fetches analytics data"
        analyticsApiService -> networkHelper "Checks connectivity"
        
        // Local storage relationships
        analyticsCacheService -> sqliteDB "Stores cached analytics data"
        chartConfigService -> chartConfigModel "Stores chart preferences"
        
        // Chart interaction relationships
        temperatureLineChartWidget -> chartInteractionHelper "Handles touch interactions"
        incidentsBarChartWidget -> chartInteractionHelper "Handles touch interactions"
        chartInteractionHelper -> customTooltipWidget "Shows interactive tooltips"
        
        // Filter widget relationships
        analyticsDashboardScreen -> dateRangePickerWidget "Uses date filtering"
        tripAnalyticsScreen -> tripFilterWidget "Uses trip filtering"
        analyticsDashboardScreen -> searchWidget "Uses search functionality"
        
        // Model relationships
        analyticsService -> tripAnalyticsModel "Uses trip analytics model"
        analyticsService -> incidentAnalyticsModel "Uses incident analytics model"
        analyticsService -> driverPerformanceModel "Uses driver performance model"
        chartRenderingService -> temperatureChartModel "Uses temperature chart model"
        chartRenderingService -> chartConfigModel "Uses chart config model"
        
        // Utility relationships
        analyticsDashboardScreen -> exportService "Exports analytics reports"
        analyticsCalculationHelper -> formatUtilityService "Formats calculated values"
        
        // Custom widget relationships
        analyticsDashboardScreen -> analyticsCardWidget "Uses analytics cards"
        driversRankingScreen -> metricDisplayWidget "Displays driver metrics"
        analyticsDashboardScreen -> loadingIndicatorWidget "Shows loading states"
    }

    views {
        component flutterApp "FlutterAnalyticsComponents" {
            title "Visualization/Analytics - Mobile Flutter Components"
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
            element "Dart HTTP Service" {
                background #4caf50
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
            element "SQLite" {
                shape Cylinder
                background #ffa500
                color #ffffff
            }
        }
    }
}