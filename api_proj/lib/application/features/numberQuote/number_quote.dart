import 'package:api_proj/application/core/services/app_fonts.dart';
import 'package:api_proj/application/features/numberQuote/bloc/number_quote_bloc.dart';
import 'package:api_proj/application/features/numberQuote/widget/erorr_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/context_show.dart';

class NumberQuote extends StatelessWidget {
  const NumberQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NumberQuoteBloc(),
      child: NumberQuoteScreen(),
    );
  }
}

class NumberQuoteScreen extends StatelessWidget {
  NumberQuoteScreen({super.key});

  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          // height: double.infinity,
          // color: Colors.red,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<NumberQuoteBloc, NumberQuoteState>(
                builder: (context, state) {
                  if (state is NumberQuoteLoadingState) {
                    return const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ),
                    );
                  } else if (state is NumberQuoteLoadedState) {
                    return ContentCard(
                      quote: state.quote,
                    );
                  } else if (state is NumberQuoteErrorState) {
                    return ErrorShowWidget(message: state.message);
                  } else {
                    return const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          ),
                          Text("no data")
                          // CircularProgressIndicator()
                        ],
                      ),
                    );
                  }
                },
              ),
              // Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextField(
                          controller: numberController,
                          style: AppFonts.primaryText,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black26)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black26)),
                            hintText: "Enter Number",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(8),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {
                          final num = numberController.text;
                          if (numberController.text == "") {
                            BlocProvider.of<NumberQuoteBloc>(context)
                                .add(NumberQuoteRequestsEvent(number: num));
                            // final snak =
                            //     SnackBar(content: Text("must enter number"));
                            // ScaffoldMessenger.of(context).showSnackBar(snak);
                          } else {
                            BlocProvider.of<NumberQuoteBloc>(context)
                                .add(NumberQuoteRequestsEvent(number: num));
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
