/*
 * Coder par Ogromny
 * pour Skyzohkey
 * pour Ricin
 */

using Gtk;

public class Main {

  class AppStatusIcon: Window {

    private StatusIcon trayicon;
    private Gtk.Menu menuSystem;

    public AppStatusIcon() {
      // Create tray icon
      trayicon = new StatusIcon.from_file("icon.png");
      trayicon.set_tooltip_text("Ricin Client");
      trayicon.set_visible(true);

      create_menuSystem();

      // popup_menu connect
      trayicon.popup_menu.connect(menuSystem_popup);
    }

    public void create_menuSystem() {
      // Create menu
      menuSystem = new Gtk.Menu();

      // ONLINE
      var menuOnline = new ImageMenuItem.with_label("Online");
      var menuOnlineImage = new Image.from_icon_name("user-available-symbolic", Gtk.IconSize.MENU);
      menuOnline.always_show_image = true;
      menuOnline.set_image(menuOnlineImage);

      // BUSY
      var menuBusy = new ImageMenuItem.with_label("Busy");
      var menuBusyImage = new Image.from_icon_name("user-busy-symbolic", Gtk.IconSize.MENU);
      menuBusy.always_show_image = true;
      menuBusy.set_image(menuBusyImage);

      // AWAY
      var menuAway = new ImageMenuItem.with_label("Away");
      var menuAwayImage = new Image.from_icon_name("user-away-symbolic", Gtk.IconSize.MENU);
      menuAway.always_show_image = true;
      menuAway.set_image(menuAwayImage);

      // QUIT
      var menuQuit = new ImageMenuItem.with_label("Quit");
      var menuQuitImage = new Image.from_icon_name("window-close-symbolic", Gtk.IconSize.MENU);
      menuQuit.always_show_image = true;
      menuQuit.set_image(menuQuitImage);
      menuQuit.activate.connect(Gtk.main_quit);

      // append
      menuSystem.append(menuOnline);
      menuSystem.append(menuBusy);
      menuSystem.append(menuAway);
      menuSystem.append(menuQuit);

      // show_all
      menuSystem.show_all();
    }

    public void menuSystem_popup(uint button, uint time) {
      menuSystem.popup(null, null, null, button, time);
    }

  }

  public static int main(string [] argv) {
    Gtk.init(ref argv);
    var App = new AppStatusIcon();
    App.hide();
    Gtk.main();

    return 0;
  }
}
