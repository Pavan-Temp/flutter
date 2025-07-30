# How to Add the Bird Image

1. Save the yellow bird image you provided as "bird.jpg" or "bird.png" in this directory
2. The image should be placed at: assets/images/bird.jpg (or .png)
3. The image is already configured in pubspec.yaml to be included in the app
4. You can reference it in your Flutter code using: 'assets/images/bird.jpg'

## Usage in Flutter Code

To use the image in your Flutter app:

```dart
Image.asset('assets/images/bird.jpg')
```

Or with specific dimensions:

```dart
Image.asset(
  'assets/images/bird.jpg',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
)
```
