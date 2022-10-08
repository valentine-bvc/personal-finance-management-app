import 'package:flutter/material.dart';
import 'package:personal_finance_management_app/core/enums/transaction_type.dart';
import 'package:personal_finance_management_app/ui/themes/custom_theme.dart';
import 'package:personal_finance_management_app/ui/themes/theme_text.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    this.description,
    this.accountName,
    this.amount,
    this.transactionType,
    this.timeStamp,
    required this.onTap,
  }) : super(key: key);

  final String? description;
  final String? accountName;
  final String? amount;
  final TransactionType? transactionType;
  final String? timeStamp;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomTheme>()!;

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      leading: const CircleAvatar(
        radius: 18,
        backgroundColor: Colors.blue,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemeText.listItemTitle(description ?? ''),
          ThemeText.listItemSubTitle(accountName ?? ''),
        ],
      ),
      trailing: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ThemeText.listItemSubTitle(
                  amount ?? '',
                  color: transactionType == TransactionType.expense
                      ? customTheme.danger
                      : customTheme.success,
                ),
                Icon(
                  transactionType == TransactionType.expense
                      ? Icons.arrow_drop_down_rounded
                      : Icons.arrow_drop_up_rounded,
                  color: transactionType == TransactionType.expense
                      ? customTheme.danger
                      : customTheme.success,
                ),
              ],
            ),
            ThemeText.listItemSubTitle(timeStamp ?? ''),
          ],
        ),
      ),
    );
  }
}