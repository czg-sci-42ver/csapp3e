import re
def verify_magnet_link(magnet_link):
    pattern=re.compile(r"magnet:\?xt=urn:[a-z0-9]+:[a-zA-Z0-9]{32}")
    result = pattern.match(magnet_link)
    if result != None:
        print("Magnet link is valid!")
    else:
        print("Magnet link is invalid.")


#magnet_link = 'magnet:?xt=urn:btih:FRVWQWGWDWUVIPKCGGTR3NFRZETEWBUF&dn=ubuntu-22.04-desktop-amd64.iso&xl=3654957056&tr.1=https%3A%2F%2Ftorrent.ubuntu.com%2Fannounce&tr.2=https%3A%2F%2Ftorrent.ubuntu.com%2Fannounce&tr.3=https%3A%2F%2Fipv6.torrent.ubuntu.com%2Fannounce'
#magnet_link = 'magnet:?xt=urn:tree:tiger:56KTM3HYHAMXY23GJTKWNXEYMTFIAKUZ4GECKEI&xl=37713106&dn=33dc73067d7512a7d970cec5fe8870db.pdf'
magnet_link = 'magnet:?xt=urn:sha1:RVHCJJFVELQSVYN5XD6K3PZV44MKIUW4&xl=37713106&dn=33dc73067d7512a7d970cec5fe8870db.pdf'

# Specify an output dir
output_dir = "/home/name"

verify_magnet_link(magnet_link)
