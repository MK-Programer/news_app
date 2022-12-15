import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/resources/route_manager.dart';
import 'package:provider/provider.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({Key? key}) : super(key: key);

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  bool _isLoading = false;
  String errorText = '';
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        try {
          setState(() => _isLoading = true);
          await getEgyptData();
          setState(() => _isLoading = false);
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.mainRoute,
            ModalRoute.withName(
              Routes.fetchRoute,
            ),
          );
        } catch (error) {
          print(error.toString());
        }
      },
    );
    super.initState();
  }

  Future<void> getEgyptData() async {
    await Provider.of<NewsProvider>(context, listen: false).getEgyptData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading || errorText == ''
            ? const CircularProgressIndicator()
            : errorText == ''
                ? const CircularProgressIndicator()
                : Text(errorText),
      ),
    );
  }
}
