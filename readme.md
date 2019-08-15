# Project Title

Organizes videos and assosciatd files into a single folder matching the name of the video files.
Enhanced version of this https://github.com/Radarr/Radarr/wiki/How-to-Create-a-Folder-for-Each-Movie

Will only run against files in root of specified directory, no recursion. Only handles one directory at a time.

**Currently Linux shell script only**

For example, takes a directory like this...

```
-rw-rw-r-- 1 master master 0 Aug 15 04:34 a.mkv
-rw-rw-r-- 1 master master 0 Aug 15 04:34 a.txt
-rw-rw-r-- 1 master master 0 Aug 15 04:34 b.mkv
-rw-rw-r-- 1 master master 0 Aug 15 04:34 c.mkv
-rw-rw-r-- 1 master master 0 Aug 15 04:34 c.srt
-rw-rw-r-- 1 master master 0 Aug 15 04:34 d.mkv
-rw-rw-r-- 1 master master 0 Aug 15 04:34 e.mkv
-rw-rw-r-- 1 master master 0 Aug 15 04:34 f.m4p
-rw-rw-r-- 1 master master 0 Aug 15 04:34 g.m4p
-rw-rw-r-- 1 master master 0 Aug 15 04:34 h.iso
-rw-rw-r-- 1 master master 0 Aug 15 04:34 h.m4p
-rw-rw-r-- 1 master master 0 Aug 15 04:34 pizza.is.good.wav
```

and structures it like this...
.
.
.

# Usage
folderize.sh [dry|live] </absolute/path/to/folder>

```
dry
```
Will make a ghost copies of all files in the path parameter in /tmp/folderize_dry_run and execute the script against them so you can see what the results will be like before running it against your actual files.

```
live
```
Run it for real on files specified in path parameter


# Examples
```
$ folderize.sh live /tmp/folderizer_tests/
/tmp/folderizer_tests/
renamed '/tmp/folderizer_tests//a.mkv' -> '/tmp/folderizer_tests//a/a.mkv'
renamed '/tmp/folderizer_tests//a.txt' -> '/tmp/folderizer_tests//a/a.txt'
renamed '/tmp/folderizer_tests//b.mkv' -> '/tmp/folderizer_tests//b/b.mkv'
renamed '/tmp/folderizer_tests//c.mkv' -> '/tmp/folderizer_tests//c/c.mkv'
renamed '/tmp/folderizer_tests//c.srt' -> '/tmp/folderizer_tests//c/c.srt'
renamed '/tmp/folderizer_tests//d.mkv' -> '/tmp/folderizer_tests//d/d.mkv'
renamed '/tmp/folderizer_tests//e.mkv' -> '/tmp/folderizer_tests//e/e.mkv'
```

### Results

