import 'package:campus_eats_flutter/src/routes/pages.dart';
import 'package:flutter/material.dart';

class NavbarComponent extends StatefulWidget {
  const NavbarComponent({super.key});

  @override
  State<NavbarComponent> createState() => _NavbarComponentState();
}

class _NavbarComponentState extends State<NavbarComponent> {
  @override
  Widget build(BuildContext context) {
    return getNavbar(context);
  }

  Widget getNavbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _navbarElement(
          Icon(Icons.home, color: _getIconColor(context, Pages.productsList)),
          Pages.productsList,
        ),
        _navbarElement(
          Icon(Icons.favorite, color: _getIconColor(context, Pages.favourites)),
          Pages.favourites,
        ),
        _navbarElement(
          Icon(Icons.filter_alt, color: _getIconColor(context, "")),
          "",
        ),
        _navbarElement(
          Icon(Icons.shopping_cart, color: _getIconColor(context, "")),
          "",
        ),
      ],
    );
  }

  Color _getIconColor(BuildContext context, String route) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return currentRoute == route
        ? Colors.green
        : Color.fromARGB(255, 117, 117, 117);
  }

  Widget _navbarElement(Icon icono, String route) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(
          color: _getIconColor(context, route),
        ),
      ),
      margin: EdgeInsets.only(right: 30.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: icono,
        ),
      ),
    );
  }
}
