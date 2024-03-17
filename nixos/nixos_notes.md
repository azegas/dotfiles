# first nixos installation

```org
* Why NixOS

AFTER you reinstall your machine - to install the DEV environment, all you
have to take with you is =/etc/nixos/configuration.nix= file, everything is
described in it. Amazing!

When previously you would have to check your notes for step by step
instruction(similar like [[file:20231128T130237--linux-ubuntu-install__linux.org][linux ubuntu install]]), to configure your new
environment same as it was before, then run different scripts from different
places, make sure you got them all.. with nix you will never have that pain
again.

* Why NixOS by others

- https://github.com/hlissner/dotfiles
- https://github.com/terlar/nix-config

* Documentation

- nixos github repo - https://github.com/nix-community/NixOS-WSL
- nixos manual - https://nixos.org/manual/nix/stable/

* Installation on WSL

Steps described here:

https://github.com/nix-community/NixOS-WSL

** Check if NixOS is not already installed

Run the commands in windows cmd or powershell.

#+begin_src bash
  wsl --status
  wsl --version
  wsl --help
  wsl --list --verbose
#+end_src

** Install

If it does not exist(=wsl --list --verbose= does not yield result with nixos ),
then basically download =nixos-wsl.tar.gz= into your windows =/Downloads=
folder from the [[https://github.com/nix-community/NixOS-WSL/releases/tag/2311.5.3][latest release]].

Then in CMD run(while in /Downloads folder):
#+begin_src bash
  wsl --import NixOS .\NixOS\ nixos-wsl.tar.gz --version 2
#+end_src

check if it was really installed:
#+begin_src bash
  wsl -l -v
#+end_src

You should see NixOS listed. Now we can run nixos:
#+begin_src bash
  wsl -d NixOS
#+end_src

After the initial installation, you need to update your channels once(while in
nixos), to be able to use =nixos-rebuild=:
#+begin_src bash
  sudo nix-channel --add https://nixos.org/channels/nixos-23.11 nixos
  sudo nix-channel --update
#+end_src

* Configure NixOS installation over Emacs

Enter =nix-shell= to use Emacs(it does not get installed on the system, just
[[https://nix.dev/tutorials/first-steps/ad-hoc-shell-environments][TEMPORARILY]] FROM NIXOS CACHE?). So I can then modify the configuration
=/etc/nixos/configuration.nix= file.

#+begin_src bash
  nix-shell -p emacs29
#+end_src

Then let's run emacs in nix-shell(run with sudo)

#+begin_src bash
  sudo emacs
#+end_src

Ok now you are in Emacs, but in =nix-shell=. If we turn off nixos now, when we
launch it again, emacs will not be available. Only after you run =nix-shell -p
emacs=. Let's install emacs permanetely. First open the default NixOS
configuration file:

#+begin_src bash
  sudo emacs /etc/nixos/configuration.nix
#+end_src

Add the following 4 files lines, it will install Emacs globally and permanetely
inside of NixOS as well as git(we will need it to clone our config repos). We
Install emacs29 because of [[file:20231125T220943--seq-keep-error-message-in-emacs__emacs_magit.org][seq error message]] that I have faced before:

#+begin_src nix
  environment.systemPackages = with pkgs; [
    emacs29
    git
  ];
#+end_src

After adding these 4 lines to the config file, =C-d= to go back to
nixos@nixos(out of nix-shell) and BUILD the nixos with the new changes(emacs
and git installation).

#+begin_src bash
  sudo nixos-rebuild switch
#+end_src

After this finishes running, you should be able to use Emacs and git!

#+begin_src bash
  emacs
  git status
#+end_src

* Authenticate to git

Some of our config repos are private, so for that we need to authenticate to
git first.

First you must do [[file:20231211T161252--introduce-yourself-to-git__git.org][this]].

Then one of these:

- [[file:20231214T060637--authenticate-to-git-with-personal-access-token__git.org][authenticate with personal access token]]
- [[file:20231214T060558--authenticate-to-git-with-ssh__git_ssh.org][authenticate with ssh]](usually using this at home)
- [[file:20231214T061312--authenticate-to-git-with-gpg-key__git_gpg.org][authenticate with gpg]]

- On work machine, set up ssh method to work repo.
- On work machine for personal repos - use token method.

* Clone the dotfiles repo

It consists both emacs and nixos config, we will need both in the next steps.

#+begin_src bash
  mkdir ~/GIT
  cd ~/GIT
  git clone https://github.com/arvydasg/dotfiles
#+end_src

* Using your own custom nixos configuration file

#+begin_src bash
  # delete current nixos directory
  sudo rm -rf /etc/nixos
  # put our config folder instead of the default one
  sudo ln -s ~/GIT/dotfiles/nixos/ /etc/nixos
#+end_src

Check if the symlink worked:

#+begin_src bash
  ls -la /etc | grep nixos
#+end_src

You should see =nixos -> /home/nixos/GIT/dotfiles/nixos/=.

If so, then you are done.

We can rebuild NixOS with the settings from our personal configuration in mind.

#+begin_src bash
  sudo nixos-rebuild switch
#+end_src

After this is done running, our NixOS installation will be current, as the one
described in the configuration file.

#+begin_quote
Note on Installing other packages

If you want to install a package called "make" for example and nixos says it
can not find it when you attempt to install it, then you can do
=command-not-found make=, this command will show each package which exposes
that command. Quite useful to know all the versions/types of the package you
want to install.
#+end_quote

* Using your own custom Emacs config

After we have all the "OS" dependencies installed, we can install Emacs
dependencies.

#+begin_src bash
  # remove .emacs.d dir from ~/ first
  cd ~/GIT
  ln -s GIT/dotfiles/.emacs.d/ ~/.emacs.d
#+end_src

Check if symlink got created with(while in ~/ dir):

#+begin_src bash
  ls -la | grep .emacs.d
#+end_src

Should see something like =.emacs.d -> GIT/dotfiles/.emacs.d/=.

Do the following step that is described in the emacs config, tangling part -
[[https://github.com/arvydasg/dotfiles/blob/master/.emacs.d/init.org#tangling][here]].

#+begin_src bash
  cd ~/.emacs.d
  git update-index --assume-unchanged init.el
#+end_src

Try to launch emacs for all the packages to be installed.

*  GUI glitch

Reported it here  - https://github.com/microsoft/wslg/issues/1148

Possible fix(questionable) .wslgconfig(as explained in the comments of the issue)

```
# seb nixos installation

