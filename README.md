# ad_infinitum

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Assignment 7 README.md

## What are the main differences between stateless and stateful widget in Flutter?
A stateless widget remains unchanged unless the entire page is refreshed. These widgets are inherently static and maintain their initial state until they are explicitly removed or until the page is reloaded, causing everything to be reconstructed. Examples of stateless widgets include text, icons, and images. In contrast, stateful widgets are capable of adapting their appearance or value in response to events such as timer triggers or user interactions. They are not fixed and can modify themselves when necessary.

##  Explain all widgets that you used in this assignment.

Here are the widgets and their explanations rearranged in alphabetical order:

1. AppBar:
   - A widget forming part of the Scaffold, typically fixed at the top of the screen, housing various elements like general app information and buttons for executing functions accessible from any app page. For more specialized or complex functions, it often includes a dropdown menu.

2. Center:
   - A widget designed to center its child, simplifying the alignment of inner widgets in the middle of the parent widget.

3. Column:
   - A widget that organizes children in a vertical array, stacking them one below the other. As more items are added, the Column widget automatically expands vertically to accommodate them snugly.

4. Container:
   - As the name implies, it's a widget for containing other widgets, granting precise control over positioning and space utilization by configuring attributes like padding, margin, and alignment.

5. Icon:
   - A graphical widget for displaying simple symbols or glyphs. Icons are non-interactive and rely on the predefined icon library from Flutter's material package.

6. Inkwell:
   - A widget that behaves like a button and responds to user interactions. It needs to be a child of a Material widget and provides a pleasing ripple effect when clicked.

7. Material:
   - The core widget enabling the use of Google's material design system. This system harmoniously combines various components like buttons, inkwells, and snack bars to create a consistent visual and interactive experience.

8. MaterialApp:
   - An App widget that represents the entire application, encompassing aspects such as routing, the home page, navigation, overall theme, and styling. MaterialApp is particularly geared toward implementing material design, incorporating necessary functions and revolving around widgets essential for material design principles.

9. MyHomePage:
   - A stateless widget created by me, serving as the representation of the homepage (currently the sole page). It constructs the widgets on the page based on the custom build method we've defined, overriding the default build method.

10. MyApp:
    - A custom widget I've defined that constructs the entire app when created. It's invoked by the main function when the app is launched.

11. Padding:
    - A widget for containing a single child and specifying EdgeInsets, which determines the spacing between the parent and child edges, providing layout control.

12. Scaffold:
    - A widget that facilitates the incorporation of widgets that overlay or float above the rest of the application, such as snack bars and floating buttons. It adheres to Material Design principles and allows for consistent design by specifying widget positions and heights.

13. ScaffoldMessenger:
    - A widget responsible for managing snack bars, controlling their appearance, and determining their display duration.

14. ShopCard:
    - A custom widget I've created, associated with a ShopItem, defining both an icon and a color (used as a bonus) for the ShopCard widgets.

15. SingleChildScroll:
    - A box that contains a single child that can be scrolled through. Normally used to contain children that can normally be viewed entirely but can still be scrolled if the dimensions of the screen become smaller.

16. SnackBar:
    - A widget that appears at the bottom of the screen to display information or confirm user actions.

17. Text:
    - A static widget for rendering text, allowing for formatting and styling adjustments defined within the class constructor.

18. Widget:
    - The fundamental building blocks for crafting Flutter applications, responsible for shaping every element visible and interactive to the user. They're structured by arranging widgets, using widget subclasses, and configuring widget attributes.

##  Explain how you implemented the checklist above step-by-step (not just following the tutorial).

### Create a new Flutter application with the inventory theme, just like previous tutorials.
I created a new Flutter application using the `flutter create <APP_NAME>` command where I called it 'Ad Infinitum'. The philosophy behind the naming is that unlike the previous web development assignment, I don't know where I would go for the App, what themes I would have. Which is why I picked that name to signify that it can be almost anything, plus the name is pretty cool. then I navigate to it using `cd ad_infinitum` and configurate it such that I can open it in chrome using `flutter config --enable-web`. Not only that but to check I also do `open -a simulator` to open an iOS simulator that can also launch the app in which after I do `flutter run` to run the app inside of iOS simulator that I just opened. 
Next I followed the same steps that was given to during the Tutorial, and rechecking after every changes that I made to see if it worked properly both on the web and on mobile (specifically iOS) or not. To add, I also changed almost every instances of 'Shop' to 'App' or 'Ad Infinitum' to further generalise the function of the app in the future. 

### Create a Snackbar with the following texts and Bonus Task:
In my `menu.dart` file, I successfully implemented the task of creating dynamic `SnackBar` messages that correspond to the specific button clicked, each with its own distinct color. To achieve this, I extended the `AppItem` class to include a `color` field, allowing me to associate unique colors with each menu item. Then, within the `MyHomePage` class, I populated a list of `AppItem` objects, each representing a menu option like "View Items," "Add Item," and "Logout," complete with their respective names, icons, and colors. In the `ShopCard` widget, I applied the custom background color using the `item.color` property, ensuring that each card had a distinct appearance. Finally, I added an `onTap` event to the `InkWell` widget within the `ShopCard`, which, when clicked, displayed a `SnackBar` with a message dynamically generated based on the item clicked, delivering the desired functionality of unique colors and associated messages for each button.



