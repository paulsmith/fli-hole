Pi-hole on Fly.io served via Tailscale
======================================

How to do it:

  1. [Get set up with Fly.io](https://fly.io/docs/speedrun/) (only install `flyctl` and create an account/login)
  1. [Get set up with Tailscale](https://tailscale.com/kb/1017/install/)
  1. Clone this repo
  1. Run the command `fly launch --name $APP_NAME --no-deploy` and answer the prompts (pick your own $APP_NAME)
  1. [Create an auth key in Tailscale](https://tailscale.com/kb/1085/auth-keys/) and copy it to clipboard
  1. Run the command `fly secrets set TAILSCALE_AUTHKEY=<paste auth key here>`
  1. Run the command `fly deploy --remote-only`
  1. Test it out with `dig @${APP_NAME}.fly.dev google.com`
  1. If $STEP-1 worked, get the IP address of the Tailscale interface (from the [Tailscale admin](https://login.tailscale.com/admin/machines)) and set that as your DNS resolver (in `/etc/resolv.conf`, Advanced tab of macOS's Networking panel in System Preferences, iOS, etc.)
  

Reading/Reference:

  * [Pi-Hole Docker image](https://github.com/pi-hole/docker-pi-hole)
  * [Stuff Your Pi-Hole From Anywhere (Fly.io blog)](https://fly.io/blog/stuff-your-pi-hole-from-anywhere/)
  * [Free, private pi-hole hosting with Fly.io and Tailscale](https://arun.be/2021/11/22/private-pi-hole-hosting-fly-tailscale/)
  * [Tailscale on fly.io (Tailscale docs)](https://tailscale.com/kb/1132/flydotio/)
  * [Need to use legacy iptables when adding Tailscale to Linux (GitHub issue comment)](https://github.com/hassio-addons/addon-tailscale/issues/20#issuecomment-929104783)
  * [Trying to follow the "Fly-Hole" tutorial... (Fly.io forum post)](https://community.fly.io/t/trying-to-follow-the-fly-hole-tutorial/3470)
  * [Self-hosted RethinkDNS (Pi-Hole alternative)](https://github.com/serverless-dns/serverless-dns/)
