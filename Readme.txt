Install
1 - install flutter, android studio and xcode in mac
2 - keep update all things

Basics
3 - create simple appbar, scaffold, material app in simple screen
4 - create utils for repetitive things
5 - create body and center/column for that
6 - create scrollview and add columns inside it for making multiple buttons
7 - create function for navigation in utils

ListView
8 - create listview in screen02
    - Only Scafold Screen have back button autogenrated
    - if you use material app then there is no option of going back on top
9 - create a function for getting list of widgets
10 - create custom button widget if needed
11 - create action appbars
12 - create Listview with children as that function in step 9
13 - pass this listview in cols in Expanded WidgetView

Intent
14 - create data passing intent screen03
15 - use DataPassing Screen is an example of using route

SharedPrefs
16 - shared prefs at screen04
17 - add dependency (shared_preferences: any) in pubspec.yaml
18 - run pub get
19 - import dependencies
20 - create a stateful widget for shredpref work
21 - create vars for storing in sp
--GET--
22 - override initsate here you'll access all previously store preferences
23 - create a future function for retreiving shared prefs
24 - create another simple function to get value from future and set updated state with that var
--SAVE--
25 - a future function for saving sharedprefs after getting its instance
26 - then a function to access this future
--WORK--
27 - intialize the textEditingController
28 - a widget for edit text whose controller control the data
29 - then a raised button which will call the function for saving the sp
29 - add widget to show everything in a proper format and alignment
30 - Fully Reload Your App or ReINSTALL on ur Iphone Simulator


Internet Connectivity
- https://javiercbk.github.io/json_to_dart/ (USE this for Model class creation)

31 - add http: any in pubspec.yaml, get it
32 - create a stateful class and access it
33 - import usefuls, http as http, utils, material, convert(for json), async (for futures)
34 - create a model for ur data coming through api,
        create its constructor and factory method to convert from json
35 - create a function for ErrorView in utils
36 - a future for fetching all posts fetch posts using jsondecode if status == 200 else throw Exception
37 - a future for getting all posts in a list format
38 - a function for getting the designed list tiles
39 - a function for checking tiles to save it from null exception
40 - a function to get all listTiles for a listView using ListView.builder
41 - move widget to utils functions for listTile (beautiful widget)
42 - create a future builder to fetch all posts
43 - set future the getallposts function and builder has a switch against ConnectionState
44 - Text(NONE) for none state,
        ProgressBar from utils in waiting
        leave the active
        your widget in final one
45 - check against snapshot.hasdata and display results on it
46 - create a widget whose height is using MediaQuery, child is ListView.Builder
47 - if height is overflowing use the SingleChildScrollView so it'll adjust them


SqlLite Database
48 - create a model to store in your DB with its contract class (Department)
49 - this model may holds all necessary functions like getter/setters and from/to json etc.
50 - add following dependencies
    - sqflite: any (for sqllite)
    - path_provider: any (for handling paths)
    - intl: ^0.15.7 (for handling internationalization, localization
                     e.g. msg translation - date/num formatting/parsing etc.)
51 - create a database helper file in db folder
52 - import path, sqlflite, model and async (for futures)
53 - create a database helper class
54 - intialize its instance using some factory method
55 - access table_name
56 - create a getter to get the already initialized db if available
57 - a method of initializedDb for its initialization first time
58 - a function to create table against your model class, mentioned earlier
59 - write 4 functions for CRUD operations, in every func first get db instance then
    - CREATE (x.insert)
    - READ (x.query(abc).toList())
    - UPDATE (x.update)
    - DELETE (x.delete)
60 - create function for counting rows in your table
61 - function to close the db is also necessary for saving PC from MemoryLeaks
62 - a helper function to get all entries from db in a list format using READ method
63 - now create a stateful widget for SQL-Lite screen
64 - create objects for a list and db_helper
65 - get list from db through in initState function and save them in list using model.fromMap function
66 - create widget for displaying on screen
67 - two functions one for adding new item and one for deleting,
     these functions call futures of CRUD using db_helper object
68 - adjust your widget styling if needed


BLOC pattern
- https://bloclibrary.dev/#/fluttercountertutorial

69 - flutter has a bloc (business-logic) pattern to separate the ui and code logic for better implementation like MVC
70 - bloc has 4 main concepts state, event, stream, sink
71 - state: data your ur app is currently showing (ui reacts to state changes)
72 - event: any action detected by app, mostly it's user action
73 - stream: a medium through which data travels
74 - sink: a point in stream through which user receive data
75 - UI <-> BLOC <-> DataProvider, bloc only contains your business logic
76 - always do the paper work for your app either it needs block or not ?
77 - bloc must contain two functions which are fundamentals
    - initial state
    - mapping function (render the new state on any action)
    - stream of new states
    - sink to get data from streams
78 - always first find out how many actions do your app have that changes the state, e.g. counter
79 - a new screen 07 for bloc screen, create ui of your design
80 - add two dependencies 'bloc, flutter_bloc'
81 - create new flutter bloc model file, import bloc.dart
82 - first create all possible events that can change the state of your app here
83 - either can create a class or enum for your events
84 - after that create bloc model class extends with Bloc and pass events and return data type
85 - override two fundamental functions,
    - intial state: which return starting output in this case 0
    - mapping function: change this function to async to run it in separate thread and continously active
86 - write a switch against all possible events
87 - access current state by simply using state and yield state + 1
88 - Difference between yield and return
    - yield return a value but does not terminate the function
    - however, return returns a value and terminate the function
89 - now in your ui import flutter_bloc and model class and create a bloc_provider
90 - wrap up your main widget's body with that bloc_provider
    * - if using routes do this for main material app
91 - create new bloc_provider object at start of your build function
92 - on buttons pressed add event of your choice to access that call that function in bloc
93 - now put your widget that is going to affect by the bloc events under the BlocBuilder widget
94 - do the things using bloc to separate your business logic for ui logic

Google MAPS:
helpful_links
- https://medium.com/flutter-community/google-maps-in-flutter-i-feeb72354392
- https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/#5
- https://www.raywenderlich.com/4466319-google-maps-for-flutter-tutorial-getting-started

Firebase/Firestore:
- https://codelabs.developers.google.com/codelabs/flutter-firebase/#0
Go for it and complete. Remember it requires a lot of authentication permissions and API keys.
- follows the procedure and keep learning

For more information see your older version of basic app or flutter learning for codes in your drive