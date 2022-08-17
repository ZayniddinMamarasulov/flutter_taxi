package uz.mamarasulov.flutter_taxi

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory;
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("f4ab154b-6a14-4ff1-898e-ee0a76c86eda") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
