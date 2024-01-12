part of 'number_quote_bloc.dart';

@immutable
abstract class NumberQuoteEvent {}

class NumberQuoteRequestsEvent extends NumberQuoteEvent {
  final int number;

  NumberQuoteRequestsEvent({
    required this.number,
  });
}
