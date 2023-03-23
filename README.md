# test_project

This is an application with single page for entering and verifying a phone number. The app was initially designed in the VSCode and tested using Chrome and smartphone simulator.

Chrome Example:

https://user-images.githubusercontent.com/126317425/227211780-64cf6b8f-0a25-4c61-97f2-bbfed5b4fec2.MOV

Initially the app was designed with Chrome for Web, because 

Smartphone Example:


As it was optimal for countries' data and methods I imported the country-code-picker package, which allows the user not only to get smaller code with all the needed functionality, but also lets to customize its widgets to some extent. With it comes a country code selection cutton, customized with a custom container, and a sheet with a list of countries. The search bar was customized a little, it can search by first letters and abbreviations ('uk', 'us') and by country code (+44, +380). Also for the sake of comfortable search there was implemented a localization that responds to English.

A text field has been improved with a hint-text and is using a mask (mask-input-text-formatter) to let only numbers and mobilephone form (brackets, hyphens, number of digits). A numeric keypad is to show automatically for some systems (IOS or Android), but according to my little investigation is never shown yet while using Chrome, so it can be seen only on the Smartphone Example.

A button was formed to be disabled until all the 10 digits ofthe phone number are typed in. With that helps a text controller, which supervises a textfield's state of fillness. Once it meets thecondition of 15 symbols in the length of text in the textfield (which responds to the number of symbols (brackets, hyphens, digits) in the mask of the phone number) the access button becomes available for use. When ckicking it, you will see a little message: "Well done! You've entered". Also there is a message printed in console: "Well done".
