# The emacs installation phase itself takes around 7 minutes to complete for
# the first time after we change something in the initial or second stage -
# everything under them will have to be rerun... meaning another 7 minutes of
# your life. Not cool.

# so what I found is that you can split the Dockerfile into stages. I will put
# the steps that might change frequently towards the end of the Dockerfile to
# maximize caching. By separating the stages in this manner, Docker will reuse
# the intermediate images created in each stage, utilizing the cache for the
# unchanged layers. When changes occur, only the steps AFTER THE MODIFICATION
# will be re-executed.

# -----------------------------------------------------------
# INITIAL STAGE: Installing essential packages and tools
FROM ubuntu:latest AS base

RUN apt update && apt upgrade -y \
&& apt install sudo make wget -y

# -----------------------------------------------------------
# SECOND STAGE: Installing Git and cloning the repository
FROM base AS gitclone

RUN apt-get install -y git \
&& git clone https://github.com/arvydasg/dotfiles.git /root/dotfiles

# -----------------------------------------------------------
# THIRD STAGE: Emacs installation
FROM gitclone AS emacs

WORKDIR /root
COPY compile-install-emacs.sh compile-install-emacs.sh
RUN chmod +x compile-install-emacs.sh
RUN sh compile-install-emacs.sh

# -----------------------------------------------------------
# FOURTH STAGE: Random stuff since emacs has been installed(heaviest process),
# we can do any random installs and actions here now, so only the steps under
# would be rerun and not the whole container including the emacs compilation
# stage(Third stage)
RUN apt install vim htop tmux -y

# -----------------------------------------------------------
# FINAL STAGE
FROM emacs AS final

ENTRYPOINT ["emacs"]
