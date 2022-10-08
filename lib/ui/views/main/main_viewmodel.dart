import 'package:personal_finance_management_app/app/app.locator.dart';
import 'package:personal_finance_management_app/app/app.logger.dart';
import 'package:personal_finance_management_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModel: Manages the state of the View,
// business logic, and any other logic as required from user interaction.
// It does this by making use of the services
class MainViewModel extends IndexTrackingViewModel {
  final _logger = getLogger('MainViewModel');
  final _navigationService = locator<NavigationService>();

  void navigateToTransactionDetail() {
    _logger.i('argument: NONE');
    _navigationService.navigateToTransactionDetailView();
  }
}
