# skynet-media-sharing
a really handy bash script to upload files to a webserver via scp

[![Skynet Media Sharing](http://img.youtube.com/vi/LT2RGI58MGg/0.jpg)](http://www.youtube.com/watch?v=LT2RGI58MGg "Skynet Media Sharing")

## Client side

### Installation

Copy the `transfer.sh` somewhere in your machine and give it execution permissions

    chmod +x transfer.sh

### Requisites

In order to show the notification popups, we need `notify-send` and `zenity`.

    sudo apt-get install notify-send zenity

### Configuration

Edit the `transfer.sh` file in order to edit the `SKYNET_REMOTE` and `SKYNET_URL` variables to fit your case.

### Usage

    transfer.sh file-to-upload.extension
    
### Aliasing

You may want to create an alias for that file, or add him to /usr/bin so you can execute the command from everywhere in your machine.

    alias transfer="<PATH_TO_TRANSFER.SH>"
    
### Drag'n Drop feature

To create a "drag and drop" feature you need to create a `.desktop` file in your desktop.

Refer to the `skynet.desktop` file for an example of how it should be.

## Server side

### Requisites

SSH access via `public key` in order to be able to use `scp` from your client.

A really basic webserver (nginx, apache, caddy...) pointing to an empty folder.

Basically that's all you need.

### Clean up files after X time

You may want to delete every file you upload after a specific amount of time. For that, you can use something like this cronjob.

    0 */1 * * * find <PATH_TO_WEBSERVER_ROOT> -type f -mmin +60 -delete

That will run every hour deleting all files with more than one hour of life.
