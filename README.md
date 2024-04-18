Directory App is completely build in SwiftUI using MVVM design pattern (using Swift 5.0+ & targeting iOS 14.7). 


This app has 4 basic screen components:
  1. Tab View
    - Has 2 tabs within it i.e. Contacts tab and Rooms tab.

  2. Contact List View
    - Shows list of all contacts fetched from API with the basic information of the contact like avatar, name, job title and email address.

  3. Contact Details View
    - When clicked on any contact, it will navigate to the details screen which shows all information of respective contact.

  4. Rooms List View
    - Shows list of all rooms fetched from API.


Along with the 4 main screens, a search feature is also implemented on Contact List and Room List screens. Using search feature, user can search for a contact based on contact's firstname and search for a room based on room's ID respectively.



* List of features implemented in Directory App:
	- Search features on Contact and Room list screens
	- Compatibility for all iOS devices i.e. iPhones and iPad
	- Accessibility feature of iOS in order to make the app more accessible
	- Unit tests has also been covered
	- UI for dark and light theme
	- Handling of any error occurred & no internet connection case
	- Added configurations for Dev, Staging and Production environments


