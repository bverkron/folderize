# Overview

Organizes videos and assosciatd files into a single folder matching the name of the video files.
Enhanced version of this https://github.com/Radarr/Radarr/wiki/How-to-Create-a-Folder-for-Each-Movie

# Limitations

* Only runs against individual files in root of specified directory, no recursion. 
* Only handles one directory at a time.
* Only creates folders based on specific video file extensions such as mp4, mkv, m4v, avi, mov (though more can be added by editing the with those types. future version might contain a more easy to edit list)

**Currently Linux shell script only**

For example, takes a directory like this...

```
.
├── a.mkv
├── a.txt
├── b.mkv
├── c.mkv
├── c.srt
├── d.mkv
├── e.mkv
├── f.mp4
├── g.mp4
├── h.mp4
└── pizza.is.good.mov
```

and structures it like this...
```
.
├── a
│   ├── a.mkv
│   └── a.txt
├── b
│   └── b.mkv
├── c
│   ├── c.mkv
│   └── c.srt
├── d
│   └── d.mkv
├── e
│   └── e.mkv
├── f
│   └── f.mp4
├── g
│   └── g.mp4
├── h
│   └── h.mp4
└── pizza.is.good
    └── pizza.is.good.mov
```

# Usage

```
folderize.sh [dry|live] </absolute/path/to/folder>
```

`dry` will make a ghost copies of all files in the path parameter in /tmp/folderize_dry_run and execute the script against them so you can see what the results will be like before running it against your actual files.

`live` will run it for real on files specified in path parameter


# Example
```
$ folderize.sh live /tmp/folderizer_tests/
Running against folder: /tmp/folderizer_tests
renamed '/tmp/folderizer_tests/a.mkv' -> '/tmp/folderizer_tests/a/a.mkv'
renamed '/tmp/folderizer_tests/a.txt' -> '/tmp/folderizer_tests/a/a.txt'
renamed '/tmp/folderizer_tests/b.mkv' -> '/tmp/folderizer_tests/b/b.mkv'
renamed '/tmp/folderizer_tests/c.mkv' -> '/tmp/folderizer_tests/c/c.mkv'
renamed '/tmp/folderizer_tests/c.srt' -> '/tmp/folderizer_tests/c/c.srt'
renamed '/tmp/folderizer_tests/d.mkv' -> '/tmp/folderizer_tests/d/d.mkv'
renamed '/tmp/folderizer_tests/e.mkv' -> '/tmp/folderizer_tests/e/e.mkv'
renamed '/tmp/folderizer_tests/f.mp4' -> '/tmp/folderizer_tests/f/f.mp4'
renamed '/tmp/folderizer_tests/g.mp4' -> '/tmp/folderizer_tests/g/g.mp4'
renamed '/tmp/folderizer_tests/h.mp4' -> '/tmp/folderizer_tests/h/h.mp4'
renamed '/tmp/folderizer_tests/pizza.is.good.mov' -> '/tmp/folderizer_tests/pizza.is.good/pizza.is.good.mov'
Done
```

