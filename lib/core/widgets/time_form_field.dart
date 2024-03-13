import 'package:flutter/material.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/widgets.dart';

class TimeFormField<T> extends FormField<T> {
  TimeFormField({
    required int itemCount,
    required Widget? Function(int) itemBuilder,
    super.validator,
    super.key,
  }) : super(
          builder: (FormFieldState<T> state) {
            return Column(
              children: [
                SizedBox(
                  height: Tokens.size.ref18,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => itemBuilder(index),
                    separatorBuilder: (_, index) {
                      return SizedBox(width: Tokens.size.ref1);
                    },
                    itemCount: itemCount,
                  ),
                ),
                if (state.hasError) ErrorText(state.errorText!),
              ],
            );
          },
        );
}
