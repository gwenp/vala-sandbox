/* shelf.vapi generated by valac 0.20.1.4-f5a54, do not modify. */

namespace Shelf {
	namespace Drawing {
		[CCode (cheader_filename = "shelf.h")]
		public class DockRenderer : GLib.Object {
			public DockRenderer (Shelf.DockController controller);
			public bool draw (Cairo.Context cr);
			public Shelf.DockController controller { private get; construct; }
		}
		[CCode (cheader_filename = "shelf.h")]
		public class DockSurface : GLib.Object {
			public DockSurface (int width, int height);
			public Shelf.Drawing.Color average_color ();
			public void clear ();
			public Shelf.Drawing.DockSurface copy ();
			public Shelf.Drawing.DockSurface create_mask (double threshold, out Gdk.Rectangle extent);
			public void exponential_blur (int radius);
			public void fast_blur (int radius, int process_count = 1);
			public void gaussian_blur (int radius);
			public Gdk.Pixbuf to_pixbuf ();
			public DockSurface.with_dock_surface (int width, int height, Shelf.Drawing.DockSurface model);
			public DockSurface.with_internal (Cairo.ImageSurface image);
			public DockSurface.with_surface (int width, int height, Cairo.Surface model);
			public Cairo.Context Context { get; construct; }
			public int Height { get; construct; }
			public Cairo.Surface Internal { get; construct; }
			public int Width { get; construct; }
		}
		[CCode (cheader_filename = "shelf.h")]
		public class DrawingService : GLib.Object {
			public DrawingService ();
			public static Shelf.Drawing.Color average_color (Gdk.Pixbuf source);
		}
		[CCode (cheader_filename = "shelf.h")]
		public class TabRenderer : GLib.Object {
			public TabRenderer (Shelf.Items.Tab the_tab);
			public void draw (Cairo.Context cr, int position);
			public Shelf.Items.Tab tab { private get; construct; }
		}
		[CCode (cheader_filename = "shelf.h")]
		public struct Color {
			public double R;
			public double G;
			public double B;
			public double A;
			public void add_hue (double val);
			public void brighten_val (double amount);
			public void darken_by_sat (double amount);
			public void darken_val (double amount);
			public bool equal (Shelf.Drawing.Color color);
			public static Shelf.Drawing.Color from_gdk_color (Gdk.Color color);
			public static Shelf.Drawing.Color from_gdk_rgba (Gdk.RGBA color);
			public static Shelf.Drawing.Color from_string (string s);
			public void get_hsv (out double h, out double s, out double v);
			public double get_hue ();
			public double get_sat ();
			public double get_val ();
			public void multiply_sat (double amount);
			public void set_alpha (double alpha);
			public void set_hsv (double h, double s, double v);
			public void set_hue (double hue);
			public void set_max_sat (double sat);
			public void set_max_val (double val);
			public void set_min_sat (double sat);
			public void set_min_value (double val);
			public void set_sat (double sat);
			public void set_val (double val);
			public Gdk.Color to_gdk_color ();
			public Gdk.RGBA to_gdk_rgba ();
			public string to_string ();
		}
	}
	namespace Factories {
		[CCode (cheader_filename = "shelf.h")]
		public abstract class AbstractMain : GLib.Object {
			protected static bool DEBUG;
			protected static bool VERBOSE;
			protected Gtk.Application application;
			protected string exec_name;
			protected string program_name;
			protected const GLib.OptionEntry[] options;
			public AbstractMain ();
			protected virtual void create_controller ();
			protected virtual bool initialize_libraries (ref unowned string[] args);
			protected virtual void initialize_program ();
			protected virtual bool parse_commandline (ref unowned string[] args);
			public virtual int run (ref unowned string[] args);
			protected virtual void set_options ();
			protected signal void initialized ();
		}
		[CCode (cheader_filename = "shelf.h")]
		public class Factory : GLib.Object {
			public static Shelf.Factories.ItemFactory item_factory;
			public static Shelf.Factories.AbstractMain main;
			public Factory ();
			public static void init (Shelf.Factories.AbstractMain main_class, Shelf.Factories.ItemFactory item);
		}
		[CCode (cheader_filename = "shelf.h")]
		public class ItemFactory : GLib.Object {
			public ItemFactory ();
		}
	}
	namespace Items {
		[CCode (cheader_filename = "shelf.h")]
		public class Tab : GLib.Object {
			public bool hovered;
			public Shelf.Drawing.TabRenderer tab_renderer;
			public Tab (Shelf.Items.TabManager manager, string tab_icon_path);
			public void draw (Cairo.Context cr, int position);
			public bool is_mouse_inside_tab (Gdk.EventMotion event);
			public string icon_path { get; construct; }
			public Shelf.Items.TabManager tab_manager { get; construct; }
		}
		[CCode (cheader_filename = "shelf.h")]
		public class TabManager : GLib.Object {
			public int tab_icon_size;
			public int tab_margin;
			public TabManager (Shelf.DockController controller);
			public void add_tab (Shelf.Items.Tab t);
			public void check_tab_mouse_collision (Gdk.EventMotion event);
			public void draw (Cairo.Context cr);
			public int get_tab_position (Shelf.Items.Tab t);
			public void populate ();
			public Shelf.DockController controller { private get; construct; }
		}
	}
	namespace System {
		[CCode (cheader_filename = "shelf.h")]
		public class DockPositionManager : GLib.Object {
			public DockPositionManager (Shelf.DockController controller);
			public void initialize ();
			public Shelf.DockController controller { private get; construct; }
			public int win_height { get; protected set; }
			public int win_width { get; protected set; }
			public int win_x { get; protected set; }
			public int win_y { get; protected set; }
		}
		[CCode (cheader_filename = "shelf.h")]
		public class Logger : GLib.Object {
			public static void initialize (string app_name);
			public static void notification (string msg, string icon = "");
			public static void verbose (string msg, ...);
			public static Shelf.System.LogLevel DisplayLevel { get; set; }
		}
		[CCode (cheader_filename = "shelf.h")]
		public enum LogLevel {
			VERBOSE,
			DEBUG,
			INFO,
			NOTIFY,
			WARN,
			ERROR,
			FATAL
		}
	}
	namespace Widgets {
		[CCode (cheader_filename = "shelf.h")]
		public class CompositedWindow : Gtk.Window {
			public CompositedWindow ();
			public override bool draw (Cairo.Context cr);
			public CompositedWindow.with_type (Gtk.WindowType window_type);
		}
		[CCode (cheader_filename = "shelf.h")]
		public class DockWindow : Shelf.Widgets.CompositedWindow {
			public DockWindow (Shelf.DockController controller);
			public override bool button_press_event (Gdk.EventButton event);
			public override bool button_release_event (Gdk.EventButton event);
			public override bool draw (Cairo.Context cr);
			public override bool enter_notify_event (Gdk.EventCrossing event);
			public override bool leave_notify_event (Gdk.EventCrossing event);
			public override bool map_event (Gdk.EventAny event);
			public override bool motion_notify_event (Gdk.EventMotion event);
			public override bool scroll_event (Gdk.EventScroll event);
			public void update_size_and_position ();
			public Shelf.DockController controller { private get; construct; }
		}
		[CCode (cheader_filename = "shelf.h")]
		public enum Struts {
			LEFT,
			RIGHT,
			TOP,
			BOTTOM,
			LEFT_START,
			LEFT_END,
			RIGHT_START,
			RIGHT_END,
			TOP_START,
			TOP_END,
			BOTTOM_START,
			BOTTOM_END,
			N_VALUES
		}
	}
	[CCode (cheader_filename = "shelf.h")]
	public class DockController : GLib.Object {
		public Shelf.System.DockPositionManager position_manager;
		public Shelf.Drawing.DockRenderer renderer;
		public Shelf.Items.TabManager tab_manager;
		public Shelf.Widgets.DockWindow window;
		public DockController ();
	}
}
