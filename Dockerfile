FROM kalilinux/kali-rolling
LABEL org.opencontainers.image.authors="githubfoam"


#clean start
RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove && apt-get clean

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    apt-get install -y kali-tools-forensics && \
    echo "########################### METAPACKAGE INFO ###########################" && \
    apt depends kali-tools-forensics  && \
    apt show kali-tools-forensics && \
    apt-cache show kali-tools-forensics | grep Depends && \
    echo "########################### METAPACKAGE INFO ###########################"

# custom packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    aircrack-ng \
    ncat  \
    tor  \    
    strace \
    ltrace \
    # https://github.com/danielmiessler/SecLists
    seclists \ 
    ansible \
    hping3