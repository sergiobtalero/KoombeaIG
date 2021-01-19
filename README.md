# KoombeaIG

## Architecture

The app was built with a clean architecture approach, hence, you will find following layers:

**Data**: In charged of handling services, and data entities.

**Domain**: In charged of holding business logic and models which will be used by the presentation layer.

**Presentation**: Handles all user UI and user interactions, etc. MVP was used here.

## Used Frameworks
- *Kinfgisher*: Used for image fetching
- *Couchbase Lite*: Used for caching service responses

## Testing

Tests were added to Data, Domain, and the presenters created for the views.

## How to run
1. Clone repo
2. Run xcodegen from your terminal
3. Open project and wait for Swift PM to finish loading

## Pending work
As SwifUI was used to build the app, the following features are pending to be included as they need to be researched of how can they be implemented with SwiftUI:
1. Pull down to refresh list.
2. Tap image and zoom it.
