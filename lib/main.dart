import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    AlertDialogPage(),
    TabBarPage(),
    CardPage(),
    DrawerPage(),
    ListViewPage(),
    CheckboxPage(),
    RadioButtonPage(),
    ProgressBarPage(),
    TablePage(),
    SnackBarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Components Example'),
        backgroundColor: Colors.blue,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'AlertDialog',
            backgroundColor: Colors.blue,
            

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tab),
            label: 'TabBar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Drawer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Checkbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio_button_checked),
            label: 'Radio Button',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.linear_scale),
            label: 'Progress Bar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Table',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'SnackBar',
          ),
        ],
      ),
    );
  }
}

class AlertDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Election 2020'),
                content: Text('Will you vote for Trump?'),
                actions: [
                  ElevatedButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    
                  ),
                ],
              );
            },
          );
        },
        child: Text('AlertDialog'),
      ),
    );
  }
}

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: createTabBar(),
        ),
    
            body: TabBarView(
              children: [
                Center(child: Text("Transit")),
                Center(child: Text("Bike")),
                Center(child: Text("Boat")),
                Center(child: Text("Railway"))
              ],
            ),
      )
    );
  }
  TabBar createTabBar(){
    return TabBar(
      tabs:[
        Row(children: [Icon(Icons.directions_transit), SizedBox(width:5), Text("Transit")]),
        Row(children: [Icon(Icons.directions_bike), SizedBox(width:5), Text("Bike")]),
        Row(children: [Icon(Icons.directions_boat), SizedBox(width:5), Text("Boat")]),
        Row(children: [Icon(Icons.directions_railway), SizedBox(width:5), Text("Railway")]),
      ],
      isScrollable: true,
    );
  }
}

class CardPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Center(
      child: Container(
        width: 300,
        height: 200,
        padding: new EdgeInsets.all(10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.red,
          elevation: 10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album, size: 60),
                title: Text('Sonu Nigam', 
                style: TextStyle(fontSize: 30.0)),
                subtitle: Text('Best of Sonu Music',
                style: TextStyle(fontSize: 18.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer Example'),
        backgroundColor: Colors.green[600],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: UserAccountsDrawerHeader(
                accountName: Text('Nazerke'),
                accountEmail: Text("nazerke@flutter.dart"),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("About me"),
              leading: Icon(Icons.account_box),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        ),ListTile(
          leading: Icon(Icons.contacts),
          title: Text('Contacts'),
        ),ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    );
  }
}

class CheckboxPage extends StatefulWidget {
  @override
  _CheckboxPageState createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
 List<String> selectedHobbies = [];


  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your hobbi'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CheckboxListTile(
            title: Text('football'),
            value: selectedHobbies.contains('football'),
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedHobbies.add('football');
                } else {
                  selectedHobbies.remove('football');
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text('baseball'),
            value: selectedHobbies.contains('baseball'),
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedHobbies.add('baseball');
                } else {
                  selectedHobbies.remove('baseball');
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text('basketball'),
            value: selectedHobbies.contains('basketball'),
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedHobbies.add('basketball');
                } else {
                  selectedHobbies.remove('basketball');
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text('Video games'),
            value: selectedHobbies.contains('Video games'),
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedHobbies.add('Video games');
                } else {
                  selectedHobbies.remove('Video games');
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text('Reading books'),
            value: selectedHobbies.contains('Reading books'),
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedHobbies.add('Reading books');
                } else {
                  selectedHobbies.remove('Reading books');
                }
              });
            },
          ),
          CheckboxListTile(
            title: Text('Using internet'),
            value: selectedHobbies.contains('Using internet'),
            onChanged: (bool? value) {
              setState(() {
                if (value != null && value) {
                  selectedHobbies.add('Using internet');
                } else {
                  selectedHobbies.remove('Using internet');
                }
              });
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // Действие по нажатию кнопки
              print(selectedHobbies);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
 
  

class RadioButtonPage extends StatefulWidget {
  @override
  _RadioButtonPageState createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  bool _isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          title: Text('Male'),
          value: false,
          groupValue: _isFemale,
          onChanged: (value) {
            setState(() {
              _isFemale = value ?? false;
            });
          },
        ),
        RadioListTile(
          title: Text('Female'),
          value: true,
          groupValue: _isFemale,
          onChanged: (value) {
            setState(() {
              _isFemale = value ?? false;
            });
          },
        ),
      ],
    );
  }
}

class ProgressBarPage extends StatefulWidget {
  @override
  _ProgressBarPageState createState() => _ProgressBarPageState();
}

class _ProgressBarPageState extends State<ProgressBarPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              _isLoading = false;
            });
          });
        },
        child: Text('Show Progress Bar'),
      ),
    );
  }
}

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Table(
        border: TableBorder.all(),
        children: [
          TableRow(
            children: [
              Column(children: [Text('FirstName', style: TextStyle(fontSize: 20))]),
              Column(children: [Text('LastName', style: TextStyle(fontSize: 20))]),
              Column(children: [Text('Year', style: TextStyle(fontSize: 20))]),
            ]),
          
          TableRow(
            children: [
              Column(children: [Text('Nazerke')]),
              Column(children: [Text('Namazbayeva' )]),
              Column(children: [Text('2004')]),
            ]),
          TableRow(
            children: [
              Column(children: [Text('Alina')]),
              Column(children: [Text('Nusip')]),
              Column(children: [Text('2003')]),
            ]
          ),
          TableRow(
            children: [
             Column(children: [Text('Medina')]),
              Column(children: [Text('Aripova')]),
              Column(children: [Text('2002')]),
            ]
          ),
        ],
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Hey! This is a Snackbar message.'),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
               
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 25.0),
          primary: Colors.redAccent,
          padding: EdgeInsets.all(8.0),
          onPrimary: Colors.white,
          
        ),
        child: Text('Show SnackBar'),
      ),
    );
  }
}
