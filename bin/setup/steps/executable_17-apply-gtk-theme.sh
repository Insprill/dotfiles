#!/bin/bash

echo "Setting GTK theme"
CLONE_DIR="colloid-gtk"

if ! git clone https://github.com/vinceliuice/Colloid-gtk-theme $CLONE_DIR; then
    echo "Error: Failed to clone GTK theme!"
    exit 1
fi

# Colloid light and dark settings are fucking backwards.
# All the dark colors are defined in the light variables and vice versa.
# This fixes that and uses proper Catppuccin Mocha/Latte colors according to the style guide.
read -r -d '' PATCH << 'EOF'
diff --git a/assets.sh b/assets.sh
index 808e47a0..1ebbbcbc 100644
--- a/assets.sh
+++ b/assets.sh
@@ -218,40 +218,40 @@ make_assets() {
   if [[ "$scheme" == '-Catppuccin' ]]; then
     case "$theme" in
       '')
-        theme_color_dark='#1e66f5'
-        theme_color_light='#8caaee'
+        theme_color_dark='#89b4fa'
+        theme_color_light='#1e66f5'
         ;;
       -Purple)
-        theme_color_dark='#8839ef'
-        theme_color_light='#ca9ee6'
+        theme_color_dark='#cba6f7'
+        theme_color_light='#8839ef'
         ;;
       -Pink)
-        theme_color_dark='#ea76cb'
-        theme_color_light='#f4b8e4'
+        theme_color_dark='#f5c2e7'
+        theme_color_light='#ea76cb'
         ;;
       -Red)
-        theme_color_dark='#e64553'
-        theme_color_light='#ea999c'
+        theme_color_dark='#f38ba8'
+        theme_color_light='#d20f39'
         ;;
       -Orange)
-        theme_color_dark='#fe640b'
-        theme_color_light='#fe8019'
+        theme_color_dark='#fab387'
+        theme_color_light='#fe640b'
         ;;
       -Yellow)
-        theme_color_dark='#df8e1d'
-        theme_color_light='#ef9f76'
+        theme_color_dark='#f9e2af'
+        theme_color_light='#df8e1d'
         ;;
       -Green)
-        theme_color_dark='#40a02b'
-        theme_color_light='#a6d189'
+        theme_color_dark='#a6e3a1'
+        theme_color_light='#40a02b'
         ;;
       -Teal)
-        theme_color_dark='#179299'
-        theme_color_light='#81c8be'
+        theme_color_dark='#94e2d5'
+        theme_color_light='#179299'
         ;;
       -Grey)
-        theme_color_dark='#5c5f77'
-        theme_color_light='#ccd0da'
+        theme_color_dark='#bac2de'
+        theme_color_light='#5c5f77'
         ;;
     esac
   fi
@@ -294,11 +294,11 @@ make_assets() {
         titlebar_dark='#020203'
         ;;
       -Catppuccin)
-        background_light='#eff1f5'
+        background_light='#e6e9ef'
         background_dark='#181825'
-        background_darker='#1e1e2e'
-        titlebar_light='#e6e9ef'
-        titlebar_dark='#11111b'
+        background_dark_alt='#11111b'
+        titlebar_light='#eff1f5'
+        titlebar_dark='#1e1e2e'
         ;;
     esac
   else
@@ -340,10 +340,10 @@ make_assets() {
         ;;
       -Catppuccin)
         background_light='#eff1f5'
-        background_dark='#292c3c'
-        background_darker='#303446'
-        titlebar_light='#e6e9ef'
-        titlebar_dark='#24273a'
+        background_dark='#1e1e2e'
+        background_dark_alt='#181825'
+        titlebar_light='#dce0e8'
+        titlebar_dark='#313244'
         ;;
     esac
   fi
@@ -445,13 +445,13 @@ make_assets() {
       ;;
     -Catppuccin)
       if [[ "$color" == '-Light' ]]; then
-        button_close="#e64553"
+        button_close="#d20f39"
         button_max="#40a02b"
         button_min="#df8e1d"
       else
-        button_close="#ea999c"
-        button_max="#a6d189"
-        button_min="#e5c890"
+        button_close="#f38ba8"
+        button_max="#a6e3a1"
+        button_min="#f9e2af"
       fi
       ;;
     -Everforest)
diff --git a/gtkrc.sh b/gtkrc.sh
index aa96c296..70d46183 100644
--- a/gtkrc.sh
+++ b/gtkrc.sh
@@ -219,40 +219,40 @@ make_gtkrc() {
   if [[ "$scheme" == '-Catppuccin' ]]; then
     case "$theme" in
       '')
-        theme_color_dark='#1e66f5'
-        theme_color_light='#8caaee'
+        theme_color_dark='#89b4fa'
+        theme_color_light='#1e66f5'
         ;;
       -Purple)
-        theme_color_dark='#8839ef'
-        theme_color_light='#ca9ee6'
+        theme_color_dark='#cba6f7'
+        theme_color_light='#8839ef'
         ;;
       -Pink)
-        theme_color_dark='#ea76cb'
-        theme_color_light='#f4b8e4'
+        theme_color_dark='#f5c2e7'
+        theme_color_light='#ea76cb'
         ;;
       -Red)
-        theme_color_dark='#e64553'
-        theme_color_light='#ea999c'
+        theme_color_dark='#f38ba8'
+        theme_color_light='#d20f39'
         ;;
       -Orange)
-        theme_color_dark='#fe640b'
-        theme_color_light='#fe8019'
+        theme_color_dark='#fab387'
+        theme_color_light='#fe640b'
         ;;
       -Yellow)
-        theme_color_dark='#df8e1d'
-        theme_color_light='#ef9f76'
+        theme_color_dark='#f9e2af'
+        theme_color_light='#df8e1d'
         ;;
       -Green)
-        theme_color_dark='#40a02b'
-        theme_color_light='#a6d189'
+        theme_color_dark='#a6e3a1'
+        theme_color_light='#40a02b'
         ;;
       -Teal)
-        theme_color_dark='#179299'
-        theme_color_light='#81c8be'
+        theme_color_dark='#94e2d5'
+        theme_color_light='#179299'
         ;;
       -Grey)
-        theme_color_dark='#5c5f77'
-        theme_color_light='#ccd0da'
+        theme_color_dark='#bac2de'
+        theme_color_light='#5c5f77'
         ;;
     esac
   fi
@@ -300,12 +300,12 @@ make_gtkrc() {
         titlebar_dark='#020203'
         ;;
       -Catppuccin)
-        background_light='#eff1f5'
+        background_light='#e6e9ef'
         background_dark='#181825'
-        background_darker='#1e1e2e'
-        background_alt='#232634'
-        titlebar_light='#e6e9ef'
-        titlebar_dark='#11111b'
+        background_darker='#11111b'
+        background_alt='#313244'
+        titlebar_light='#eff1f5'
+        titlebar_dark='#1e1e2e'
         ;;
     esac
   else
@@ -351,12 +351,19 @@ make_gtkrc() {
         titlebar_dark='#272e33'
         ;;
       -Catppuccin)
+        background_light='#e6e9ef'
+        background_dark='#181825'
+        background_darker='#11111b'
+        background_alt='#313244'
+        titlebar_light='#eff1f5'
+        titlebar_dark='#1e1e2e'
+
         background_light='#eff1f5'
-        background_dark='#292c3c'
-        background_darker='#303446'
-        background_alt='#4c4f69'
-        titlebar_light='#e6e9ef'
-        titlebar_dark='#24273a'
+        background_dark='#1e1e2e'
+        background_darker='#181825'
+        background_alt='#45475a'
+        titlebar_light='#dce0e8'
+        titlebar_dark='#313244'
         ;;
     esac
   fi
diff --git a/src/main/plank/theme-Dark-Catppuccin/dock.theme b/src/main/plank/theme-Dark-Catppuccin/dock.theme
index 990e14e4..e6e260bf 100644
--- a/src/main/plank/theme-Dark-Catppuccin/dock.theme
+++ b/src/main/plank/theme-Dark-Catppuccin/dock.theme
@@ -11,11 +11,11 @@ LineWidth=0
 #The color (RGBA) of the outer stroke.
 OuterStrokeColor=0;;0;;0;;0
 #The starting color (RGBA) of the fill gradient.
-FillStartColor=28;;30;;38;;255
+FillStartColor=24;;24;;37;;255
 #The ending color (RGBA) of the fill gradient.
-FillEndColor=28;;30;;38;;255
+FillEndColor=24;;24;;37;;255
 #The color (RGBA) of the inner stroke.
-InnerStrokeColor=28;;30;;38;;255
+InnerStrokeColor=24;;24;;37;;255

 [PlankDockTheme]
 #The padding on the left/right dock edges, in tenths of a percent of IconSize.
diff --git a/src/sass/_color-palette-catppuccin.scss b/src/sass/_color-palette-catppuccin.scss
index 5d19f488..f84c6a8f 100644
--- a/src/sass/_color-palette-catppuccin.scss
+++ b/src/sass/_color-palette-catppuccin.scss
@@ -1,36 +1,38 @@
 // Catppuccin Theme Color Palette

+$catppuccin: true;
+
 // Red
-$red-light: #ea999c;
-$red-dark: #e64553;
+$red-light: #d20f39;
+$red-dark: #f38ba8;

 // Pink
-$pink-light: #f4b8e4;
-$pink-dark: #ea76cb;
+$pink-light: #ea76cb;
+$pink-dark: #f5c2e7;

 // Purple
-$purple-light: #ca9ee6;
-$purple-dark: #8839ef;
+$purple-light: #8839ef;
+$purple-dark: #cba6f7;

 // Blue
-$blue-light: #8caaee;
-$blue-dark: #1e66f5;
+$blue-light: #1e66f5;
+$blue-dark: #89b4fa;

 // Teal
-$teal-light: #81c8be;
-$teal-dark: #179299;
+$teal-light: #179299;
+$teal-dark: #94e2d5;

 // Green
-$green-light: #a6d189;
-$green-dark: #40a02b;
+$green-light: #40a02b;
+$green-dark: #a6e3a1;

 // Yellow
-$yellow-light: #e5c890;
-$yellow-dark: #df8e1d;
+$yellow-light: #df8e1d;
+$yellow-dark: #f9e2af;

 // Orange
-$orange-light: #ef9f76;
-$orange-dark: #fe640b;
+$orange-light: #fe640b;
+$orange-dark: #fab387;

 // Grey
 $grey-050: #eff1f5;
@@ -45,27 +47,29 @@ $grey-450: #7c7f93;
 $grey-500: #6c6f85;
 $grey-550: #5c5f77;
 $grey-600: #4c4f69;
-$grey-650: #303446;
-$grey-700: #292c3c;
-$grey-750: #24273a;
+
+$grey-650: #1e1e2e;
+$grey-700: #1e1e2e;
+$grey-750: #181825;
 $grey-800: #232634;
-$grey-850: #1e1e2e;
+$grey-850: #11111b;
+
 $grey-900: #181825;
 $grey-950: #11111b;

 // White
-$white: #eff1f5;
+$white: #cdd6f4;

 // Black
 $black: #11111b;

 // Button
-$button-close: if($variant == 'light', $red-dark, $red-light);
-$button-max: if($variant == 'light', $green-dark, $green-light);
-$button-min: if($variant == 'light', $yellow-dark, $yellow-light);
+$button-close: if($variant != 'light', $red-dark, $red-light);
+$button-max: if($variant != 'light', $green-dark, $green-light);
+$button-min: if($variant != 'light', $yellow-dark, $yellow-light);

 // Link
-$links: if($variant == 'light', #04a5e5, #99d1db);
+$links: if($variant == 'light', #04a5e5, #89dceb);

 // Theme
 $default-light: $blue-light;
diff --git a/src/sass/_colors.scss b/src/sass/_colors.scss
index 35025a7d..784c4a9e 100644
--- a/src/sass/_colors.scss
+++ b/src/sass/_colors.scss
@@ -58,7 +58,7 @@
 }

 @function theme($color) {
-  @if ($variant == 'light') {
+  @if ($variant != 'light') {
     @if ($theme == 'default') { @return $default-dark; }
     @if ($theme == 'purple') { @return $purple-dark; }
     @if ($theme == 'pink') { @return $pink-dark; }
@@ -147,22 +147,22 @@ $entry:                                 if($variant == 'dark', on($background, s
 //

 $link:                                  $links;
-$link-visited:                          if($variant == 'light', $purple-dark, $purple-light);
+$link-visited:                          if($variant != 'light', $purple-dark, $purple-light);

-$warning:                               if($variant == 'light', $yellow-dark, $yellow-light);
-$error:                                 if($variant == 'light', $red-dark, $red-light);
-$success:                               if($variant == 'light', $green-dark, $green-light);
+$warning:                               if($variant != 'light', $yellow-dark, $yellow-light);
+$error:                                 if($variant != 'light', $red-dark, $red-light);
+$success:                               if($variant != 'light', $green-dark, $green-light);

 $suggested:                             $primary;
 $destructive:                           $error;

 $assets-color:                          $primary;

-$frame:                                 if($variant == 'light', rgba($black, 0.12), rgba($black, 0.25));
-$border:                                if($variant == 'light', rgba($black, 0.12), rgba($white, 0.12));
-$shade:                                 if($variant == 'light', rgba($black, 0.08), rgba($white, 0.08));
-$window-border:                         if($variant == 'light', rgba($black, 0.12), rgba($black, 0.75));
-$solid-border:                          if($variant == 'light', mix(black, $base, 12%), mix(white, $base, 12%));
+$frame:                                 if($variant != 'light', rgba($black, 0.12), rgba($black, 0.25));
+$border:                                if($variant != 'light', rgba($black, 0.12), rgba($white, 0.12));
+$shade:                                 if($variant != 'light', rgba($black, 0.08), rgba($white, 0.08));
+$window-border:                         if($variant != 'light', rgba($black, 0.12), rgba($black, 0.75));
+$solid-border:                          if($variant != 'light', mix(black, $base, 12%), mix(white, $base, 12%));
 $border-alt:                            rgba($black, 0.16); // darker border color for Chrome and Firefox

 //
@@ -217,4 +217,4 @@ $titlebutton-min:                        $button-min;

 // workaround for GTK3 @placeholder_text_color which doesn't allow translucent colors

-$placeholder_text_color:                if($variant == 'light', mix($black, $base, percentage(0.6)), mix($white, $base, percentage(0.7)));
+$placeholder_text_color:                if($variant != 'light', mix($black, $base, percentage(0.6)), mix($white, $base, percentage(0.7)));
EOF

if ! echo "$PATCH" | git apply -v --directory=$CLONE_DIR; then
    echo "Error: Failed to apply catppuccin installer patch!"
    rm -rf $CLONE_DIR
    exit 1
fi

# UNINSTALL

if ! $CLONE_DIR/install.sh -u; then
    echo "Error: Failed to uninstall previous GTK theme installation!"
    exit 1
fi

if ! sudo $CLONE_DIR/install.sh -u; then
    echo "Error: Failed to uninstall previous GTK theme installation as root!"
    exit 1
fi

if ! $CLONE_DIR/install.sh -u -l; then
    echo "Error: Failed to uninstall previous libadwaita GTK theme installation!"
    exit 1
fi

if ! sudo $CLONE_DIR/install.sh -u -l; then
    echo "Error: Failed to uninstall previous libadwaita GTK theme installation as root!"
    exit 1
fi

# INSTALL

if ! $CLONE_DIR/install.sh -l fixed -t purple -c dark -s compact --tweaks catppuccin; then
    echo "Error: Failed to install GTK theme!"
    exit 1
fi

if ! sudo $CLONE_DIR/install.sh -l fixed -t purple -c dark -s compact --tweaks catppuccin; then
    echo "Error: Failed to install GTK theme as root!"
    exit 1
fi

# CLEANUP

if ! rm -rf $CLONE_DIR; then
    echo "Warn: Failed to delete GTK theme repo at '$(pwd)/$CLONE_DIR'! You'll have to manually delete it."
fi

if ! nwg-look -a; then
    echo "Warning: Failed to apply GTK theme. Open 'GTK Settings' (nwg-look) and apply the settings manually."
fi

exit 0
