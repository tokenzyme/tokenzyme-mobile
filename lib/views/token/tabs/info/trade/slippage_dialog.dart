import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/extensions/context.dart';
import 'package:tokenzyme_mobile/extensions/string.dart';
import 'package:tokenzyme_mobile/providers/providers.dart';
import 'package:tokenzyme_mobile/utils/numbers.dart';
import 'package:tokenzyme_mobile/utils/storage.dart';
import 'package:tokenzyme_mobile/widgets/custom_filled_button.dart';

class SlippageDialog extends HookConsumerWidget {
  const SlippageDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<double> slippageAsyncValue = ref.watch(slippageProvider);

    GlobalKey<FormState> formKey = useMemoized(() => GlobalKey<FormState>(), <dynamic>[]);

    TextEditingController slippageController = useTextEditingController();

    void handleSlippageChanged() {
      if (formKey.currentState?.validate() == true) {
        try {
          double slippage = double.parse(slippageController.text);
          saveSlippage(slippage);
          ref.invalidate(slippageProvider);
          context.pop();
        } catch (ex) {
          // Nothing to do...
        }
      }
    }

    useEffect(() {
      if (slippageAsyncValue.hasValue) {
        slippageController.text = formatNumber(slippageAsyncValue.requireValue);
      }
      return null;
    }, <dynamic>[slippageAsyncValue.hasValue]);

    if (slippageAsyncValue.isLoading || slippageAsyncValue.hasError) {
      return SizedBox.shrink();
    }

    return Form(
      key: formKey,
      child: Dialog(
        insetPadding: EdgeInsets.all(AppPadding.content),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppPadding.content,
          children: <Widget>[
            'Slippage'.text(style: context.dialogTitle),
            TextFormField(
              controller: slippageController,
              decoration: InputDecoration(suffixText: '%'),
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                try {
                  if (value == null || value.isEmpty) {
                    return 'Slippage is required';
                  }
                  double percentage = double.parse(value);
                  if (percentage > 100 || percentage < 0) {
                    return 'Invalid slippage';
                  }
                  return null;
                } catch (ex) {
                  return 'Invalid slippage';
                }
              },
            ),
            Row(
              children: <Widget>[
                CustomFilledButton(
                  label: 'Change',
                  onPressed: handleSlippageChanged,
                ).expanded(),
              ],
            ),
          ],
        ).paddingAll(AppPadding.content),
      ),
    );
  }
}
