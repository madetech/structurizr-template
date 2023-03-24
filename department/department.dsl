department = softwaresystem "Government Department" "Allows citizens to view information about their accounts, and make payments." {
    !docs ./docs
    !adrs ./adrs
    properties {
        "Owner" "Customer Services"
        "Development Team" "Dev/Internet Services"
    }

    singlePageApplication = container "Single-Page Application" "Provides all of the Internet banking functionality to customers via their web browser." "JavaScript and Angular" "Web Browser"
    mobileApp = container "Mobile App" "Provides a limited subset of the Internet banking functionality to customers via their mobile device." "Xamarin" "Mobile App"
    webApplication = container "Web Application" "Delivers the static content and the Internet banking single page application." "Java and Spring MVC"
    apiApplication = container "API Application" "Provides Internet banking functionality via a JSON/HTTPS API." "Java and Spring MVC" {
        signinController = component "Sign In Controller" "Allows users to sign in to the Internet Banking System." "Spring MVC Rest Controller"
        accountsSummaryController = component "Accounts Summary Controller" "Provides customers with a summary of their bank accounts." "Spring MVC Rest Controller"
        resetPasswordController = component "Reset Password Controller" "Allows users to reset their passwords with a single use URL." "Spring MVC Rest Controller"
        securityComponent = component "Security Component" "Provides functionality related to signing in, changing passwords, etc." "Spring Bean"
        bankingSystemFacade = component "Banking System Facade" "A facade onto the banking system." "Spring Bean"
        emailComponent = component "E-mail Component" "Sends e-mails to users." "Spring Bean"
    }
    database = container "Database" "Stores user registration information, hashed authentication credentials, access logs, etc." "Oracle Database Schema" "Database"
}
