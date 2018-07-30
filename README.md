# windowtimer
Windows batch script which sends key strokes to a specified window after specified period.

usage: windowtimer TITLE SENDKEYS WAITTIME
 - TITLE: part of running windows application title
 - SENDKEYS: keystrokes which will be sent to the window.
    Specified string will be sent to the SendKey method of WshShell object. 
 - WAITTIME: SECONDS or MINUTES SECONDS or HOURS MINUTES SECONDS
