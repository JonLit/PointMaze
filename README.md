# PointMaze

Ein kleines Spiel für Android-Geräte, PCs und Macs

# Installationsanleitung:

Android:

bis Android 7.0
1. Einstellungen -> Sicherheit -> Unbekannte Herkunft muss aktiviert sein (siehe unten)
2. PointMaze.apk herunterladen
3. PointMaze.apk öffnen
(4. Einstellungen -> Sicherheit -> Unbekannte Herkunft kann wieder deaktiviert werden)

ab Android 8.0
1. PointMaze.apk herunterladen
2. PointMaze.apk öffnen
3. Unbek. Apps installieren aktivieren*
4. PointMaze installieren
5. Wer will kann jetzt wieder Unbek. Apps installieren deaktivieren

*Android lässt aus Sicherheitsgründen standardmäßig keiner App (außer Google PlayStore) die Installation von Apps zu.

PC:

Windows:
1. PointMazeSetup.exe (bzw. PointMazeSetup64.exe) herunterladen
2. PointMazeSetup.exe öffnen

Linux:
1. PointMazeLinux64.zip (bzw. PointMazeLinux64.zip) herunterladen
2. Datei entpacken
3. Point_Maze_PC ausführen

macOS:
1. PointMazeMac.zip herunterladen
2. Datei eintpacken
3. Point_Maze_PC.app ausführen


PointMaze wird leider nicht in absehbarer Zeit für iOS verfügbar sein, da Java leider nicht von iOS unterstützt wird.

# Multiplayer
Allgemeines:
Der Multiplayer funktioniert im Moment nur mit maximal 2 Geräten einwandfrei.
Bei 3 oder mehr geräten sieht nur der Host alle Mitspieler. Da das nicht mit geringem Aufwand zu ändern ist, wird das auch erstmal so bleiben.

Anleitung:
Um mit mehreren Geräten zu spielen, müssen alle Geräte im gleichen WLAN / LAN sein, Hotspots funktionieren auch.
Einer der Spieler muss in den Einstellungen von PointMaze (Pause -> Einstellungen) in den Server Modus wechseln, dadurch wird ein Server auf diesem Gerät gestartet, mit dem sich die anderen Geräte verbinden können.
Die anderen Spieler müssen in den Einstellungen in den Client Modus wechseln. Es öffnet sich ein Fenster, in dem informationen über die automatische serversuche gezeigt werden (kann etwas dauern bis der server gefunden wird, ein Host mit der IP 192.168.0.0 wird sofort gefunden, ein Host mit der IP 192.168.255.255 wird erst nach einigen Minuten gefunden, leider kann ich das nicht verschnellern.
Wenn der Host gefunden wurde, schließt sich dieses Fenster von selber, und wenn man wieder aus den Einstellungen in das Spiel wechselt, werden die Kreise von den Mitspielern als Dunkelrote, weiß umrandete, halbdurchsichtige Kreise dargestellt.
