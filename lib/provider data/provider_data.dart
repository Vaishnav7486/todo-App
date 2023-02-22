import 'package:flutter/cupertino.dart';

class ProviderData with ChangeNotifier {
  // checkedstatus status_chk = checkedstatus();

  bool checked_status = false;

  List<Map> listitems = [
    {
      "id": 1,
      "title": "this is title 1",
      "text_content": "Some text content for the first list",
      "checked_sts": true
    },
    {
      "id": 2,
      "title": "this is title 2",
      "text_content":
          "siree this si the list and I want to make this as long as it can be so that i can know that what happens to this long text within this container, and I am reminding it here one more time that i want to make this as long as possible, it could be even like a 1020 line of text, that would be much helpful",
      "checked_sts": false
    },
    {
      "id": 3,
      "title": "this is title 3",
      "text_content": "Some text content for the first list",
      "checked_sts": true
    },
    {
      "id": 4,
      "title": "this is title 4",
      "text_content": "Some text content for the first list",
      "checked_sts": false
    },
    {
      "id": 5,
      "title": "this is title 5",
      "text_content":
          "The Supreme Court on February 10, 2023 asked the Securities Exchange Board of India (SEBI) and the government to produce the existing regulatory framework in place to protect Indian investors, who are mostly middle class and reported to have lost several lakhs of crores in the past two weeks after US-based short seller firm Hindenburg Research published a report which led to sudden market volatility following a meltdown in the Adani Group shares.",
      "checked_sts": false
    },
    {
      "id": 6,
      "title": "this is title 6",
      "text_content":
          "India’s industrial output growth moderated to 4.3% in December 2022 from 7.3% in November, despite mining and electricity production rising at around 10% for the second successive month as manufacturing growth faltered from 6.1% in November to just 2.6%. While base effects perked up electricity and mining, which had grown at 2.8% and 2.6% respectively, a year earlier, manufacturing didn’t see such a push despite a mere 0.6% rise in December 2021.",
      "checked_sts": true
    },
    {
      "id": 7,
      "title": "this is title 7",
      "text_content":
          "The Supreme Court on February 10 dismissed a petition filed by the Hindu Sena president to ban the British Broadcasting Corporation (BBC) in India and order an investigation into the broadcaster and its employees’ “anti-India and anti-Indian government” reportage and films. A Bench of Justices Sanjiv Khanna and M.M. Sundresh said the petition filed by Vishnu Gupta was 'absolutely misconceived'",
      "checked_sts": false
    },
    {
      "id": 8,
      "title": "this is title 8",
      "text_content":
          "Governor Thaawar Chand Gehlot delivered his address to the joint session of the Karnataka legislature in Hindi, drawing the ire of the opposition, on February 10. “It is a sensitive issue and goes against the position taken by the State with respect to the language. The State government should be blamed for this, and it owes an explanation to the people of Karnataka,” said senior Congress leader H. K. Patil.",
      "checked_sts": false
    }
  ];

  additem() {
    listitems.add({
      "id": 12,
      "title": "some title",
      "text_content": "some contents",
      "checked_sts": false
    });
  }

  checkIcontapped(int itemid) {
    print(itemid);
    for (int i = 0; i < listitems.length; i++) {
      if (listitems[i]["id"] == itemid) {
        // listitems[i]["checked_sts"] = true;
        // notifyListeners();
        if (listitems[i]["checked_sts"] == true) {
          listitems[i]["checked_sts"] = false;
          notifyListeners();
        } else if (listitems[i]["checked_sts"] == false) {
          listitems[i]["checked_sts"] = true;
          notifyListeners();
        } else {
          print("here happened something");
        }
      } else {
        print("things was happeded outside");
      }
    }
  }
}

// class checkedstatus {
//   String checked = "checked";
//   String unchecked = "unchecked";
// }
