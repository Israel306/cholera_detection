import 'package:flutter/material.dart';

import '../Result/Result1.dart';
import '../Result/Result2.dart';
import '../Result/Result3.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> selectedSymptoms = [];

  void nextPage(List<String> symptoms) {

    setState(() {
      selectedSymptoms = symptoms;
    });

    if (_currentPage < 3) { // Only move if not on the last page
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: [
          Symptoms1(onNext: nextPage),
          Symptoms2(onNext: nextPage),
          Symptoms3(onNext: nextPage),// Replace with your next UI

        ],
      ),
    );
  }
}

class Symptoms1 extends StatefulWidget {
  final Function(List<String>) onNext;

  const Symptoms1({super.key, required this.onNext});

  @override
  State<Symptoms1> createState() => _Symptoms1State();
}

class _Symptoms1State extends State<Symptoms1> {
  List<String> symptoms = [
    "Diarrhea",
    "Vomiting",
    "Dehydration",
    "Cramps",
    "Rapid heart rate",
    "Nausea",
    "Dizziness",
    "Fatigue",
    "Sunken eyes",
    "Little or no urination",
    "Fainting"
  ];

  List<String> selectedSymptoms = [];

  void toggleSymptom(String symptom) {
    setState(() {
      if (selectedSymptoms.contains(symptom)) {
        selectedSymptoms.remove(symptom);
      } else {
        selectedSymptoms.add(symptom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cholera.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            const Text(
              'Cholera Detector',
              style: TextStyle(
                color: Color(0xFF176C90),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(color: Colors.grey, thickness: 2,),
            SizedBox(height: 10),// Horizontal line after AppBar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Symptoms",
                    style: TextStyle(
                      color: Color(0xFF176C90),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "What symptoms are you experiencing?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: symptoms.map((symptom) {
                      bool isSelected = selectedSymptoms.contains(symptom);
                      return GestureDetector(
                        onTap: () => toggleSymptom(symptom),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFF176C90) : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isSelected ? const Color(0xFF176C90) : Colors.grey,
                            ),
                          ),
                          child: Text(
                            symptom,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Additional Symptoms",
                    style: TextStyle(
                      color: Color(0xFF176C90),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ...List.generate(
                    3,
                        (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF176C90),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => widget.onNext(selectedSymptoms),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Symptoms2 extends StatefulWidget {
  final Function(List<String>) onNext;

  const Symptoms2({super.key, required this.onNext});

  @override
  State<Symptoms2> createState() => _Symptoms2State();
}

class _Symptoms2State extends State<Symptoms2> {

  List<String> environmentFactors = [
    "I recently drank water from an unclean source.",
    "There is a cholera outbreak in my area.",
    "I have limited access to clean toilets and proper sanitation.",
    "I often eat food from street vendors or unregulated sources.",
    "Flies or insects are common around my food/water source.",
    "Flooding or poor drainage is common where I live."
  ];

  List<String> selectedFactors = [];

  void toggleSelection(String factor) {
    setState(() {
      if (selectedFactors.contains(factor)) {
        selectedFactors.remove(factor);
      } else {
        selectedFactors.add(factor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cholera.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            const Text(
              'Cholera Detector',
              style: TextStyle(
                color: Color(0xFF176C90),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

      ),
      body: Column(
        children: [
          const Divider(color: Colors.grey, thickness: 2,),
          SizedBox(height: 10),// Horizontal line after AppBar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Symptoms",
                    style: TextStyle(
                      color: Color(0xFF176C90),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
            
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "What is your current environment like?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: environmentFactors.length,
                      itemBuilder: (context, index) {
                        String factor = environmentFactors[index];
                        bool isSelected = selectedFactors.contains(factor);
            
                        return GestureDetector(
                          onTap: () => toggleSelection(factor),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                isSelected ? const Color(0xFF176C90) : Colors.grey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isSelected,
                                  onChanged: (value) => toggleSelection(factor),
                                  activeColor: const Color(0xFF176C90),
                                ),
                                Expanded(
                                  child: Text(
                                    factor,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF176C90),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => widget.onNext(selectedFactors),
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class Symptoms3 extends StatefulWidget {
  final Function(List<String>) onNext;

  const Symptoms3({super.key, required this.onNext});

  @override
  State<Symptoms3> createState() => _Symptoms3State();
}

class _Symptoms3State extends State<Symptoms3> {

  List<String> pastHealthExperience = [
    "I have had cholera before",
    "I have been hospitalized for severe diarrhea or dehydration.",
    "I have a history of weak immunity or frequent infections.",
    "A close family member has had cholera in the past.",
    "I have taken cholera medication or vaccines before.",
    "I have experienced recurring digestive issues."
  ];

  List<String> selectedFactors = [];

  void toggleSelection(String factor) {
    setState(() {
      if (selectedFactors.contains(factor)) {
        selectedFactors.remove(factor);
      } else {
        selectedFactors.add(factor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/cholera.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 5),
            const Text(
              'Cholera Detector',
              style: TextStyle(
                color: Color(0xFF176C90),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

      ),
      body: Column(
        children: [
          const Divider(color: Colors.grey, thickness: 2,),
          SizedBox(height: 10),// Horizontal line after AppBar
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Symptoms",
                    style: TextStyle(
                      color: Color(0xFF176C90),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
            
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Have you had any past health experiences related to cholera?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: pastHealthExperience.length,
                      itemBuilder: (context, index) {
                        String factor = pastHealthExperience[index];
                        bool isSelected = selectedFactors.contains(factor);
            
                        return GestureDetector(
                          onTap: () => toggleSelection(factor),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color:
                                isSelected ? const Color(0xFF176C90) : Colors.grey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isSelected,
                                  onChanged: (value) => toggleSelection(factor),
                                  activeColor: const Color(0xFF176C90),
                                ),
                                Expanded(
                                  child: Text(
                                    factor,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF176C90),
                          padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Example risk classification logic
                          if (selectedFactors.contains("I have been hospitalized for severe diarrhea or dehydration..") ||
                              selectedFactors.contains("I have limited access to clean toilets and proper sanitation.") || selectedFactors.contains("I have a history of weak immunity or frequent infections.") || selectedFactors.contains("Flies or insects are common around my food/water source.")) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Result1()), // High Risk
                            );
                          } else if (selectedFactors.contains("I often eat food from street vendors or unregulated sources.") ||
                              selectedFactors.contains("Flooding or poor drainage is common where I live.") || selectedFactors.contains("I have experienced recurring digestive issues.")) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Result2()), // Medium Risk
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Result3()), // Low Risk
                            );
                          }
                        },

                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}






// Results
//
// class Result1 extends StatefulWidget {
//
//
//   const Result1({super.key});
//
//   @override
//   _Result1State createState() => _Result1State();
// }
//
// class _Result1State extends State<Result1> {
//
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;
//     double screenHeight = screenSize.height;
//     double screenWidth = screenSize.width;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   // crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(
//                       'assets/high.png',
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Your Cholera Risk: High Risk',
//                   style: TextStyle(
//                     color: Color(0xFF1E1E1E),
//                     fontSize: 24,
//                     fontFamily: "Inter",
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Text(
//                   textAlign: TextAlign.justify,
//                   'Your responses indicate a high risk of cholera infection. Severe symptoms like frequent watery diarrhea, dehydration, and vomiting require urgent medical attention. Please visit a healthcare facility immediately. In the meantime, drink oral re-hydration solution (ORS) and avoid contaminated food or water. Cholera can worsen quickly, so act fast to protect your health.',
//                   style: TextStyle(
//                     color: Color(0xFF1E1E1E),
//                     fontSize: 18,
//                     fontFamily: "Inter",
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }