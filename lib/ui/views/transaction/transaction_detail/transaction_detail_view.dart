import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/utils/static_item_helpers.dart';
import 'package:personal_finance_management_app/core/utils/ui_helpers.dart';
import 'package:personal_finance_management_app/ui/components/custom_app_bar.dart';
import 'package:personal_finance_management_app/ui/components/delete_button.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_detail/transaction_detail_view.form.dart';
import 'package:personal_finance_management_app/ui/views/transaction/transaction_detail/transaction_detail_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

// View: Shows the UI to the user.
// Single widgets also qualify as views
// (for consistency in terminology) a view,
// in this case, is not a "Page"
// it's just a UI representation.

@FormView(fields: [
  FormDropdownField(
    name: 'accountId',
    items: [],
  ),
  FormDropdownField(
    name: 'transactionType',
    items: transactionTypeStaticDropdownItems,
  ),
  FormTextField(initialValue: '', name: 'amount'),
  FormDropdownField(
    name: 'category',
    items: [],
  ),
  FormTextField(initialValue: '', name: 'notes'),
])
class TransactionDetailView extends StatelessWidget
    with $TransactionDetailView {
  TransactionDetailView({
    Key? key,
    this.isAddTransaction = true,
  }) : super(key: key);

  final bool isAddTransaction;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    final appBarTitle =
        isAddTransaction ? "New Transaction" : "Transaction Detail";
    final actionButtonTooltip =
        isAddTransaction ? "Save Transaction" : "Save Changes";

    return ViewModelBuilder<TransactionDetailViewModel>.reactive(
      viewModelBuilder: () => TransactionDetailViewModel(),
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.initForm(
          amountController: amountController,
          notesController: notesController,
        );
      },
      onDispose: (_) => disposeForm(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: model.popCurrentView,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check_rounded),
              tooltip: actionButtonTooltip,
              onPressed: () => model.saveTransaction(),
            ),
          ],
        ),
        backgroundColor: customTheme.contrastBackgroundColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
            child: Column(
              children: [
                DropdownButtonFormField(
                  key: const ValueKey(AccountIdValueKey),
                  value: model.accountIdValue,
                  decoration: InputDecoration(
                    label: const Text("Account Name"),
                    errorText: model.accounts.isEmpty
                        ? model.emptyAccountErrorMessage
                        : null,
                  ),
                  items: model.accounts
                      .map(
                        (account) => DropdownMenuItem<String>(
                          key: ValueKey('${account.id} key'),
                          value: account.id.toString(),
                          child: Text(account.name ?? ""),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) =>
                      model.handleAccountChange(value!),
                ),
                DropdownButtonFormField(
                  key: const ValueKey(TransactionTypeValueKey),
                  value: model.transactionTypeValue,
                  decoration: const InputDecoration(
                    label: Text("Transaction Type"),
                  ),
                  items: TransactionTypeValueToTitleMap.keys
                      .map(
                        (value) => DropdownMenuItem<String>(
                          key: ValueKey('$value key'),
                          value: value,
                          child: Text(TransactionTypeValueToTitleMap[value]!),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) =>
                      model.handleTransactionTypeChange(value!),
                ),
                TextField(
                  key: const ValueKey(AmountValueKey),
                  decoration: const InputDecoration(labelText: "Amount"),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [model.currencyInputFormatter],
                ),
                DropdownButtonFormField(
                  key: const ValueKey(CategoryValueKey),
                  value: model.categoryValue,
                  decoration: const InputDecoration(
                    label: Text("Category"),
                  ),
                  items: model.dummyCategory
                      .map(
                        (value) => DropdownMenuItem<String>(
                          key: ValueKey('$value key'),
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) => model.setCategory(value!),
                ),
                TextField(
                  readOnly: true,
                  key: const ValueKey("date"),
                  controller: model.dateController,
                  onTap: () => model.setTransactionDate(context),
                  decoration: InputDecoration(
                    labelText: 'Date',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      iconSize: 20,
                      color: customTheme.actionButtonColor,
                      onPressed: () => model.setTransactionDate(context),
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  key: const ValueKey("time"),
                  controller: model.timeController,
                  onTap: () => model.setTransactionTime(context),
                  decoration: InputDecoration(
                    labelText: 'Time',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      iconSize: 20,
                      color: customTheme.actionButtonColor,
                      onPressed: () => model.setTransactionTime(context),
                    ),
                  ),
                ),
                TextField(
                  key: const ValueKey(NotesValueKey),
                  decoration: const InputDecoration(labelText: 'Notes'),
                  controller: notesController,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                ),
                // TODO: Move delete into AppBar action button
                if (!isAddTransaction) ...[
                  verticalSpaceRegular,
                  DeleteButton(
                    label: 'Delete Transaction',
                    onPressed: () {},
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
