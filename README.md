# Plex Playlist Importer
A simple Mac/iOS/iPad app to create playlists from m3u directly to Plex Server Server.
I got inspiration for the UI and for the README from the Universal Windows Platform github project for Windows users that you can find here: https://github.com/gregchak/plex-playlist-import

# Motivation
Currently PMS does not have an GUI for importing playlists. However, there are exposed endpoints that can be utilized for this purpose.

# Installation
You should build the app yourself, but it should be very easy and quick if you're comfortable with XCode.
In releases you can find a notarized version of the app, ready for use!

# Usage
This tool is quite simple in execution.  The most important thing is getting the correct information to fill into the form.

**To Get Section ID and X-Plex Token:**

Taken from reddit 
https://www.reddit.com/r/PleX/comments/ecirqa/how_to_manually_import_an_m3u_playlist_into_plex/
1. Open your Plex server web app , as normal.

2. In Plex , navigate to any file in the library for which you want to import a playlist. (e.g. in your 'Rock Music' library, navigate to 'BornToBeWild.mp3').

3. On the play bar for that library item, click the More Actions ellipses (...) , select Get Info , and then click View XML. A new browser window opens containing XML details about the library item.

4. From the URL, copy the X-Plex-Token value into a text editor.

5. From the page content, copy the librarySectionID value into a text editor.

**What's The Path to Playlist?**

The Path to playlist file is very important to understand. This path is an absolute path that is relative to the PMS server. For example, if your PMS is hosted on Windows, the path would starting with something like `C:\plex\music...`.  If your PMS is hosted on Linux, like a NAS or something, the path would start with something like `/volume1/plex/music...`.  

In addition to making sure the Path to playlist file is correct, the path to the music files in your `.m3u` file need to be setup the same way.  

Its important to note that in a scenario in which you are running the PLEX Playlist Import tool from a device that is NOT your PMS, the above mentioned paths are NOT relative to the computer this tool is running on, but rather relative to the computer your on which your PMS is hosted.

# Screenshot
**Mac App**

<img width="672" alt="Mac App" src="https://user-images.githubusercontent.com/12301205/120077728-243fc900-c0ac-11eb-8a00-0b994d88b1eb.png">

**iPhone/iPad App**

<img width="438" alt="iPhone App" src="https://user-images.githubusercontent.com/12301205/120077770-4df8f000-c0ac-11eb-9d3e-3e5d52c5588d.png">

# Version History

**1.0** - 29-06-2021  
First release.

# License
GNU General Public License v3.0
