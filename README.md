# windowtimer
Windows batch script which sends key strokes to a specified window after specified period.

usage: windowtimer TITLE SENDKEYS WAITTIME
 - TITLE: part of running windows application title
 - SENDKEYS: keystrokes which will be send to the window.
    Specified string will be send to the SendKey method of WshShell object. 
 - WAITTIME: SECONDS or MINUTES SECONDS or HOURS MINUTES SECONDS
