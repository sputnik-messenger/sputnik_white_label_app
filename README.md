# Sputnik - White Label

Sputnik Messenger >white label< - GPLv3 or later 

## Disclaimer
Sputnik Messenger and all related libraries are in a very early and highly unstable state. 
The code base is in active development and will change without warning.


## Getting Started


```dart
void main() {
  runApp(SputnikWhiteLabelApp(
    globalConfigData: MyAppConfig(),
  ));
}

class MyAppConfig implements GlobalConfigData {
  @override
  SputnikThemeData get sputnikThemeData => DefaultWhiteLabelThemeData();

  @override
  WidgetBuilder get loginScreenBackground =>
      (BuildContext context) => Container();

  @override
  String get title => 'WhitelabelSputnikMessenger';

  @override
  String get userAgent => 'WhitelabelSputnikMessenger/dev';

  @override
  WidgetBuilder get loginScreenArtwork => (BuildContext context) =>
      AspectRatio(aspectRatio: 1, child: Placeholder());

  @override
  String get defaultDeviceName => 'Phone #1';

  @override
  String get packageName => 'com.example.whitelabel';

  @override
  String get mediaFileDirectoryName => 'whitelabel_app';

  @override
  get timelineBackground => (BuildContext context) => Container();
  
  @override
  WidgetBuilder getLoadingImageIndicator({String path}) => (_) => CircularProgressIndicator();
  
  @override
  List<StickerPack> get stickerPacks => [];

}

class MyAppThemeData implements SputnikThemeData {
  final ThemeData materialThemeData;
  final Color myMessageBubbleColor;
  final Color successColor;
  final Color warnColor;
  final Color errorColor;

  DefaultWhiteLabelThemeData._({
    this.myMessageBubbleColor,
    this.materialThemeData,
    this.successColor,
    this.warnColor,
    this.errorColor,
  });

  factory DefaultWhiteLabelThemeData() {
    return DefaultWhiteLabelThemeData._(
      materialThemeData: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[300]
      ),
      myMessageBubbleColor: Colors.blue,
      successColor: Colors.green,
      warnColor: Colors.orange,
      errorColor: Colors.red,
    );
  }
}

```

## Flutter

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
