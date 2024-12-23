# Search Task

## Getting Started

Run fast_prebuild_script_mac.sh or prebuild_script.sh to generate files

## Project Structure

Project consists following modules:

- Core
- Domain
- Data
- Navigation
- Feature "Search"

### Core

Core module serves as a common dependency for all other project modules and has two main functions:

1. Contains elements common to the application (configuration, DI mechanism, application-level
   constants, localization keys, etc.), various extensions, and utilities.
2. Exports common or frequently used dependencies (e.g., `flutter_bloc` or `get_it`), eliminating
   the need to import them in each dependent module.

### Data

Data module implements the interfaces defined in the domain module. It handles data operations and
interacts with external APIs. In this case, it consists of the following categories of elements:

- Repository implementations
- Data providers, designed to interact with data sources and operate with entities
- Entities, dedicated models for data sources
- Mappers, converting domain models to entities and vice versa
- DI setup for the data layer

### Domain

Domain module describes the application's subject area, defining domain models and possible use
cases. It also establishes the necessary interfaces for external dependencies, particularly for the
data layer. In this case, the domain module includes the following categories of elements:

- Domain models
- Use-cases (atomic domain operations)
- Repository interfaces
- DI setup for the domain layer

### Search feature

A feature module encompassing screens, widgets, models, and BLoC components dedicated to search
functionality. The module is focused solely on UI logic and provides a generated router for seamless
integration within the Navigation layer.

### Navigation

Navigation module contains the application router configuration and provides the necessary DI for
navigation.

## Additional information

In addition, the feature includes a comprehensive internet connectivity monitoring mechanism,
ensuring the application responds appropriately to changes in network availability. The groundwork
for API authentication has also been established, providing a scalable structure for secure user
interactions. A global error-handling system has been implemented to standardize and streamline
error management across the application. Furthermore, the feature supports full localization,
allowing seamless adaptation to various languages and regions, and offers both light and dark themes
to enhance user experience and accessibility.

## Q&A

### Why are all dependencies placed in the Core layer?

This approach simplifies dependency version management. Instead of searching through all the modules
where a dependency is used, it’s enough to locate and update it in the Core layer.

### Why is the state in BLoC generated using freezed?

Since the project follows a single-state approach, using freezed significantly simplifies the
process of generating immutable states, particularly the copyWith method.

### Why are there books with strange titles in the results?

This is not an issue on my side; the API returns these titles.

### How does navigation work?

The navigation is designed to eliminate dependencies between features while ensuring navigation is
not performed using raw string paths (to avoid potential errors with non-existent paths). Instead,
navigation relies on existing Route objects, ensuring better type safety and maintainability.

### Why does everything depend on Core?

This is an architectural decision made to prioritize convenience and development speed. Core can be
thought of as an extension of the language itself rather than a part of the application. It includes
only functionality that enhances the language’s capabilities, along with external dependencies.

### Why was this architectural approach chosen?

I acknowledge that the application may appear somewhat bulky. However, I always design applications with scalability in mind. What if tomorrow I decide to turn this test task into a full-fledged app for app stores? The architecture I’ve implemented supports easy testing and enables seamless reusability of components. Additionally, I aim to use a consistent approach across my personal projects to make them more predictable. This ensures that someone familiar with one project can easily navigate others.

### How can the architecture be simplified?

To be honest, I’ve already simplified it somewhat. For instance, I usually include an additional core_ui module in my projects, where I define themes and shared widgets. That said, the architecture could be further simplified by not separating each layer into individual packages or by skipping the useCase layer and interacting directly with the repository.


## Dependencies

Project is currently extended with the following packages

| Plugin                        | README                                                 |
|-------------------------------|--------------------------------------------------------|
| dio                           | https://pub.dev/packages/dio                           |
| bloc                          | https://pub.dev/packages/bloc                          |
| http                          | https://pub.dev/packages/http                          |
| rxdart                        | https://pub.dev/packages/rxdart                        |
| get_it                        | https://pub.dev/packages/get_it                        |
| freezed                       | https://pub.dev/packages/freezed                       |
| equatable                     | https://pub.dev/packages/equatable                     |
| auto_route                    | https://pub.dev/packages/auto_route                    |
| flutter_bloc                  | https://pub.dev/packages/flutter_bloc                  |
| json_annotation               | https://pub.dev/packages/json_annotation               |
| easy_localization             | https://pub.dev/packages/easy_localization             |
| flex_color_scheme             | https://pub.dev/packages/flex_color_scheme             |
| freezed_annotation            | https://pub.dev/packages/freezed_annotation            |
| observe_internet_connectivity | https://pub.dev/packages/observe_internet_connectivity |

## Demo

https://github.com/user-attachments/assets/91055116-d3c3-4010-9853-5f95873c4084



