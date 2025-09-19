workspace "Fleet Monitoring System" "Fleet monitoring system for logistics management" {

    model {
        // External actors
        logisticManager = person "Logistics Manager" "Analyzes fleet performance and incidents"
        endCustomer = person "End Customer" "Views temperature analytics for their shipments"

        // Backend system
        backendSystem = softwareSystem "Backend API" "Backend system that provides analytics data"

        // Frontend system
        frontendSystem = softwareSystem "Frontend Web Application" "Angular web application for fleet analytics" {
            
            // Angular Container
            angularApp = container "Angular Application" "Single Page Web Application for Analytics" "Angular 17, TypeScript, Chart.js" {
                
                // Dashboard Components
                dashboardComponent = component "Analytics Dashboard Component" "Main analytics dashboard interface" "Angular Component"
                tripAnalyticsComponent = component "Trip Analytics Component" "Individual trip temperature analysis" "Angular Component"
                incidentsOverviewComponent = component "Incidents Overview Component" "Monthly incidents bar chart view" "Angular Component"
                driversRankingComponent = component "Drivers Ranking Component" "Top N drivers performance table" "Angular Component"
                
                // Chart Components
                temperatureChartComponent = component "Temperature Chart Component" "Line chart for temperature vs time" "Angular Component"
                incidentsBarChartComponent = component "Incidents Bar Chart Component" "Bar chart for monthly incidents" "Angular Component"
                tooltipComponent = component "Tooltip Component" "Interactive tooltip for incident details" "Angular Component"
                
                // Data Visualization Services
                chartService = component "Chart Service" "Chart.js wrapper and configuration" "Angular Service"
                dataVisualizationService = component "Data Visualization Service" "Data transformation for charts" "Angular Service"
                colorPaletteService = component "Color Palette Service" "Chart color management" "Angular Service"
                
                // Analytics Services
                tripAnalyticsService = component "Trip Analytics Service" "Trip data operations" "Angular Service"
                incidentAnalyticsService = component "Incident Analytics Service" "Incident data operations" "Angular Service"
                driverAnalyticsService = component "Driver Analytics Service" "Driver performance operations" "Angular Service"
                
                // Filter and Search Components
                dateRangeFilterComponent = component "Date Range Filter Component" "Date range selection for analytics" "Angular Component"
                tripFilterComponent = component "Trip Filter Component" "Trip filtering interface" "Angular Component"
                searchComponent = component "Search Component" "Search functionality for trips and drivers" "Angular Component"
                
                // Utility Services
                exportService = component "Export Service" "Data export to CSV/PDF" "Angular Service"
                cacheService = component "Cache Service" "Analytics data caching" "Angular Service"
                
                // Data Models
                tripModel = component "Trip Models" "Trip analytics data models" "TypeScript Interfaces"
                incidentModel = component "Incident Models" "Incident data models" "TypeScript Interfaces"
                driverModel = component "Driver Models" "Driver performance models" "TypeScript Interfaces"
                chartConfigModel = component "Chart Config Models" "Chart configuration models" "TypeScript Interfaces"
                
                // Pipes and Formatters
                temperatureFormatPipe = component "Temperature Format Pipe" "Temperature display formatting" "Angular Pipe"
                dateFormatPipe = component "Date Format Pipe" "Date display formatting" "Angular Pipe"
                distanceFormatPipe = component "Distance Format Pipe" "Distance display formatting" "Angular Pipe"
            }
        }

        // User relationships
        logisticManager -> dashboardComponent "Views comprehensive fleet analytics"
        logisticManager -> driversRankingComponent "Monitors driver performance"
        endCustomer -> tripAnalyticsComponent "Views temperature data for their shipments"
        
        // Dashboard relationships
        dashboardComponent -> tripAnalyticsComponent "Embeds trip analytics"
        dashboardComponent -> incidentsOverviewComponent "Embeds incidents overview"
        dashboardComponent -> driversRankingComponent "Embeds drivers ranking"
        
        // Component to chart relationships
        tripAnalyticsComponent -> temperatureChartComponent "Displays temperature charts"
        incidentsOverviewComponent -> incidentsBarChartComponent "Displays incidents bar chart"
        incidentsBarChartComponent -> tooltipComponent "Shows incident details on hover"
        
        // Chart service relationships
        temperatureChartComponent -> chartService "Uses for chart rendering"
        incidentsBarChartComponent -> chartService "Uses for chart rendering"
        chartService -> dataVisualizationService "Transforms data for visualization"
        chartService -> colorPaletteService "Gets chart colors"
        
        // Analytics service relationships
        tripAnalyticsComponent -> tripAnalyticsService "Gets trip analytics data"
        incidentsOverviewComponent -> incidentAnalyticsService "Gets incident analytics data"
        driversRankingComponent -> driverAnalyticsService "Gets driver performance data"
        
        // Filter relationships
        dashboardComponent -> dateRangeFilterComponent "Uses for date filtering"
        tripAnalyticsComponent -> tripFilterComponent "Uses for trip filtering"
        dashboardComponent -> searchComponent "Uses for search functionality"
        
        // Service to backend relationships
        tripAnalyticsService -> backendSystem "Fetches trip analytics data"
        incidentAnalyticsService -> backendSystem "Fetches incident analytics data"
        driverAnalyticsService -> backendSystem "Fetches driver performance data"
        
        // Utility service relationships
        dashboardComponent -> exportService "Exports analytics reports"
        tripAnalyticsService -> cacheService "Caches trip data"
        incidentAnalyticsService -> cacheService "Caches incident data"
        driverAnalyticsService -> cacheService "Caches driver data"
        
        // Model relationships
        tripAnalyticsService -> tripModel "Uses trip models"
        incidentAnalyticsService -> incidentModel "Uses incident models"
        driverAnalyticsService -> driverModel "Uses driver models"
        chartService -> chartConfigModel "Uses chart configuration"
        
        // Pipe relationships
        temperatureChartComponent -> temperatureFormatPipe "Formats temperature values"
        tripAnalyticsComponent -> dateFormatPipe "Formats date values"
        driversRankingComponent -> distanceFormatPipe "Formats distance values"
        
        // Data visualization relationships
        dataVisualizationService -> tripModel "Transforms trip data"
        dataVisualizationService -> incidentModel "Transforms incident data"
        dataVisualizationService -> driverModel "Transforms driver data"
    }

    views {
        component angularApp "AngularAnalyticsComponents" {
            title "Visualization/Analytics - Frontend Angular Components"
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
            element "Angular Pipe" {
                background #ff6b35
                color #ffffff
            }
            element "TypeScript Interfaces" {
                background #3178c6
                color #ffffff
            }
        }
    }
}