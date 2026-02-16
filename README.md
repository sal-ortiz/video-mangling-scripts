## Setup
Windows
`.\configure.cmd`

Shell
`sh ./configure.sh`

Download and set up [ffmpeg](https://www.ffmpeg.org/) and [ExifTool](https://exiftool.org/) to the repo's `tmp` folder and creates the `bin` folder within the repo.


## Teardown
Windows
`.\clean.cmd`

Shell
`sh ./clean.sh`

Delete `tmp` and `bin` folders, leaving the repo as it was when it was first cloned.


## Get Info and Metadata
Windows
`.\info.cmd <INPUT>`

Shell
`sh ./info.sh <INPUT>`

Displays information and metadata stored within the video file given as `<INPUT>`


## Check File Integrity
Windows
`.\check.cmd <INPUT>`

Shell
`sh ./check.sh <INPUT>`

Verifies the integrity of the video file provided as `<INPUT>`.


## Shrink Video
Windows
`.\shrink.cmd <CRF> <HEIGHT> <INPUT> [OUTPUT]`

Shell
`sh ./shrink.sh <CRF> <HEIGHT> <INPUT> [OUTPUT]`

Reencodes the video file given as `<INPUT>` using x265 compression and scaling the size by the given image `<HEIGHT>`.

- `<CRF>`: Constant Rate Factor value. 0 is lossless, 51 is max compression. 24 is a good medium from which to start experimenting.
- `<HEIGHT>`: The desired image height of the output (360, 720, 1080, etc.).


## Strip Metadata
Windows
`.\strip_metadata.cmd <INPUT> [OUTPUT]`

Shell
`sh ./strip_metadata.sh <INPUT> [OUTPUT]`

Clears out metadata from the video file given as `<INPUT>` and saves output to the file given as `[OUTPUT]`. If no output file is provided, the input file is overwritten.


## Mix Down Audio
Windows
`.\mix_down_audio.cmd <CHANNELS> <VOLUME> <INPUT> [OUTPUT]`

Shell
`sh ./mix_down_audio.sh <CHANNELS> <VOLUME> <INPUT> [OUTPUT]`

Reduces number of channels, adjusts volume, and reencodes audio in AAC format from a video given as `<INPUT>` and outputs to file optionally given as `[OUTPUT]`. If no output file is provided, the input file is overwritten.
- `<CHANNELS>`: The desired number of channels.
- `<VOLUME>`: A multiplier indicating the increase/decrease of the audio volume (1.0 leaves audio as is).


## Extract Audio
Windows
`.\extract_audio.cmd <INPUT> [OUTPUT]`

Shell
`sh ./extract_audio.sh <INPUT> [OUTPUT]`

Extracts audio from video file given as `<INPUT>` to the WAV file optionally given as `[OUTPUT]`. If no output file is provided, the output audio file will have the same name as the input file.


## Replace Audio
Windows
`.\replace_audio.cmd <INPUT> <AUDIO> [OUTPUT]`

Shell
`sh ./replace_audio.sh <INPUT> <AUDIO> [OUTPUT]`

Overwrites the audio from the video given as `<INPUT>` using the audio file given as `<AUDIO>` and output to the file optionally given as `[OUTPUT]`. If no output file is provided, the input file is overwritten.


## Convert WAV Audio to MP3
Windows
`.\wav_to_mp3.cmd <INPUT> [OUTPUT]`

Shell
`sh ./wav_to_mp3.sh <INPUT> [OUTPUT]`

Compresses the WAV file given as `<INPUT>` into an 320kbps CBR MP3 file named after the name provided as `[OUTPUT]`. If no output file is provided, the output file is named after the input file.


## NOTES
* Scripts currently _DO NOT_ support the use of wildcards as file inputs.
* Some of these scripts are destructive and should be used with caution.
