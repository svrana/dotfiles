#apt_repository 'neovim' do
#  uri 'https://launchpad.net/~neovim-ppa/stable/ubuntu'
#  distribution node['lsb']['codename']
#  components ['main']
#end

package %w(
  build-essential
  python-pip
  python-dev
  python3-dev
  python3-pip
  git
  tmux
  xclip
  openvpn
  exuberant-ctags
  silversearcher-ag
  curl
  libcurl4-openssl-dev
  libcap-dev
  libxml2-dev
  libxslt-dev
  libldap2-dev
  libidn11-dev
  librtmp-dev
  libkrb5-dev
  python-m2crypto
  libsasl2-dev
  libssl-dev
  swig
  network-manager-openvpn
  network-manager-openvpn-gnome
  shellcheck
  ruby
)
