import 'package:authencicationtest/widgets/docker_ps/docker_ps.dart';
import 'package:flutter/material.dart';
import 'home_body.dart';

final Color backgroundColor = Color(0xFF4A4A58);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 46, 46, 1),
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.dashboard),
                    backgroundColor: Colors.amber[900],
                  ),
                  title: Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page1()));
                  },
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.message),
                    backgroundColor: Colors.amber[900],
                  ),
                  title: Text("VM Resources",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.help),
                    backgroundColor: Colors.amber[900],
                  ),
                  title: Text("Help",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
                SizedBox(height: 50),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.info),
                    backgroundColor: Colors.amber[900],
                  ),
                  title: Text("About",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 22,
          color: backgroundColor,
          child: ClipRRect(
            borderRadius: isCollapsed
                ? BorderRadius.circular(1)
                : BorderRadius.circular(30),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black54,
                leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        if (isCollapsed)
                          _controller.forward();
                        else
                          _controller.reverse();

                        isCollapsed = !isCollapsed;
                      });
                    }),
              ),
              body: Mybody(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
