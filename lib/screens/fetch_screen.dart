import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/articles_provider.dart';
import '../resources/route_manager.dart';
import '../resources/string_manager.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({Key? key}) : super(key: key);

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  bool _isLoading = false;
  String errorText = AppString.emptyString;
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        try {
          setState(() => _isLoading = true);
          await getEgyptianData();
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

  Future<void> getEgyptianData() async {
    await Provider.of<ArticlesProvider>(context, listen: false).getEgyptData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading || errorText == AppString.emptyString
            ? const CircularProgressIndicator()
            : errorText == AppString.emptyString
                ? const CircularProgressIndicator()
                : Text(errorText),
      ),
    );
  }
}
