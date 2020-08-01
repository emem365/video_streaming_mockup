# Video Streaming Mockup

This application is a mockup to show how we can use Youtube API, in Flutter apps, to fetch top videos in your region, and to make them streamable inside the app itself.

## Getting Started

This is simple flutter project. If you want to mess around with the code, clone the repo: https://github.com/emem365/video_streaming_mockup.git

Apart from the clone of the app, to get the app running, you need to get YouTube API Key.

### Prerequisites

All you need to get this project running is flutter set-up in your system, and a YouTube API Key ([Instructions Here](https://developers.google.com/youtube/v3/getting-started)). To get started with flutter visit [here](https://flutter.dev/docs/get-started/install)

### Installing

Clone the project. Make sure you have an emulator running or a device connected to your pc

First You need to make sure you place the API Key correctly. 
After cloning the repo, create a file called `keys.dart`, under `lib/util`. Your files path would look like `lib/util/keys.dart`.
Inside this keys.dart file, paste the following code:
```
const String API_KEY = "YOUR_API_KEY";
```
where you replace YOUR_API_KEY, with the key that you got from Google. 

Run using: 
```
flutter run
```

## Built With

* [Flutter](https://flutter.dev/) - Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.
* [YouTube API](https://developers.google.com/youtube/v3/getting-started) - API in use


## Authors

* **Madhur Maurya** - *Creator* - [emem365](https://github.com/emem365)


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

