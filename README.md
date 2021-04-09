A very simple command line time tracker written in bash.

## Installation
Download the `tracker` file from this repo, it's a bash script.

Make it executable (`chmod +x tracker`) and move to `/usr/local/bin/` to make it avaialbe globally.

## Usage
When you start work:
```
tracker start
```
When you finish work:
```
tracker end
```
To view how much you worked each day:
```
tracker log
```

### Editing time entries
If you want to correct the time when you started/ended your work, edit the `~/time-log.txt` file:
```
vim ~/time-log.txt
```
This is the file created by the tracker and used to keep the track of time.

It is in a human-readable format, just change the time of any entry and then run `tracker log` and you will see the updated output.
