{
  config,
  lib,
  pkgs,
  ...
}: let
  mod = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;
      keybindings = lib.mkOptionDefault {
        # change focus
        "${mod}+h" = "focus left";
        "${mod}+t" = "focus down";
        "${mod}+n" = "focus up";
        "${mod}+s" = "focus right";
        # start a terminal
        "${mod}+Shift+Return" = "exec alacritty";

        # kill focused window
        "${mod}+Shift+apostrophe" = "kill";
        # alternatively, you can use the cursor keys:
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # move focused window
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+t" = "move down";
        "${mod}+Shift+n" = "move up";
        "${mod}+Shift+s" = "move right";

        # move to screens
        "${mod}+Shift+Left" = "move workspace to output left";
        "${mod}+Shift+Down" = "move workspace to output down";
        "${mod}+Shift+Up" = "move workspace to output up";
        "${mod}+Shift+Right" = "move workspace to output right";

        # split in horizontal orientation
        "${mod}+d" = "split h";
        "${mod}+r" = ''exec "rofi -modi drun,run -show drun"'';

        # split in vertical orientation
        "${mod}+k" = "split v";

        # enter fullscreen mode for the focused container
        "${mod}+u" = "fullscreen toggle";

        # change container layout (stacked, tabbed, toggle split)
        "${mod}+o" = "layout stacking";
        "${mod}+comma" = "layout tabbed";
        "${mod}+period" = "layout toggle split";

        # toggle tiling / floating
        "${mod}+Shift+space" = "floating toggle";

        # change focus between tiling / floating windows
        "${mod}+space" = "focus mode_toggle";

        # focus the parent container
        "${mod}+a" = "focus parent";

        # switch to workspace
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        # move focused container to workspace
        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";

        # reload the configuration file
        "${mod}+Shift+j" = "reload";
        # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        "${mod}+Shift+p" = "restart";
        # exit i3 (logs you out of your X session)
        "${mod}+Shift+period" = ''
          exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"
        '';
        # "${mod}+p" = "mode " resize "";
      };

      bars = [
        {
          mode = "hide";
          hiddenState = "hide";
          # modifier = "$mod";
          statusCommand = "i3status";
        }
      ];
    };
    extraConfig = ''

      # Font for window titles. Will also be used by the bar unless a different font
      # is used in the bar {} block below.
      font Jetbrains Mono 20

      # This font is widely installed, provides lots of unicode glyphs, right-to-left
      # text rendering and scalability on retina/hidpi displays (thanks to pango).
      #font pango:DejaVu Sans Mono 8

      # The combination of xss-lock, nm-applet and pactl is a popular choice, so
      # they are included here as an example. Modify as you see fit.

      # xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
      # screen before suspend. Use loginctl lock-session to lock your screen.
      exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

      # NetworkManager is the most popular way to manage wireless networks on Linux,
      # and nm-applet is a desktop environment-independent system tray GUI for it.
      exec --no-startup-id nm-applet

      # Use pactl to adjust volume in PulseAudio.
      set $refresh_i3status killall -SIGUSR1 i3status
      bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
      bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
      bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
      bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

      bindsym Print exec --no-startup-id flameshot gui


      # Use Mouse+$mod to drag floating windows to their wanted position
      # floating_modifier $mod


      # A more modern dmenu replacement is rofi:



      # focus the child container
      #bindsym $mod+d focus child



      # resize window (you can also use the mouse for that)
      # mode "resize" {
      #         # These bindings trigger as soon as you enter the resize mode
      #
      #         # Pressing left will shrink the window’s width.
      #         # Pressing right will grow the window’s width.
      #         # Pressing up will shrink the window’s height.
      #         # Pressing down will grow the window’s height.
      #         bindsym h resize shrink width 10 px or 10 ppt
      #         bindsym t resize grow height 10 px or 10 ppt
      #         bindsym n resize shrink height 10 px or 10 ppt
      #         bindsym s resize grow width 10 px or 10 ppt
      #
      #         # same bindings, but for the arrow keys
      #         bindsym Left resize shrink width 10 px or 10 ppt
      #         bindsym Down resize grow height 10 px or 10 ppt
      #         bindsym Up resize shrink height 10 px or 10 ppt
      #         bindsym Right resize grow width 10 px or 10 ppt
      #
      #         # back to normal: Enter or Escape or $mod+r
      #         bindsym Return mode "default"
      #         bindsym Escape mode "default"
      #         # bindsym $mod+p mode "default"
      # }


      # Start i3bar to display a workspace bar (plus the system information i3status
      # finds out, if available)
    '';
  };
}
