import 'package:api_proj/domain/usecase/post_usecases.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../domain/entites/number_quote_enittes.dart';

part 'number_quote_event.dart';
part 'number_quote_state.dart';

class NumberQuoteBloc extends Bloc<NumberQuoteEvent, NumberQuoteState> {
  NumberQuoteBloc() : super(NumberQuoteInitial()) {
    on<NumberQuoteRequestsEvent>((event, emit) async {
      late NumFactResp quote;
      try {
        emit(NumberQuoteLoadingState());
        await Future.delayed(const Duration(seconds: 2)).then((value) async {
          final num = int.parse(event.number);
          quote = await PostUseCases().getPostFromUseCase(number: num);

          if (quote.text!.isEmpty) {
            emit(NumberQuoteErrorState(message: "No data in record"));
          } else if (quote.text!.isNotEmpty) {
            final quoteOnly = quote.text!.split('${quote.number!} is ');
            emit(NumberQuoteLoadedState(quote: quoteOnly[1]));
          } else {
            emit(NumberQuoteErrorState(message: "No data in record"));
          }
        });
      } on FormatException catch (_) {
        emit(NumberQuoteErrorState(message: "Must enter number..."));
      } catch (e) {
        emit(NumberQuoteErrorState(message: e.toString()));
      }
    });
  }
}
