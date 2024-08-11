import 'package:flutter_trabalho3_opta1/commons.dart';

showSnackbar({
  required BuildContext context,
  required String label,
  bool isError = true,
}){
  SnackBar snackBar = SnackBar(
    content: Text(label),
    backgroundColor: (isError ? AppColors.error : AppColors.success),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
    ),
    duration: const Duration(seconds: 4),
    showCloseIcon: true,
    
    // action: SnackBarAction(
    //   label: 'Ok',
    //   textColor: AppColors.textButton,
    //   onPressed: () {
    //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
    //   },
    //  ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}