```org

* seb nixos installation                                             :noexport:

<2023-11-30 Thu> While trying to figure out how sebwsl works, I was chatting
with the Swedish guy, master linux guy, master computers guy, master
automatisations guy and has mentioned nixos a few times. I decided to give it a
try since I have such a willing helping me with everything. Fun fact - he is
the first person I was chatting with that is using Emacs(over the last 3 or so
years me using emacs, I have never been so close to someone using Emacs as
well! In my workplace(other country tho))!!!! His config must be sick, can't
wait to check it.

sebnix repo - https://github.sebank.se/sebnix/sebnix
kurejo configas - https://github.sebank.se/s2450g/config
docs? - https://nix-community.github.io/home-manager/options.html

** Install NixOS

download nix installation

https://github.sebank.se/sebnix/sebnix/releases/download/v0.3.2/nixos-wsl.tar.gz

probably its in downloads. go to downloads folder, open cmd and run:

wsl --import nixos .\nixos .\nixos-wsl.tar.gz

wsl --setdefault nixos

wsl --list --verbose (you can see that it also installed the wsl-vpnkit(kad kol
kas butu prisjunges prie vpn galeciau pasiekti external ir sebinius resources.
Jeigu atsiungiu nuo vpn - tuomet galiu viska pasiekti. Bet iprastai juk mes
dirbam per vpn, tai del to ir reikia tokio paejimo. Naudojant sebwsl sita
vpn-kit reiketu runinti su atskira komanda - "wsl.exe -d wsl-vpnkit --cd /app
wsl-vpnkit"))

wsl --list --verbose

wsl --distribution nixos

you are in.

random username, random location. Plain configuration, nothing in it yet.

Check if you can do ping.. quite important aht vpn-kit is running. It is built
in into sebnix, or otherwise sebwsl has that one also. `sebwsl apply
vpnkit-install` installs it. Check if its running also.

can run it like so manually in another terminal, dont stop the process. It
allows you to access things over wsl and over vpn - `wsl.exe -d wsl-vpnkit --cd
/app wsl-vpnkit`

If nixos is running and you try to launch sebwsl - it will say that the stuff
is taken.

So what worked for me is to:
- wsl --shutdown
- wsl -l -v
- make sure viskas shuttinosi down
- run dis(not sure if needed) - wsl.exe -d wsl-vpnkit --cd /app wsl-vpnkit
- wsl -d nixos

Customize your system with(runs emacs command temporarily just to edit the
config file, it does not install emacs(that we specify in nixos config files):

#+begin_src bash
  # Make system customizations
  sudo nix run nixpkgs#emacs /etc/nixos/system.nix
  # Make user
  sudo nix run nixpkgs#emacs /etc/nixos/home.nix
#+end_src

** Clone your own customization to NixOS

rm -rf /etc/nixos
git clone https://github.sebank.se/s2753g/nixos.gi into /etc

if asks, do this:

git config --global --add safe.directory /etc/nixos

then this:

sudo git checkout -b master

** Generate a GPG key

*** preparation

we need gpg key for further configs. Curerntly we can not generate the
gpg key since it is not installed on nix by default.

make config to look like this to be able to generate gpg key:

flake.nix:

#+begin_src bash
{
  description = "A SEBNix WSL configuration";

  inputs = {
    sebnix.url = "git+https://github.sebank.se/sebnix/sebnix.git";
    nixpkgs.follows = "sebnix/nixpkgs";
  };

  outputs = inputs: {
    nixosConfigurations.wsl = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        inputs.sebnix.nixosModules.seb
        ./system.nix
      ];
    };
  };
}
#+end_src

system.nix:

#+begin_src bash
{
  networking.hostName = "wsl";

  seb = {
    sid = "s2753g";
    name = "Arvydas Gasparavicius";

    home = ./home.nix;
    wsl.enable = true;
  };

  wsl = {
    tarball.configPath = ./.;
    usbip.enable = true;
  };

  system.stateVersion = "23.05";
}
#+end_src


home.nix:

#+begin_src bash
  {pkgs, ...}: {
      programs.gpg.enable = true;
      services.gpg-agent.enable = true;

    home.packages = [
      pkgs.direnv
      pkgs.ghq
    ];

    home.stateVersion = "23.05";
  }
#+end_src


check if wsl-vpnkit-auto works

#+begin_src bash
  sudo systemctl status wsl-vpnkit-auto
  sudo systemctl restart wsl-vpnkit-auto
#+end_src

Apply configuration
sudo nixos-rebuild switch

after rebuild shutdown wsl:
wsl --shutdown

start wsl again and enter it
wsl -d nixos

now you should see your own username, you are logged in as it

*** generating the key

try to run generate gpg key by following:
https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key

gpg --full-generate-key

enter enter enter everything

follow the instructions further and use the key, which in this case is ~7D1XXXF66CXXXEC43~.

** Running Eamcs in NixOS

Currently experiencing the glitching bug, but can run emacs this way after installing it with:

sudo nix run nixpkgs#emacs29-pgtk
and then run it:
sudo , emacs -nw (you can run any application like that without installing)

To install the application yo need to add it to home.nix:

{pkgs, ...}: {
  programs.gpg.enable = true;
  services.gpg-agent.enable = true;

  home.packages = [
    pkgs.direnv
    pkgs.ghq
    pkgs.vim # new
    pkgs.tmux # new
    pkgs.emacs29 # new
  ];

  home.stateVersion = "23.05";
}

then run `sudo nixos-rebuild switch` to install the packages. (hopefully youll have vpnkit active to fetch the things)

can now run vim, emacs, tmux usually like you would. Sadly emacs still has gliches and can run it only wiht emacs -nw

** GIT authentication

```
