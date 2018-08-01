@if(0)==(0) ECHO OFF
cscript.exe //nologo //E:JScript "%~f0" %*
GOTO :EOF
@end

function echo(s)
{
	WScript.Echo(s);
}

function sleep(ms)
{
	WScript.Sleep(ms);
}

function quit(n)
{
	WScript.Quit(n);
}

function findApp(shApp, title)
{
	for (var i = 0; i < shApp.Windows().Count; i++) {
		var w = shApp.Windows(i);
		var a = "";
		try {
			a = w.document.title;
		} catch(e) {
			continue;
		}
		if(typeof a === 'string' && a.indexOf(title) >= 0) {
			return w;
		}
	}
	return null;
}

function timeToSeconds(h, m, s)
{
	h = Number(h);
	m = Number(m);
	s = Number(s);
	return (h * 60 + m) * 60 + s;
}

function main()
{
	var args = WScript.Arguments;
	var argc = args.length;
	echo("argc = " + argc);
	if (argc < 3 || argc > 5) {
		echo("usage - x WINDOW_TITLE KEY [[hours] minutes] seconds");
		quit(1);
	}
	var title = args(0);
	var keys = args(1);
	var hours = 0;
	var minutes = 0;
	var seconds = 0;
	if (argc == 3) {
		seconds = args(2);
	} else if (argc == 4) {
		minutes = args(2);
		seconds = args(3);
	} else {
		hours = args(2);
		minutes = args(3);
		seconds = args(4);
	}

	var waitSec = timeToSeconds(hours, minutes, seconds);
	sleep(1000 * waitSec);

	var wsh = WScript.CreateObject("WScript.Shell");
	var shApp = WScript.CreateObject("Shell.Application");

	var w = findApp(shApp, title);
	wsh.AppActivate(w);
	sleep(200);
	wsh.SendKeys(keys);
}

main();
