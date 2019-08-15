#!/bin/bash

# echo $1
# echo $2

function folderize {

  run_folder=$1

  echo "Running against folder: $run_folder"

  for file in "$run_folder"*

  do
    if [ ! -d "$file" ]; then
      #echo "$file"
      filename=$(basename "$file")
      #echo "$filename"
      sudo touch "$run_folder/$filename"
    fi
  done

  for a in "$run_folder/"*
    do
      ext="${a##*.}"

      if [ ! -d "$a" ] && ( [ "$ext" = "mp4" ] || [ "$ext" = "mkv" ] || [ "$ext" = "m4v" ] || [ "$ext" = "mov" ] || [ "$ext" = "avi" ] ) ; then
        b=$(basename "$a")
        #echo "basename: $b"
        new_folder="$run_folder/${b%.*}"
        #echo "new_folder: $new_folder"
        mkdir "$new_folder"
        # INSTEAD LOOP THROUGH DIRECTORIES AFTER THIS AND FIND FILES NAMES THAT START WITH THE DIRECTORY NAME AND MOVE THEM IN

        folder_to_fill=$(basename "$new_folder")
        #echo "Folder: $folder_to_fill"

        for item in "$run_folder/"*
          do
            filename_to_move=$(basename "$item")
            #echo "File:  $filename_to_move"
            if [ ! -d "$item" ] ; then
              if [[ $filename_to_move = "$folder_to_fill"* ]] ; then
                mv -v "$item" "$new_folder"
              fi
            fi
          done
      fi
    done
  echo "Done"
}


if [ "$1" = "dry" ]; then
  echo $1
  dry_folder="/tmp/folderize_dry_run"
  mkdir "$dry_folder"
  echo "making folder $dry_folder"

  for file in "$2"*

  do
    if [ ! -d "$file" ]; then
      #echo "$file"
      filename=$(basename "$file")
      echo "making dry file $dry_folder/$filename"
      sudo touch "$dry_folder/$filename"
    fi
  done

  folderize $dry_folder

elif [ "$1" = "live" ]; then

  folderize $2

else

  echo "Unkonwn switch $1. Must be 'dry' or 'live'"

fi
