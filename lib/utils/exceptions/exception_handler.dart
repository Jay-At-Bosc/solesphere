import '../../common/widgets/popup/loaders.dart';
import 'custom_exception.dart';

class ExceptionHandler{
  static errorHandler(e,Function() function){
    if (e is CustomInternetException) {
        TLoaders.errorDialog(
            title: e.title, message: e.message, ontap: function);
      } else if (e is CustomException) {
       TLoaders.errorSnackBar(title: e.title, message: e.message);
      } else {
        TLoaders.errorSnackBar(message: e.toString());
      }
  }
}