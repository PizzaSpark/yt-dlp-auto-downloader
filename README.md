# YT-DLP Command Line Auto Downloader

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [FAQs](#faqs)
- [Additional Information](#additional-information)

## Features
- Download videos or audios
- Supports batch downloading:
  - YouTube playlists
  - Multiple video links (separated by spaces). For example: ytlink1 ytlink2
- Segregates downloaded files into the 'downloads' folder within the project directory (downloaded videos go to ./downloads/video and the same applies for audio)

## Prerequisites
Ensure to download and install the following:

| Name                |                                   Download                                   |
| ------------------- | :--------------------------------------------------------------------------: |
| Python              |                  [Link](https://www.python.org/downloads/)                   |
| NanaZip (7Zip fork) | [Link](https://www.microsoft.com/store/productId/9N8G7TSCL18R?ocid=pdpshare) |
| Git                 |                   [Link](https://git-scm.com/download/win)                   |

## Getting Started

Clone the repository or [download](https://github.com/PizzaSpark/yt-dlp-auto-downloader/releases/download/1/clone.bat) the `clone.bat` file. Run `clone.bat` to clone the repository and start using the program. Enjoy!

## FAQs
### Why do I need to install Python?
The code uses yt-dlp as the video/audio downloader, which requires Python.

### Why NanaZip instead of 7Zip?
NanaZip integrates better with the Windows 11 context menu. It also automatically integrates the 7z command into the environment variables, which the program needs, simplifying the setup process.

### Is NanaZip safe?
Yes, NanaZip is a fork of 7Zip. It uses the same source code as 7Zip, but with additional enhancements.

### Do I need to download NanaZip? Can't I use other extractor programs?
While NanaZip is not required, it simplifies the installation process. If you choose not to use NanaZip, ensure that you move `ffmpeg`, `ffprobe`, and `ffplay` from the assets folder after extraction.

### Why do I need to download Git?
Git ensures your project files are up-to-date by fetching the latest bug fixes and features.

### How do I install Git?
During installation, accept the default options as they are typically the best choices. Custom installation is rarely necessary.

## Additional Information

### 7z integration in the system?
If you find a way to integrate 7z into the command line, feel free to open an issue or submit a pull request to the repository.

### What are the planned features?
- Option to select the video download quality
