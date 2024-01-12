part of 'number_quote_bloc.dart';

@immutable
abstract class NumberQuoteState {}

class NumberQuoteInitial extends NumberQuoteState {}

class NumberQuoteLoadingState extends NumberQuoteState {}

class NumberQuoteLoadedState extends NumberQuoteState {
  final NumFactResp quote;
  NumberQuoteLoadedState({
    required this.quote,
  });
}

class NumberQuoteErrorState extends NumberQuoteState {
  final String message;

  NumberQuoteErrorState({
    required this.message,
  });
}
