# Mayo Clinic Exercise

This application has been created in native iOS which displays the list of headlines getting from the Mayo Clinic content API.

## Installation

Unzip the project file and open the `MayoExercise.xcodeproj` over Xcode

## Tech Stack

Swift, UIKit

# Application architecture
This exercise has been created using the MVVM where View is notified about the user actions to the ViewModel and ViewModel takes care of the business decisions and internally uses the API service layer to communicate with Network. Once it receives the response, it returns the expected model to the view layer.

---


Mayo Clinic Exercise
Welcome to the Mayo Clinic Exercise, an application developed natively for iOS, designed to fetch and display health-related news headlines from the Mayo Clinic content API. This application provides an easy and convenient way for users to stay updated with the latest health news from one of the most reputable healthcare systems in the world.

Installation
To install and run this application on your development machine, follow these steps:

Unzip the provided project file to your desired location.
Open MayoExercise.xcodeproj file using Xcode.
Please note that this application requires Xcode to run, which is only available on macOS.

Tech Stack
The application is built using the following technologies:

Swift: The primary programming language used for iOS development.
UIKit: The foundational framework that provides the crucial infrastructure needed to construct and manage iOS apps.
Application Architecture
This application follows the Model-View-ViewModel (MVVM) architecture. The MVVM design pattern allows for a clear separation of concerns, making the code more readable and maintainable. Here's a brief overview of how it functions:

View: The View represents the user interface and is responsible for displaying the information from the ViewModel to the user. It sends user actions/events to the ViewModel.

ViewModel: The ViewModel acts as an intermediary between the View and the Model. It receives user actions from the View, processes the data (making necessary business decisions), and updates the View accordingly.

Model: The Model is the application's business layer and represents the data. In our case, the Model interacts with the API service layer, retrieving the latest health news headlines from the Mayo Clinic content API.

Service Layer: The Service Layer acts as the connection between the ViewModel and the Network. It's responsible for making network requests to the API and returns the parsed response to the ViewModel.

Here's a detailed workflow:

View receives user interactions.
View notifies ViewModel about these interactions.
ViewModel uses the Service Layer to request necessary data from the Mayo Clinic content API.
Once the data is received, the ViewModel processes it and converts it into a format suitable for the View.
The processed data (Model) is returned to the View.
View displays the latest headlines to the user.
By using the MVVM architecture, we ensure that each component has a clear and distinct role, leading to cleaner and more manageable code. Additionally, this pattern supports two-way data binding between the View and ViewModel, which makes it easier to keep the View up-to-date with changes in the ViewModel or Model.

Please note, the entire application is documented with detailed comments for a better understanding of the codebase.

We hope you find this application helpful and easy to navigate.
