package uz.mamarasulov.flutter_taxi

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory;
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("6e21cd46-0250-4f5c-9a0d-61dc80e61577") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
