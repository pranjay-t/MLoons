# MLoons

## Overview  
The Manga App allows users to browse and manage manga product items with the ability to log in using Google authentication. The app supports viewing product items, searching for specific manga, and managing the shopping cart with add, delete, and update functionality. State management is handled using the **Provider** package to ensure a smooth user experience.

## Features  
- **Google Login**: Users can sign in securely with their Google account.
- **Product Viewing**: Browse available manga products with detailed descriptions.
- **Search Functionality**: Easily search for specific manga items.
- **Cart Management**: Add, delete, and update manga items in the shopping cart.
- **State Management**: Use of the **Provider** package for efficient state management across the app.

## Tech Stack  
- **Flutter**: For building the cross-platform app.
- **Provider**: For state management.
- **Google Sign-In**: For Google authentication.
- **Firebase/Backend**: For data storage and retrieval (if used).


## Usage  

- **Login**: Upon launching the app, users will be prompted to log in via their Google account.  
- **Product View**: Once logged in, users can browse through the available manga products.  
- **Search**: The app provides a search bar at the top for quick access to specific manga items.  
- **Cart**: Users can add, update, or remove items from their cart using simple actions.  

## State Management with Provider  
The app uses **Provider** to manage the state, including the user's authentication state, cart items, and other UI-related information. The provider ensures that the app remains responsive and that the cart data is consistently updated across the app’s screens.

## License  
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

