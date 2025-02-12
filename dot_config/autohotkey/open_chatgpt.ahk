#SingleInstance Force ; Removes the warning when starting the script while another instance is running.
#NoTrayIcon ; Don't show a tray icon
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#+a:: ; Win + Shift + A
    Run, firefox.exe https://chat.openai.com/
return
