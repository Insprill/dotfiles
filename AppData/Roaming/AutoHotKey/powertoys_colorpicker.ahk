#SingleInstance Force ; Removes the warning when starting the script while another instance is running.
#NoTrayIcon ; Don't show a tray icon
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#p:: ; Win + P
    Send, +#c ; This simulates Win+Shift+C
return
