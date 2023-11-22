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



# Assignment 8 README.md

## Explain the difference between Navigator.push() and Navigator.pushReplacement(), accompanied by examples of the correct usage of both methods!
The `Navigator.push()` method is used to push a new route onto the navigation stack, allowing users to navigate forward to a new screen. This method keeps the existing route in the navigation stack, enabling users to go back to the previous screen. For example:
```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => NewPage(),
  ),
);
```
On the other hand, `Navigator.pushReplacement()` is used to replace the current route with a new one. This is often employed when you don't want the user to navigate back to the previous screen. It's useful for scenarios like login pages, where you want to replace the login screen with the home screen after successful login:
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => HomePage(),
  ),
);
```

## Explain each layout widget in Flutter and their respective usage contexts!
In Flutter, layout widgets determine the arrangement and positioning of child widgets within a parent widget. Common layout widgets include:

- Container: A box model that can contain other widgets and provides properties like padding, margin, and decoration.
- Row and Column: Arrange children in a horizontal (Row) or vertical (Column) line.
- Stack: Overlap widgets on top of each other.
- Expanded and Flexible: Distribute available space among children based on specified ratios.
- ListView and GridView: Display a scrollable list or grid of widgets.

## List the form input elements you used in this assignment and explain why you used these input elements!
In the provided Flutter assignment, form input elements include `TextFormField`. These are used to collect user input for various item attributes like name, price, amount, and description. Each input element is associated with a specific attribute of the `Item` model. The validation ensures that the input adheres to specific criteria, such as being non-empty or having a valid numeric format.


## How is clean architecture implemented in a Flutter application?
Clean Architecture in Flutter involves structuring the codebase into layers with clear dependencies, making it modular, and promoting separation of concerns. Key components include:

- Domain Layer: Contains business logic, use cases, and entities.
- Data Layer: Deals with data sources, repositories, and external dependencies.
- Presentation Layer: Manages UI components, handles user input, and interacts with the domain layer.
- Dependency Rule: Dependencies flow from outer layers (UI) to inner layers (Domain).

## Explain how you implemented the checklist above step-by-step!

###  Create at least one new page in the application, a page for adding a new item with the determined requirements
In my Flutter application, I implemented a new page for adding items, adhering to the specified requirements. The new page is created in the `itemForm.dart` file. I utilized the `Form` widget to structure the input elements and employed the `TextFormField` widget for each input. I ensured the incorporation of at least three input elements: name, amount, and description, matching the model from my Django assignment.

For validation, I used the `validator` property in each `TextFormField` to check whether each input element is empty and whether the data type matches the corresponding model attribute. The validation messages are displayed beneath each input element, providing user-friendly feedback. I also included a "Save" button, and upon pressing it, the entered data is validated, and if successful, the item is added to the list.

Upon completing the form and clicking "Save," a pop-up dialog is displayed, showcasing the entered data. I utilized the `showDialog` function along with either `AlertDialog` or `CupertinoAlertDialog` based on the platform to ensure a consistent and platform-specific user experience.

To seamlessly navigate between pages, I modified the `ShopCard` widget in `itemCard.dart` to direct users to the new item addition form page when clicking the "Add Item" button on the main page (`MyHomePage`). I updated the colors and styling as requested, ensuring a cohesive and visually appealing UI. The left drawer (`left_drawer.dart`) facilitates easy navigation between the home page, the new item addition form page, and the page for viewing items.

Lastly, I implemented a simple data model (`item.dart`) to store and manage the items, utilizing a static list of `Item` instances. The `Item` class has attributes corresponding to the input elements in the form (Name, Price, Amount, and Description). The `add` method allows for adding new items to the list. To display the entered data in a pop-up after clicking the "Save" button on the new item addition page (ItemFormPage), I used the showDialog function in combination with either AlertDialog or CupertinoAlertDialog based on the platform (Android or iOS).

###  Create a drawer in the application with the determined requirements
To create a drawer in the application with the specified requirements, you implemented the LeftDrawer class in the left_drawer.dart file.

Drawer Header:
```
const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.black,
  ),
  child: Column(
    children: [
      Text(
        'Ad Infinitum',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Padding(padding: EdgeInsets.all(10)),
    ],
  ),
),

```
This part defines the header of the drawer, displaying the application name "Ad Infinitum" in a bold white font on a black background.

Drawer Options (ListTiles):
```
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Home Page'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
    );
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Add Item'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ItemFormPage(),
      ),
    );
  },
),
ListTile(
  leading: const Icon(Icons.checklist),
  title: const Text('View Items'),
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ViewItemPage(),
      ),
    );
  },
),
```
These `ListTile` widgets represent the options in the drawer. Each `ListTile` has an icon, a title, and an onTap callback function. When the user taps on a particular option, the `onTap` function is triggered. For instance, tapping "Home Page" (`MyHomePage`), "Add Item" (`ItemFormPage`), or "View Items" (`ViewItemPage`) will navigate the user to the corresponding pages.

Navigator.pushReplacement:
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => MyHomePage(),
  ),
);
```

