import 'package:api_proj/apis.dart';
import 'package:api_proj/number_fact_resp.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'number_quote_event.dart';
part 'number_quote_state.dart';

class NumberQuoteBloc extends Bloc<NumberQuoteEvent, NumberQuoteState> {
  NumberQuoteBloc() : super(NumberQuoteInitial()) {
    on<NumberQuoteRequestsEvent>((event, emit) async{
      // TODO: implement event handler
      late NumFactResp quote;
      try{
        emit(NumberQuoteLoadingState());
        await Future.delayed(Duration(seconds: 2)).then((value) async{
          quote= await getNumberData(number: event.number);
          print(quote.text);
          if(quote.text!.isEmpty){
            emit(NumberQuoteErrorState(message: "No Data"));
          }else if(quote.text!.isNotEmpty){
            emit(NumberQuoteLoadedState(quote: quote));
          }else{
            emit(NumberQuoteErrorState(message: "no date"));
          }
        });
      }catch(e){
        emit(NumberQuoteErrorState(message: e.toString()));
      }
    });
  }
}
