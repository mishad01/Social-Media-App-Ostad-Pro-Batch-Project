import 'package:flutter/material.dart';

class AddMusicView extends StatelessWidget {
  const AddMusicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
            onPressed: () {

            },
          ),
        ),
        title: const Text(
          'Add music',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,

              color: Colors.black
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            const CustomSearchField(),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Rema, Selena Gomez - Calm Down',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.play_circle_outline),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 1.0),
                          child: Text(
                            '20 seconds',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: double.infinity,
        child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle: const TextStyle(color: Color(0xff98A2B3)),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xff6993FF),
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xff475467),
              ),
            ),
            ),
        );
    }
}