This code snippet utilizes the `Navigator` to push a new route onto the navigation stack. The `pushReplacement` method replaces the current route with a new one, preventing the user from navigating back to the previous screen.

# Assignment 9 README.md

##  Can we retrieve JSON data without creating a model first? If yes, is it better than creating a model before retrieving JSON data?
Yes, it is possible to retrieve JSON data without creating a model first. However, it is generally considered a better practice to create a model before retrieving JSON data, as this provides several advantages:

- Improved type safety: By creating a model, you can explicitly define the structure of the JSON data, which can help to prevent errors and ensure that you are accessing the data correctly.
- Easier code maintenance: With a model, you can access the JSON data using properties and methods, which makes your code more readable and easier to maintain.
- Enhanced development experience: Using a model can provide a more streamlined development experience, as it can help to automate tasks such as data validation and serialization.

In some cases, it may be necessary to retrieve JSON data without creating a model first. For example, you may be working with a legacy API that does not provide a well-defined schema, or you may need to parse JSON data that is dynamically generated. In these cases, you can use a JSON parser to decode the data into a generic data structure, such as a dictionary or a list.

However, if possible, it is generally recommended to create a model before retrieving JSON data. This will help to ensure that your code is more reliable, maintainable, and developer-friendly.

## Explain the function of CookieRequest and explain why a CookieRequest instance needs to be shared with all components in a Flutter application.

In Flutter, a CookieRequest object encapsulates the cookies for an HTTP request. It provides methods for setting, getting, and removing cookies, as well as for encoding and decoding cookies from their string representation.

Sharing a single CookieRequest instance across all components in a Flutter application ensures that all components have access to the same set of cookies. This is important because cookies are often used to maintain state between requests, and if different components were using different sets of cookies, this state could become inconsistent.

Here are some of the benefits of sharing a single CookieRequest instance:

- Consistent state: All components will have access to the same set of cookies, ensuring that state is maintained consistently across the application.
- Reduced complexity: Sharing a single instance simplifies code management and reduces the likelihood of errors related to cookie handling.
- Improved performance: Reusing the same instance can potentially improve performance by avoiding the overhead of creating and destroying multiple instances.

In general, sharing a single CookieRequest instance is considered a good practice for managing cookies in Flutter applications. It promotes consistency, simplifies code, and can enhance performance.

## Explain the mechanism of fetching data from JSON until it can be displayed on Flutter.
Fetching and displaying data from JSON in Flutter involves a series of steps that transform raw JSON data into a structured representation that can be rendered on the UI. Here's a breakdown of the process:

1. Network Request: The first step is to initiate a network request to retrieve the JSON data from the server. This is typically done using the http package in Flutter. The request involves specifying the URL of the JSON data and any necessary headers or authentication credentials.

2. JSON Parsing: Once the network request is successful, the response containing the JSON data is received. The JSON data is then parsed into a Dart object using a JSON parser. This involves converting the JSON string into a structured data representation that can be easily manipulated and accessed in the Dart code.

3. Data Model Definition: To facilitate the parsing process, it's recommended to create a data model that defines the structure of the JSON data. This model typically consists of Dart classes that mirror the hierarchy and properties of the JSON objects. The parser uses this model to map the JSON data into corresponding Dart objects.

4. Data Processing and Transformation: Once the JSON data is parsed into Dart objects, it may need further processing or transformation before being displayed on the UI. This could involve data manipulation, calculations, or filtering.

5. UI Rendering: Finally, the processed data is used to render the UI elements. Flutter provides various widgets and layouts to construct the desired visual representation of the data. This involves binding the data to the UI elements, such as lists, cards, or text displays.

## Explain the authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter.
The authentication mechanism from entering account data on Flutter to Django authentication completion and the display of menus on Flutter involves a series of steps that verify user credentials, establish a session, and authorize access to protected resources. Here's a detailed explanation of the process:

1. Account Data Entry on Flutter: The user enters their account credentials, such as username and password, into a login form or dialog presented by the Flutter application. These credentials are captured and securely stored within the application's memory or temporary storage.

2. Credentials Submission to Django: The Flutter application sends a network request to the Django server, typically using the HTTP protocol, containing the user's credentials. This request is usually made to a dedicated authentication endpoint on the Django server.

3. Django Authentication Process: The Django server receives the authentication request and performs the necessary authentication checks. These checks typically involve validating the user's credentials against a database or other authentication system. If the credentials are valid, Django creates an authentication token, which is a unique identifier associated with the logged-in user.

4. Token Generation and Response: Django generates an authentication token and sends it back to the Flutter application as part of the response to the authentication request. The token may be sent in the form of a cookie, a header, or embedded within the response body.

5. Token Storage and Session Establishment: The Flutter application receives the authentication token and stores it securely within the application's memory or persistent storage. This token establishes a session, allowing the user to access protected resources.

6. Menu Display on Flutter: Upon successful authentication, the Flutter application fetches the user's menu information from the Django server. The menu information typically consists of a list of authorized actions or resources that the user is allowed to access.

