I sent about 8 hours for this whole app. I think this app should not take that much time but I faced some problems. At first, I decided to use Google Cloud Translating API(https://console.cloud.google.com/marketplace/product/google/translate.googleapis.com?pli=1&project=tidy-apricot-332817). Unfortuantely, it is not free and it needs to connect with billing account. I don't have one,so i had to find other alternative.It did took a lot of time but thankfully I found this one.

To detect languages, I used translator package which is a free google translate API. (https://pub.dev/packages/translator)

I also added some extra features.

You can view the history of the texts you typed.
I used firestore database to store the input texts and to get the data back.
(https://firebase.google.com/)

You can also change the language of the app.(English-Burmese).
I added this feature because I do think it is a must for a local app to be accessible by any local people no matter they understand English or not.
I used intl package for the localization.(https://pub.dev/packages/intl)

How detecting works:
The app can detect a lot of languages. If you input emojis or special characters only, it will return as invalid input.You can input those characters alongside with actual letters of any language.The app will neglect those invalid characters and return other letters' languages.

The good thing is you can run the app on any platforms(android, ios, web).
​
To run this, u need to install flutter in your pc.You can follow this doc to install.(https://docs.flutter.dev/get-started/install?gclid=CjwKCAjwjZmTBhB4EiwAynRmD0in2PRQY6WbsnWYEO6oPOgfXT-uPHGWD6ykzsJplX6PyWULLhZgrhoCRt8QAvD_BwE&gclsrc=aw.ds)

if you haven't installed, you can see the demo here;

In the videos, I tested with three languages(English,Burmese and Chinese).However, you can test with any other language if you wish to.

IOS: https://drive.google.com/file/d/1Ztjcx8oVGgSUVjBB9dYAs78DgGC3odoJ/view?usp=sharing

Android: https://drive.google.com/file/d/1-4B0CY4GXk-rge3P6lCg0u_vsBmxegt9/view?usp=sharing

Web:https://drive.google.com/file/d/1JChKPHJoxWsn20ivELUc1AB1z_xtDfBC/view?usp=sharing
(my macbook has only english and burmese keyboards.So, I didn't got a chace to test with other languages on Web but I'm sure it works just like other platforms.)

Note : I found a problem, it is not bug but it occurs due to my algorithm used to detect language. I detect each letters in the text to get the languages. it is found that some English letters exist in several languages. So, sometimes it return all of the detected languages.You can say my app is very precise or it is just a bug. It is up to you. :D
# Language_Detecter
