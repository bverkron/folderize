# Overview

Organizes videos and assosciatd files into a single folder matching the name of the video files. Primarily written as a way to create folders for each movie in a flat directory in preperation for bulk import to Radarr. Basically an enhanced version of this, which I had trouble getting to work. https://github.com/Radarr/Radarr/wiki/How-to-Create-a-Folder-for-Each-Movie
Written in a hasty and exhausted state so the code is by no means pretty or efficient, but it seems to work well in my limited tests.

Example:

Turns this...

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

... into this ...
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

# Limitations

* Only runs against individual files in root of specified directory, no recursion. 
* Only handles one directory at a time.
* Only creates folders based on specific video file extensions such as mp4, mkv, m4v, avi, mov (though more can be added by editing the with those types. future version might contain a more easy to edit list)
* **Currently only available as Linux shell script**
* **Test first using `dry` parameter. Use at your own risk. **

# Usage

```
folderize.sh [dry|live] </absolute/path/to/folder>
```

`dry` **[Recommended the first time]** will make a ghost copies of all files in the path parameter in /tmp/folderize_dry_run and execute the script against them so you can see what the results will be like before running it against your actual files.

`live` will run it for real on files specified in path parameter


# Examples

#### Command output from run against test structure from above.
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

#### Result of run on "dirty" single library folder
Forgot to do a before / after so this is just after folderize was run. Most individual files were in the root folder, but some were already in their own individual folders (probably all the ones with subfolders and a few others). Some filenames do not match the parent foldername because Radarr renaming was done afterwards but it gives an examples of getting all the right files into a folder for that movie.