7. Menu Rendering and Navigation: The Flutter application receives the menu information and parses it into a structured format. The menu data is then used to render the appropriate menu UI elements, such as navigation bars, sidebars, or dropdown menus. The user can interact with the menu elements to navigate to authorized areas of the application.

8. Authorization Checks: Throughout the application, authorization checks are performed to ensure that the user is only granted access to resources that they are permitted to view or modify. These checks typically involve verifying the user's identity based on the stored authentication token and comparing it against the access control rules defined in the Django application.

9. Token Refresh and Session Maintenance: To maintain the user's session and prevent it from expiring prematurely, the Flutter application may implement a token refresh mechanism. This mechanism periodically sends a request to the Django server to renew the authentication token, ensuring continued access to protected resources.

10. Logout and Session Termination: When the user logs out, the Flutter application invalidates the stored authentication token and removes it from memory or persistent storage. This effectively terminates the user's session and prevents them from accessing protected resources until they authenticate again.

## List all the widgets you used in this assignment and explain their respective functions.
In addition to the widgets I use in the previous assignment, I'll go ahead and explain only the ones that are new which are in ```login.dart```

MaterialApp: The root widget of the Flutter application, responsible for providing the overall theme and navigation.

Scaffold: Provides the basic structure of the page, including the app bar, body, and bottom navigation.

AppBar: Displays the application title and provides navigation actions.

Container: A widget used to group other widgets together and apply padding.

Column: Arranges widgets vertically within the container.

TextField: A text input field used for user input, such as username and password.

SizedBox: Adds empty space between widgets.

ElevatedButton: A raised button used to trigger actions, such as login.

AlertDialog: Displays a modal dialog with a message and action buttons.

TextButton: A simple button used for actions within dialogs.


## Explain how you implement the checklist above step by step! (not just following the tutorial).
To preface, I can't really divide this into sections as per step so I'll narrate it instead and tell you what I've gone ahead and do to achieve the checklists. I first created a django app within my django app called authentication, and have it integrate with the flutter system.

Using this code in the authentication's views.py:
```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Successful login status.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login successful!"
                # Add other data if you want to send data to Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, account disabled."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, check email or password again."
        }, status=401)
```

and this in its urls.py:
```
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```

Then I added ```path('auth/', include('authentication.urls'))``` in my main django app's urls.py.

To integrate it, I downloaded the packages provided by the TAs using these commands:
```
flutter pub add provider
flutter pub add pbp_django_auth
```

And I added a CookieRequest to all child widgets, specifically in my main.dart, as such:

```
...
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
...
```

Next I created a login.dart file for the login page that is placed in the screens directory, and redirected the home in ```main.dart``` to the ```LoginPage()``` instead of ```MyHomePage```. Such that when opening the app, it prompts the user to log in first. 

Next, since I already have item.dart from the previous assignment, all I did was change it or rewrite it to better suit my Django Website's Model using Quicktype.

Next, I added an http dependency in the ```AndroidManifest.xml``` file by adding this code:

```
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```

To view the items or fetch data from django, I edited a few tids and bits in my ```viewItem.dart ```, changing it to add a url and fetch the necessary data. And I rerouted the button in ```left_drawer.dart``` such that it routes to the ```viewItem.dart```. I then also rerouted the button in the main page too, such that it also goes to ```viewItem.dart``` when pressed.

Now, to integrate the flutter form with the django service, i.e. making it so that I can add items to django using my app, I first added this view function in my main django website app:


```
@csrf_exempt
@login_required
def create_product_flutter(request):
    if request.method == 'POST':
        data = json.loads(request.body)

        new_product = Product.objects.create(
            user=request.user,
            name=data["name"],
            value=int(data["value"]),
            description=data["description"],
            weight=int(data["weight"]),
            is_new=bool(data["is_new"])
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```

And added a path in the urls.py
```
    path('create-flutter/', create_product_flutter, name='create_product_flutter'),
```

Next, in the itemForm.dart, I added this request variable:
```
final request = context.watch<CookieRequest>();
```

and this on the ```onPressed``` block, according to my django app app models.
```
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Send request to Django and wait for the response
                        // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/", // Adjust the URL endpoint
                          jsonEncode(<String, String>{
                            'name': _name,
                            'value': _value.toString(),
                            'description': _description,
                            'weight': _amount.toString(),
                            'is_new': _is_new.toString(),
                          }),
                        );
```

Next is implementing the Logout Feature. To do that, I added another views.py function for the authentication django app
```
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logged out successfully!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout failed."
        }, status=401)
```

and rerouted it in the urls.py:
```
    path('logout/', logout, name='logout'),
```

Then, in the ```itemCard.dart```, same thing as before. I added the request variable:

```
    final request = context.watch<CookieRequest>();
```

And have made it such, when the item.name is Logout, it logs you out:
```
          } else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Change the URL to your Django app's URL. Don't forget to add the trailing slash (/) if needed.
                "http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Good bye, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
```
