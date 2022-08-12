package uz.mamarasulov.flutter_taxi

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory;
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("1bd8cd52-47e2-452b-bfb7-1658dd6a967f") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }}