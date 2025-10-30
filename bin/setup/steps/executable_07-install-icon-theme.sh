#!/bin/bash

repo_name="Tela-icon-theme"
git clone https://github.com/vinceliuice/$repo_name

read -r -d '' PATCH << 'EOF'
diff --git a/install.sh b/install.sh
index ac4ef7bd..f76eafc3 100755
--- a/install.sh
+++ b/install.sh
@@ -8,7 +8,7 @@ fi

 readonly SRC_DIR=$(cd $(dirname $0) && pwd)

-readonly COLOR_VARIANTS=("standard" "black" "blue" "brown" "green" "grey" "orange" "pink" "purple" "red" "yellow" "manjaro" "ubuntu" "dracula" "nord")
+readonly COLOR_VARIANTS=("standard" "black" "blue" "brown" "green" "grey" "orange" "pink" "purple" "red" "yellow" "manjaro" "ubuntu" "catppuccin" "nord")
 readonly BRIGHT_VARIANTS=("" "light" "dark")

 if command -v lsb_release &> /dev/null; then
@@ -70,7 +70,7 @@ COLOR VARIANTS:
   yellow                   Yellow color folder version
   manjaro                  Manjaro default color folder version
   ubuntu                   Ubuntu default color folder version
-  dracula                  Dracula default color folder version
+  catppuccin               Catppuccin-Mocha Mauve default color folder version
   nord                     nord color folder version

   By default, only the standard one is selected.
@@ -131,9 +131,9 @@ install_theme() {
       local -r theme_color='#fb8441'
       local -r theme_back_color='#ffffff'
       ;;
-    dracula)
-      local -r theme_color='#44475a'
-      local -r theme_back_color='#f8f8f2'
+    catppuccin)
+      local -r theme_color='#45475a' # Surface 1
+      local -r theme_back_color='#cdd6f4' # Text
       ;;
     nord)
       local -r theme_color='#4d576a'
@@ -172,13 +172,13 @@ install_theme() {
       sed -i "/\ColorScheme-Highlight/s/currentColor/${theme_color}/" "${THEME_DIR}/scalable/places/"default-*.svg "${THEME_DIR}/16/places/"folder*.svg
       sed -i "/\ColorScheme-Background/s/currentColor/${theme_back_color}/" "${THEME_DIR}/scalable/places/"default-*.svg

-      if [[ "$1" == "dracula" ]]; then
-        sed -i '/\id="shadow"/s/#000000/#bd93f9/' "${THEME_DIR}/scalable/apps/"*.svg "${THEME_DIR}/scalable/places/"default-*.svg
+      if [[ "$1" == "catppuccin" ]]; then
+        sed -i '/\id="shadow"/s/#000000/#cba6f7/' "${THEME_DIR}/scalable/apps/"*.svg "${THEME_DIR}/scalable/places/"default-*.svg
         sed -i '/\id="shadow"/s/ opacity=".2"//' "${THEME_DIR}/scalable/apps/"*.svg "${THEME_DIR}/scalable/places/"default-*.svg
-        sed -i '/\id="bottom_layer"/s/#44475a/#bd93f9/' "${THEME_DIR}/16/places/"folder*.svg
+        sed -i '/\id="bottom_layer"/s/#44475a/#cba6f7/' "${THEME_DIR}/16/places/"folder*.svg
         sed -i '/\id="bottom_layer"/s/ opacity="0.5"//' "${THEME_DIR}/16/places/"folder*.svg
         sed -i "s/color:#ffffff/color:#f8f8f2/g" "${THEME_DIR}/scalable/places/"default-*.svg
-        sed -i "s/${theme_color}/#dd86e0/g" "${THEME_DIR}/scalable/places/"default-user-desktop.svg
+        sed -i "s/${theme_color}/#cba6f7/g" "${THEME_DIR}/scalable/places/"default-user-desktop.svg
         sed -i '/\id="highlight"/s/opacity=".25"/opacity="0"/' "${THEME_DIR}/scalable/places/"default-user-desktop.svg
         sed -i "s/#5294e2/#bd93f9/g" "${THEME_DIR}/scalable/devices/"*.svg "${THEME_DIR}/32/devices/"*.svg
       elif [[ "$1" == "grey" ]]; then
@@ -252,8 +252,8 @@ install_theme() {
     if [[ "$1" != "standard" ]]; then
       sed -i "s/#5294e2/${theme_color}/g" "${THEME_DIR}/16/places/"folder*.svg

-      if [[ "$1" == "dracula" ]]; then
-        sed -i '/\id="bottom_layer"/s/currentColor/#bd93f9/' "${THEME_DIR}/16/places/"folder*.svg
+      if [[ "$1" == "catppuccin" ]]; then
+        sed -i '/\id="bottom_layer"/s/currentColor/#cba5f7/' "${THEME_DIR}/16/places/"folder*.svg
         sed -i '/\id="bottom_layer"/s/ opacity="0.5"//' "${THEME_DIR}/16/places/"folder*.svg
       fi
     fi
@@ -346,8 +346,6 @@ if [[ ${uninstall} == 'true' ]]; then
 else
   # By default, only the standard color variant is selected
   for color in "${colors[@]:-standard}"; do
-    for bright in "${BRIGHT_VARIANTS[@]}"; do
-      install_theme "${color}" "${bright}"
-    done
+    install_theme "${color}"
   done
 fi
EOF

if ! echo "$PATCH" | git apply -v --directory=$repo_name; then
    echo "Error: Failed to apply catppuccin installer patch!"
    rm -rf $repo_name
    exit 1
fi

if ! $repo_name/install.sh -c catppuccin; then
    echo "Error: Failed to install icon theme!"
    rm -rf $repo_name
    exit 1
fi

if ! sudo $repo_name/install.sh -c catppuccin; then
    echo "Error: Failed to install icon theme as root!"
    rm -rf $repo_name
    exit 1
fi

if ! rm -rf $repo_name; then
    echo "Warn: Failed to remove icon them directory '$repo_name'. You'll have to remove this yourself."
fi

exit 0
