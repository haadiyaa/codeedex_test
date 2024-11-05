import 'package:codeedex_test/presentation/providers/functionsprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<FunctionsProvider>(context, listen: false);
    provider.getProducts();
    provider.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
