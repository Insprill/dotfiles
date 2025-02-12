#SingleInstance Force ; Removes the warning when starting the script while another instance is running.
#NoTrayIcon ; Don't show a tray icon
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#d:: ; Win + D
#c:: ; Win + C
    Send, !{Space} ; This simulates Alt+Space
return
