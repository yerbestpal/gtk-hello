public class MyApp : Gtk.Application
{
    // Constructor
    public MyApp() {
        Object (
            application_id: "com.github.ross-mclean.gtk-hello",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }
    
    protected override void activate() {
    
        var button_margin = 12;
        var size = 300;
    
        var button_hello = new Gtk.Button.with_label("I am a button!") {
            margin = button_margin
        };
        
        button_hello.clicked.connect(() => {
            var label_text = "Hello World!";
            var button_label = button_hello.label != label_text ? label_text : "Goodbye World!";
            button_hello.label = button_label;
            // button_hello.sensitive = false;
        });

        var main_window = new Gtk.ApplicationWindow(this) {
            default_height = size,
            default_width = size,
            title = "Hello World"
        };
        
        main_window.add(button_hello);
        main_window.show_all();
    }
    
    // Launch instance of MyApp
    public static int main(string[] args) {
        return new MyApp().run(args);
    }
}
