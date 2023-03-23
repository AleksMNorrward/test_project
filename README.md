# test_project

This is an application with a single page for entering and verifying a phone number. The app was initially developed in the VSCode and tested using Chrome and smartphone simulator. Unfortunately, on my computer I can only test my app through the Chrome page, where keypad cannot be applied, so the smartphone test was available to me only thanks to a friend's computer.

Chrome Video Example:


https://user-images.githubusercontent.com/126317425/227269782-9a1725de-7b9f-4d3c-a0bb-6d36d6f8e08a.MOV



Smartphone Image Example:
![0E8EEB7B-4C66-4841-9C95-5AB7A8D2E0ED](https://user-images.githubusercontent.com/126317425/227269705-2961be8f-ddf3-42a3-b592-fc4aa999d025.jpeg)


As it was optimal for aquiring countries' data and methods, I imported the country-code-picker package, which allows the user not only to get smaller code with all the needed functionality, but also lets developers customize its widgets to some extent. With it comes a country code selection button, wrapped in a custom container, and a sheet with a list of countries. The search bar was customized a little, it can search through the list by first letters and abbreviations ('uk', 'us', ect.) and by country code (+44, +380, ect). Also for the sake of comfortable search there was implemented a localization that responds to English.

A text field has been improved with a hint-text and is using a mask (mask-input-text-formatter package) to let only numbers and mobilephone form (brackets, hyphens, number of digits). A numeric keypad is to show automatically for some systems (IOS or Android), but according to my little investigation is never shown yet while using Chrome, so it can be seen only on the Smartphone Example.

A button was formed to be disabled until all the 10 digits of the phone number are typed in. With that helps a text controller, which supervises a textfield's state of fillness. Once it meets the condition of 15 symbols in the length of text in the textfield (which responds to the number of symbols (brackets, hyphens, digits) in the mask of the phone number) the access button becomes available for use. When clicking it, you will see a little message: "Well done! You've entered". Also there is a message printed in console: "Well done".