├── Beauty.and.the.Beast.2017.720p.BluRay.x264-SPARKS
│   ├── Beauty-and-the-Beast-2017-Bluray-720p.en.srt
│   └── Beauty-and-the-Beast-2017-Bluray-720p.mkv
├── Bedtime Stories[2008]DvDrip[Eng]-FXG
│   ├── Bedtime-Stories-2008-DVD.avi
│   └── Bedtime-Stories-2008-DVD.en.srt
├── Big.Hero.6.2014.720p.BluRay.x264.YIFY
│   ├── Big-Hero-6-2014-Bluray-720p.en.srt
│   └── Big-Hero-6-2014-Bluray-720p.mp4
├── Bolt.2008.BluRay.1080p.DTS.x264-PRoDJi
│   └── Bolt-2008-Bluray-1080p.mkv
├── Brave.2012.1080p.BluRay.H264.AAC-RARBG
│   ├── Brave-2012-Bluray-1080p.mp4
│   ├── Brave-2012-Bluray-1080p.txt
│   └── Subs
│       └── 2_Eng.srt
├── Cars.2006.720p.BrRip.x264.YIFY
│   ├── Cars-2006-Bluray-720p.en.srt
│   └── Cars-2006-Bluray-720p.mp4
├── Cars.2.2011.BRRip.XviD-3LT0N
│   ├── Cars-2-2011-DVD.avi
│   └── Cars-2-2011-DVD.en.srt
├── Cars.3.2017.READNFO.720p.WEB-DL.X264.AC3-EVO
│   ├── Cars-3-2017-WEBDL-720p.en.srt
│   ├── Cars-3-2017-WEBDL-720p.mkv
│   └── Cars-3-2017-WEBDL-720p.nfo
├── Curious.George[2006]DvDrip.AC3[Eng]-aXXo
│   ├── Curious-George-2006-DVD.avi
│   └── Curious-George-2006-DVD.en.srt
├── Despicable Me 2 2013 BRRip 720p AC3 x264 Temporal
│   ├── Despicable-Me-2-2013-Bluray-720p.en.srt
│   └── Despicable-Me-2-2013-Bluray-720p.mkv
├── despicable.me.dvdrip.xvid-imbt
│   ├── despicable.me.dvdrip.xvid-imbt.avi
│   └── despicable.me.dvdrip.xvid-imbt.en.srt
├── Disney's Hercules 1997 1080p BDRip H264 AAC - KiNGDOM
│   ├── Hercules-1997-Bluray-1080p.en.srt
│   ├── Hercules-1997-Bluray-1080p.mp4
│   ├── Hercules-1997-Bluray-1080p.nfo
│   ├── Poster
│   │   └── Hercules.jpg
│   └── Sample
│       └── Hercules Sample.mp4
├── Dr. Seuss' How the Grinch Stole Christmas!
│   ├── Dr. Seuss' How the Grinch Stole Christmas!.avi
│   └── Dr. Seuss' How the Grinch Stole Christmas!.en.srt
├── Elf[2003]XviD
│   ├── Elf-2003-Unknown.avi
│   └── Elf-2003-Unknown.en.srt
├── Fantastic Beasts The Crimes of Grindelwald (2018)
│   ├── Fantastic-Beasts-The-Crimes-of-Grindelwald-2018-Remux-2160p.mkv
│   └── Fantastic-Beasts-The-Crimes-of-Grindelwald-2018-Remux-2160p.txt
├── Frosty the Snowman Divx
│   ├── Frosty the Snowman Divx.avi
│   └── Frosty the Snowman Divx.en.srt
├── Frozen.2013.720p.BluRay.x264-x0r
│   ├── Frozen.2013.720p.BluRay.x264-x0r.fanart.jpg
│   ├── Frozen.2013.720p.BluRay.x264-x0r[TRAILER-Theatrical trailer].mov
│   ├── Frozen-2013-Bluray-720p.1.en.srt
│   ├── Frozen-2013-Bluray-720p.2.en.srt
│   ├── Frozen-2013-Bluray-720p.jpg
│   ├── Frozen-2013-Bluray-720p.mkv
│   └── Frozen-2013-Bluray-720p.nfo
├── Guardians.of.the.Galaxy.Vol.2.2017.1080p.WEB-DL.H264.AC3-EVO
│   ├── Guardians-of-the-Galaxy-Vol.-2-2017-WEBDL-1080p.en.srt
│   ├── Guardians-of-the-Galaxy-Vol.-2-2017-WEBDL-1080p.mkv
│   └── Guardians-of-the-Galaxy-Vol.-2-2017-WEBDL-1080p.nfo
├── Happy.Feet[2006]DvDrip[Eng]-aXXo
│   ├── Happy-Feet-2006-DVD.avi
│   └── Happy-Feet-2006-DVD.en.srt
├── Holes (2003)
│   ├── Holes-2003-Bluray-1080p.idx
│   ├── Holes-2003-Bluray-1080p.mp4
│   ├── Holes-2003-Bluray-1080p.sub
│   ├── Holes-2003-Bluray-1080p.txt
│   └── Subs
│       ├── 2_Eng.srt
│       └── 3_Eng.srt
├── Homeward Bound
│   ├── Finding.Nemo.2003.720p.BluRay.H264.AAC-RARBG
│   │   ├── Finding.Nemo.2003.720p.BluRay.H264.AAC-RARBG.mp4
│   │   ├── RARBG.txt
│   │   └── Subs
│   │       └── 2_Eng.srt
│   ├── Homeward Bound.en.srt
│   └── Homeward Bound.m4v
├── Horton.Hears.A.Who![2008]DvDrip-aXXo
│   ├── Horton-Hears-a-Who!-2008-DVD.avi
│   └── Horton-Hears-a-Who!-2008-DVD.en.srt
├── Hotel Transylvania 3 A Monster Vacation.2018.HDRip.XviD.AC3-EVO
│   ├── Hotel-Transylvania-3-Summer-Vacation-2018-WEBDL-480p.avi
│   ├── Hotel-Transylvania-3-Summer-Vacation-2018-WEBDL-480p.en.srt
│   └── Hotel-Transylvania-3-Summer-Vacation-2018-WEBDL-480p.nfo
├── How.to.Train.Your.Dragon.2.2014.BRRip.XviD-SaM[ETRG]
│   ├── How-to-Train-Your-Dragon-2-2014-DVD.avi
│   └── How-to-Train-Your-Dragon-2-2014-DVD.en.srt
├── Kung.Fu.Panda.2008.720p.BRRip.XviD.AC3-FLAWL3SS
│   ├── Kung-Fu-Panda-2008-DVD.avi
│   ├── Kung-Fu-Panda-2008-DVD.en.srt
│   ├── Kung-Fu-Panda-2008-DVD.nfo
│   └── Sample.avi
├── Madagascar[2005]DvDrip-aXXo
│   ├── Madagascar-2005-DVD.avi
│   └── Madagascar-2005-DVD.en.srt
├── Madagascar-Escape.2.Africa[2008]DvDrip-aXXo
│   ├── Madagascar-Escape-2-Africa-2008-DVD.avi
│   └── Madagascar-Escape-2-Africa-2008-DVD.en.srt
├── Monsters Inc 2001 BRRIP Xvid AC3-BHRG
│   ├── Monsters,-Inc.-2001-DVD.avi
│   └── Monsters,-Inc.-2001-DVD.en.srt
├── Monsters University
│   ├── Monsters University.avi
│   └── Monsters University.en.srt
├── Peanuts PT 01 - A Charlie Brown Christmas 12-09-1965
│   ├── Peanuts PT 01 - A Charlie Brown Christmas 12-09-1965.avi
│   └── Peanuts PT 01 - A Charlie Brown Christmas 12-09-1965.en.srt
├── Peanuts PT 36 - It's Christmastime Again, Charlie Brown - 11-27-1992
│   ├── Peanuts PT 36 - It's Christmastime Again, Charlie Brown - 11-27-1992.avi
│   └── Peanuts PT 36 - It's Christmastime Again, Charlie Brown - 11-27-1992.en.srt
├── Peanuts PT 43 - I Want A Dog For Christmas, Charlie Brown - 12-09-2003
│   ├── Peanuts PT 43 - I Want A Dog For Christmas, Charlie Brown - 12-09-2003.avi
│   └── Peanuts PT 43 - I Want A Dog For Christmas, Charlie Brown - 12-09-2003.en.srt
├── Penguins.of.Madagascar.2014.720p.BluRay.x264.YIFY
│   ├── Penguins-of-Madagascar-2014-Bluray-720p.en.srt
│   └── Penguins-of-Madagascar-2014-Bluray-720p.mp4
├── Piper (2016)
│   └── Piper-2016-Bluray-1080p.mp4
├── Ponyo (2008) 720p [Jpn 5.1 & Eng] Blu-ray (Studio Ghibli)
│   ├── Ponyo-2008-Bluray-720p.en.srt
│   ├── Ponyo-2008-Bluray-720p.jpg
│   └── Ponyo-2008-Bluray-720p.mp4
├── Ralph Breaks the Internet.2018.V2.DVDSCR.XviD.AC3-EVO[oscars]
│   ├── Ralph-Breaks-the-Internet-2018-DVDSCR.avi
│   ├── Ralph-Breaks-the-Internet-2018-DVDSCR.en.srt
│   └── Ralph-Breaks-the-Internet-2018-DVDSCR.nfo
├── Ratatouille.2007.720p.BluRay.x264-x0r
│   ├── Ratatouille-2007-Bluray-720p.1.en.srt
│   ├── Ratatouille-2007-Bluray-720p.2.en.srt
│   ├── Ratatouille-2007-Bluray-720p.jpg
│   ├── Ratatouille-2007-Bluray-720p.mkv
│   └── Ratatouille-2007-Bluray-720p.nfo
├── Rookie of the Year (1993) DVDRip. WS. XviD. AC3. 6ch. MovieExtreme
│   ├── Rookie-of-the-Year-1993-DVD.avi
│   └── Rookie-of-the-Year-1993-DVD.en.srt
├── Rudolph the Red Nosed Reindeer 1964
│   ├── Rudolph-the-Red-Nosed-Reindeer-1964-Unknown.avi
│   └── Rudolph-the-Red-Nosed-Reindeer-1964-Unknown.en.srt
├── Santa Claus is Coming to Town
│   ├── Santa Claus is Coming to Town.avi
│   └── Santa Claus is Coming to Town.en.srt
├── Shrek.Forever.After[2010]DvDrip-aXXo
│   ├── Shrek-Forever-After-2010-DVD.avi
│   └── Shrek-Forever-After-2010-DVD.en.srt
├── Smallfoot.2018.720p.BluRay.H264.AAC-RARBG
│   └── Smallfoot.2018.720p.BluRay.H264.AAC-RARBG.en.srt
├── Spiderman.2.2004.Brrip.Xvid.Ac3.Projekt
│   ├── Spider-Man-2-2004-DVD.avi
│   └── Spider-Man-2-2004-DVD.en.srt
├── Spider-Man.Into the Spider-Verse.2019.1080p.WEB-DL.H264.AC3-EVO
│   └── Spider-Man.Into the Spider-Verse.2019.1080p.WEB-DL.H264.AC3-EVO.en.srt
├── Star Wars Episode II Attack of the Clones (2002) [1080p]
│   ├── Star-Wars-Episode-II-Attack-of-the-Clones-2002-Bluray-1080p.1.en.srt
│   ├── Star-Wars-Episode-II-Attack-of-the-Clones-2002-Bluray-1080p.2.en.srt
│   ├── Star-Wars-Episode-II-Attack-of-the-Clones-2002-Bluray-1080p.mp4
│   └── Star-Wars-Episode-II-Attack-of-the-Clones-2002-Bluray-1080p.srt
├── Star Wars Episode III Revenge of the Sith (2005) [1080p]
│   ├── Star-Wars-Episode-III-Revenge-of-the-Sith-2005-Bluray-1080p.1.en.srt
│   ├── Star-Wars-Episode-III-Revenge-of-the-Sith-2005-Bluray-1080p.2.en.srt
│   ├── Star-Wars-Episode-III-Revenge-of-the-Sith-2005-Bluray-1080p.mp4
│   └── Star-Wars-Episode-III-Revenge-of-the-Sith-2005-Bluray-1080p.srt
├── Star Wars Episode I The Phantom Menace (1999) [1080p]
│   ├── Star-Wars-Episode-I-The-Phantom-Menace-1999-Bluray-1080p.1.en.srt
│   ├── Star-Wars-Episode-I-The-Phantom-Menace-1999-Bluray-1080p.2.en.srt
│   ├── Star-Wars-Episode-I-The-Phantom-Menace-1999-Bluray-1080p.mp4
│   └── Star-Wars-Episode-I-The-Phantom-Menace-1999-Bluray-1080p.srt
├── Star Wars Episode IV A New Hope 1977 720p.BluRay.X264-AMIABLE
│   ├── Star-Wars-1977-Bluray-720p.1.en.srt
│   ├── Star-Wars-1977-Bluray-720p.2.en.srt
│   └── Star-Wars-1977-Bluray-720p.mkv
├── Star Wars Episode VI Return of the Jedi (1983) [1080p]
│   ├── Return-of-the-Jedi-1983-Bluray-1080p.1.en.srt
│   ├── Return-of-the-Jedi-1983-Bluray-1080p.2.en.srt
│   ├── Return-of-the-Jedi-1983-Bluray-1080p.mp4
│   └── Return-of-the-Jedi-1983-Bluray-1080p.srt
├── Star Wars Episode V The Empire Strikes Back (1980) [1080p]
│   ├── The-Empire-Strikes-Back-1980-Bluray-1080p.en.srt
│   ├── The-Empire-Strikes-Back-1980-Bluray-1080p.jpg
│   ├── The-Empire-Strikes-Back-1980-Bluray-1080p.mp4
│   └── The-Empire-Strikes-Back-1980-Bluray-1080p.srt
├── Tangled (2010)
│   ├── Tangled-2010-HDTV-720p.DS_Store
│   ├── Tangled-2010-HDTV-720p.en.srt
│   └── Tangled-2010-HDTV-720p.mp4
├── The Emperors New Groove
│   ├── The Emperors New Groove.avi
│   └── The Emperors New Groove.en.srt
├── The Grinch (2018)
│   ├── The-Grinch-2018-Bluray-720p.en.srt
│   └── The-Grinch-2018-Bluray-720p.mkv
├── The.House.with.a.Clock.in.Its.Walls.2018.1080p.BluRay.x264-GECKOS[rarbg]
│   ├── Subs
│   ├── The-House-with-a-Clock-in-Its-Walls-2018-Bluray-1080p.en.srt
│   ├── The-House-with-a-Clock-in-Its-Walls-2018-Bluray-1080p.idx
│   ├── The-House-with-a-Clock-in-Its-Walls-2018-Bluray-1080p.jpg
│   ├── The-House-with-a-Clock-in-Its-Walls-2018-Bluray-1080p.mkv
│   ├── The-House-with-a-Clock-in-Its-Walls-2018-Bluray-1080p.nfo
│   ├── The-House-with-a-Clock-in-Its-Walls-2018-Bluray-1080p.sub
│   └── The-House-with-a-Clock-in-Its-Walls-2018-Bluray-1080p.txt
├── The.Incredibles.2004.1080p.BluRay.AC3.x264-ETRG
│   ├── The-Incredibles-2004-Bluray-1080p.1.en.srt
│   ├── The-Incredibles-2004-Bluray-1080p.2.en.srt
│   └── The-Incredibles-2004-Bluray-1080p.mkv
├── The Iron Giant 1999 720p WEBRip x264-PLAYNOW
│   ├── The-Iron-Giant-1999-WEBDL-720p.en.srt
│   └── The-Iron-Giant-1999-WEBDL-720p.mp4
├── the.lego.movie.2014.720p.bluray.x264
│   ├── The-Lego-Movie-2014-Bluray-720p.en.srt
│   └── The-Lego-Movie-2014-Bluray-720p.mkv
├── The Little Drummer Boy
│   ├── The Little Drummer Boy.avi
│   └── The Little Drummer Boy.en.srt
├── The.Muppets.2011.DVDRip.XviD-SPARKS
│   ├── The-Muppets-2011-DVD.avi
│   └── The-Muppets-2011-DVD.en.srt
├── Toy.Story.1995.720p.BRRiP.x264.AC3-MAJESTIC
│   └── Toy.Story.1995.720p.BRRiP.x264.AC3-MAJESTIC.mkv.!qB
├── Toy.Story.3[2010]DvDrip-aXXo
│   ├── Toy-Story-3-2010-DVD.avi
│   └── Toy-Story-3-2010-DVD.en.srt
├── Toy.Story.Trilogy.1080p.BRRip.XviD.AC3-FLAWL3SS
│   ├── Toy.Story.1995.1080p.BRRip.XviD.AC3-FLAWL3SS
│   │   ├── Toy.Story.1995.1080p.BRRip.XviD.AC3-FLAWL3SS.avi
│   │   ├── Toy.Story.1995.1080p.BRRip.XviD.AC3-FLAWL3SS-English.srt
│   │   └── Toy.Story.1995.1080p.BRRip.XviD.AC3-FLAWL3SS.sample.avi
│   ├── Toy.Story.2.1999.1080p.BRip.XviD.AC3-FLAWL3SS
│   │   ├── Toy.Story.2.1999.1080p.BRip.XviD.AC3-FLAWL3SS.avi
│   │   ├── Toy.Story.2.1999.1080p.BRip.XviD.AC3-FLAWL3SS.en.srt
│   │   └── Toy.Story.2.1999.1080p.BRRip.XviD.AC3-FLAWL3SS.sample.avi
│   ├── Toy.Story.3.2010.1080p.BRRip.XviD.AC3-FLAWL3SS
│   └── Toy.Story.Trilogy.1080p.BRRip.XviD.AC3-FLAWL3SS.nfo
├── Treasure PLANET
│   ├── Treasure PLANET.avi
│   └── Treasure PLANET.en.srt
├── Up Pixar [2009] dvd rip nlx
│   ├── Up Pixar [2009] dvd rip nlx.avi
│   └── Up Pixar [2009] dvd rip nlx.en.srt
├── Winnie The Pooh 2011 DVDRiP XViD - IMAGiNE
│   ├── Winnie-the-Pooh-2011-DVD.avi
│   └── Winnie-the-Pooh-2011-DVD.en.srt
├── Wreck-It.Ralph.2012.BRRip.XviD.AC3-MAGNAT
│   ├── Wreck-It-Ralph-2012-DVD.avi
│   └── Wreck-It-Ralph-2012-DVD.en.srt
└── Zootopia.2016.BRRip.XviD.AC3-EVO
    ├── sample.avi
    ├── Zootopia.2016.BRRip.XviD.AC3-EVO.avi
    ├── Zootopia.2016.BRRip.XviD.AC3-EVO.en.srt
    └── Zootopia.2016.BRRip.XviD.AC3-EVO.nfo


