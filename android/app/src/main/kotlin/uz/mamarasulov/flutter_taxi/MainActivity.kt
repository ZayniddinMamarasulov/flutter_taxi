package uz.mamarasulov.flutter_taxi

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory;
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    override  fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        MapKitFactory.setLocale("YOUR_LOCALE") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("b27d7393-3a55-4a0d-95c1-539b37ddabdf") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
