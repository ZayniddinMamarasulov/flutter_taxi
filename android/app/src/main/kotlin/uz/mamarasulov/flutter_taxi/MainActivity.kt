package uz.mamarasulov.flutter_taxi
import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory;
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("29ac8220-5919-483c-acb4-8facd3d19268") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }

}
