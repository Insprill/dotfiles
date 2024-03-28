#SingleInstance Force ; Removes the warning when starting the script while another instance is running.
#NoTrayIcon ; Don't show a tray icon
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#+r::Run komorebic reload-configuration,, Hide
#+Space::Run komorebic toggle-float,, Hide

; Move focus with Super + h/j/k/l
#h::Run komorebic focus left,, Hide
#j::Run komorebic focus down,, Hide
#k::Run komorebic focus up,, Hide
#l::Run komorebic focus right,, Hide

; Move windows with Super + SHIFT + h/j/k/l
#+h::Run komorebic move left,, Hide
#+j::Run komorebic move down,, Hide
#+k::Run komorebic move up,, Hide
#+l::Run komorebic move right,, Hide

; Switch workspaces with Super + [0-9]
#1::Run komorebic focus-workspace 0,, Hide
#2::Run komorebic focus-workspace 1,, Hide
#3::Run komorebic focus-workspace 2,, Hide
#4::Run komorebic focus-workspace 3,, Hide
#5::Run komorebic focus-workspace 4,, Hide
#6::Run komorebic focus-workspace 5,, Hide
#7::Run komorebic focus-workspace 6,, Hide
#8::Run komorebic focus-workspace 7,, Hide
#9::Run komorebic focus-workspace 8,, Hide

; Move active window to a workspace with Super + SHIFT + [0-9]
#+1::Run komorebic move-to-workspace 0,, Hide
#+2::Run komorebic move-to-workspace 1,, Hide
#+3::Run komorebic move-to-workspace 2,, Hide
#+4::Run komorebic move-to-workspace 3,, Hide
#+5::Run komorebic move-to-workspace 4,, Hide
#+6::Run komorebic move-to-workspace 5,, Hide
#+7::Run komorebic move-to-workspace 6,, Hide
#+8::Run komorebic move-to-workspace 7,, Hide
#+9::Run komorebic move-to-workspace 8,, Hide
