part of 'number_quote_bloc.dart';

@immutable
abstract class NumberQuoteEvent {}

class NumberQuoteRequestsEvent extends NumberQuoteEvent {
  final String number;

  NumberQuoteRequestsEvent({
    required this.number,
  });
}
