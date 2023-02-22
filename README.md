## Features

Multi-language support for Flutter
- arabic
- english

## Getting started

add file `/lang/en.json` and `/lang/ar.json` and add this to your file

```json
{
  "sample": "sample"
}
```
```json
{
  "sample": "عينة"
}
```
first you need to add this package to your pubspec.yaml file

```yaml
dependencies:
  ilmam_localization: github:ilmam/ilmam_localization
```
and add `/lang` to your assets

```yaml
flutter:
  assets:
    - lang/
```

then you need to add this to your **main.dart** file

```dart
import 'package:ilmam_localization/ilmam_localization.dart';
```

then you need to provide bloc to your app

```dart
BlocProvider<LocaleCubit>(
  create: (context) => LocaleCubit(),
),
```

then you need to add this to your **builder** widget

```dart
 builder: (context, state) {
  return ilmamMaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
    title:"app name",
    theme: AppTheme.themeData
  );
 }
```





## Usage

### **Transelate text**


```dart
const like = 'sample'.tr(context);
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Authors and acknowledgment

ilmam information technology



## License
[MIT](https://choosealicense.com/licenses/mit/)


