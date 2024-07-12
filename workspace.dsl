
workspace "Government Body" "This is an example workspace to illustrate the key features of Structurizr, via the DSL, based around a fictional online banking system." {
    !docs workspace-docs
    !adrs workspace-adrs

    model {
        citizen = person "Citizen" "A member of the public" "Person"

        email = softwaresystem "GovNotify" "The Government Service for sending e-maills." "Existing System"

        group "Government Body" {
            supportStaff = person "Citizen Service Staff" "Citizen service staff within the Government." "Civil Servant Staff" {
                properties {
                    "Location" "Customer Services"
                }
            }
            backoffice = person "Back Office Staff" "Administration and support staff within the bank." "Bank Staff" {
                properties {
                    "Location" "Internal Services"
                }
            }

            bankingSystem = softwaresystem "Banking System" "Stores all of the core banking information about citizens, accounts, transactions, etc." "Existing System"

            !include department/department.dsl
        }

        # relationships between people and software systems
        citizen -> department "Views account balances, and makes payments using"
        department -> bankingSystem "Gets account information from, and makes payments using"
        department -> email "Sends e-mail using"
        email -> citizen "Sends e-mails to"
        citizen -> supportStaff "Asks questions to" "Telephone"
        supportStaff -> bankingSystem "Uses"
        backoffice -> bankingSystem "Uses"


        # relationships to/from containers
        citizen -> webApplication "Visits someservice.gov.uk using" "HTTPS"
        citizen -> singlePageApplication "Views account balances, and makes payments using"
        citizen -> mobileApp "Views account balances, and makes payments using"
        webApplication -> singlePageApplication "Delivers to the citizen's web browser"

        # relationships to/from components
        singlePageApplication -> signinController "Makes API calls to" "JSON/HTTPS"
        singlePageApplication -> accountsSummaryController "Makes API calls to" "JSON/HTTPS"
        singlePageApplication -> resetPasswordController "Makes API calls to" "JSON/HTTPS"
        mobileApp -> signinController "Makes API calls to" "JSON/HTTPS"
        mobileApp -> accountsSummaryController "Makes API calls to" "JSON/HTTPS"
        mobileApp -> resetPasswordController "Makes API calls to" "JSON/HTTPS"
        signinController -> securityComponent "Uses"
        accountsSummaryController -> bankingSystemFacade "Uses"
        resetPasswordController -> securityComponent "Uses"
        resetPasswordController -> emailComponent "Uses"
        securityComponent -> database "Reads from and writes to" "JDBC"
        bankingSystemFacade -> bankingSystem "Makes API calls to" "XML/HTTPS"
        emailComponent -> email "Sends e-mail using" "JSON/HTTPS"

        deploymentEnvironment "Development" {
            deploymentNode "Developer Laptop" "" "Microsoft Windows 10 or Apple macOS" {
                deploymentNode "Web Browser" "" "Chrome, Firefox, Safari, or Edge" {
                    developerSinglePageApplicationInstance = containerInstance singlePageApplication
                }
                deploymentNode "Docker Container - Web Server" "" "Docker" {
                    deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        developerWebApplicationInstance = containerInstance webApplication
                        developerApiApplicationInstance = containerInstance apiApplication
                    }
                }
                deploymentNode "Docker Container - Database Server" "" "Docker" {
                    deploymentNode "Database Server" "" "Oracle 12c" {
                        developerDatabaseInstance = containerInstance database
                    }
                }
            }
            deploymentNode "Bank" "" "Bank data center" "" {
                deploymentNode "bank-dev001" "" "" "" {
                    softwareSystemInstance bankingSystem
                }
            }

        }

        deploymentEnvironment "Live" {
            deploymentNode "Citizen's mobile device" "" "Apple iOS or Android" {
                liveMobileAppInstance = containerInstance mobileApp
            }
            deploymentNode "Citizen's computer" "" "Microsoft Windows or Apple macOS" {
                deploymentNode "Web Browser" "" "Chrome, Firefox, Safari, or Edge" {
                    liveSinglePageApplicationInstance = containerInstance singlePageApplication
                }
            }

            deploymentNode "Bank" "" "Bank data center" {
                deploymentNode "bank-web***" "" "Ubuntu 16.04 LTS" "" 4 {
                    deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        liveWebApplicationInstance = containerInstance webApplication
                    }
                }
                deploymentNode "bank-api***" "" "Ubuntu 16.04 LTS" "" 8 {
                    deploymentNode "Apache Tomcat" "" "Apache Tomcat 8.x" {
                        liveApiApplicationInstance = containerInstance apiApplication
                    }
                }

                deploymentNode "bank-db01" "" "Ubuntu 16.04 LTS" {
                    primaryDatabaseServer = deploymentNode "Oracle - Primary" "" "Oracle 12c" {
                        livePrimaryDatabaseInstance = containerInstance database
                    }
                }
                deploymentNode "bank-db02" "" "Ubuntu 16.04 LTS" "Failover" {
                    secondaryDatabaseServer = deploymentNode "Oracle - Secondary" "" "Oracle 12c" "Failover" {
                        liveSecondaryDatabaseInstance = containerInstance database "Failover"
                    }
                }
                deploymentNode "bank-prod001" "" "" "" {
                    softwareSystemInstance bankingSystem
                }
            }

            primaryDatabaseServer -> secondaryDatabaseServer "Replicates data to"
        }
    }

    views {
        properties {
            "c4plantuml.elementProperties" "true"
            "structurizr.style.colors.primary" "#485fc7"
            "structurizr.style.colors.secondary" "#ffffff"
            "structurizr.style.favicon.path" "site/made-tech-logo.png"
            "structurizr.style.logo.path" "site/made-tech-logo.png"
        }

        systemlandscape "SystemLandscape" {
            include *
            autoLayout
        }

        systemcontext department "SystemContext" {
            include *
            animation {
                department
                citizen
                bankingSystem
                email
            }
            autoLayout
        }

        container department "Containers" {
            include *
            animation {
                citizen bankingSystem email
                webApplication
                singlePageApplication
                mobileApp
                apiApplication
                database
            }
            autoLayout
        }

        component apiApplication "Components" {
            include *
            animation {
                singlePageApplication mobileApp database email bankingSystem
                signinController securityComponent
                accountsSummaryController bankingSystemFacade
                resetPasswordController emailComponent
            }
            autoLayout
        }

        dynamic apiApplication "SignIn" "Summarises how the sign in feature works in the single-page application." {
            singlePageApplication -> signinController "Submits credentials to"
            signinController -> securityComponent "Validates credentials using"
            securityComponent -> database "select * from users where username = ?"
            database -> securityComponent "Returns user data to"
            securityComponent -> signinController "Returns true if the hashed password matches"
            signinController -> singlePageApplication "Sends back an authentication token to"
            autoLayout
        }

        deployment department "Development" "DevelopmentDeployment" {
            include *
            animation {
                developerSinglePageApplicationInstance
                developerWebApplicationInstance developerApiApplicationInstance
                developerDatabaseInstance
            }
            autoLayout
        }

        deployment department "Live" "LiveDeployment" {
            include *
            animation {
                liveSinglePageApplicationInstance
                liveMobileAppInstance
                liveWebApplicationInstance liveApiApplicationInstance
                livePrimaryDatabaseInstance
                liveSecondaryDatabaseInstance
            }
            autoLayout
        }

        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "Citizen" {
                background #08427b
            }
            element "Bank Staff" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
    }
}
