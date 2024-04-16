# YT-DLP Command Line Auto Downloader

## FEATURES
- Download videos or audios
- Supports batch downloading (tested with YouTube playlists; simply input the link as usual)
- Segregates downloaded files into the 'downloads' folder within the project directory (downloaded videos go to ./downloads/video and the same applies for audio)

## MAKE SURE TO DOWNLOAD THE FOLLOWING
| Name                |                                   Download                                   |
| ------------------- | :--------------------------------------------------------------------------: |
| Python              |                  [Link](https://www.python.org/downloads/)                   |
| NanaZip (7Zip fork) | [Link](https://www.microsoft.com/store/productId/9N8G7TSCL18R?ocid=pdpshare) |
| Git                 |                   [Link](https://git-scm.com/download/win)                   |

## Why do I need to install Python?
The code uses yt-dlp as the video/audio downloader and yt-dlp uses Python.

## Why NanaZip instead of 7Zip?
It's because NanaZip integrates better in Windows 11 context menu. NanaZip also automatically integrates the 7z command in the environment variables which the program needs making our lives easier.

## Is NanaZip safe?
Yes! NanaZip is a fork of 7Zip meaning behind the scenes, it's just the 7Zip source code but a better version of it.

## Do I really need to download NanaZip? Can't I just use other extractor programs?
You actually don't need to download NanaZip. It will just make your life easier during the whole process of installation with this program. If you ever decided you don't want NanaZip, make sure if you extract the file, move `ffmpeg ffprobe ffplay` in the assets folder directly.

## Why do I need to download Git?
The git program checks the current files you have for the project is up to date. It will update the files if it's not up to date so you can get the latest bug fixes and features.

## Im confused how to install git
Just agree with everything. Most of the time, the default selected options in the installation are usually the best options. Rare cases you need to have a custom installation for it.

## Additional statements
### 7z integration in system?
If you ever find a way to integrate 7z in command line. Please don't hesitate to add an issue or a pull request to the repository.

### Planned features in the feature?
- Selecting the quality of the video downloaded



## Now just clone the repository or [download](https://github.com/PizzaSpark/yt-dlp-auto-downloader/releases/download/1/clone.bat) the file to clone the repo, run the `clone.bat` to clone the repository and ENJOY!
