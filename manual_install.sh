#!/usr/bin/bash

add-apt-repository -y ppa:stebbins/handbrake-releases
add-apt-repository -y ppa:mc3man/trusty-media
apt-get update
apt-get install -y make mkvtoolnix handbrake-cli mplayer ffmpeg mp4v2-utils linux-headers-generic build-essential dkms virtualbox-guest-utils virtualbox-guest-dkms supervisor ruby ruby-dev
gem install video_transcoding

mkdir -p /media/transcoder

cp supervisor-config.conf /etc/supervisor/conf.d/transcoder.conf
cp transcoder.py /usr/local/bin
chmod +x /usr/local/bin/transcoder.py
supervisorctl reload