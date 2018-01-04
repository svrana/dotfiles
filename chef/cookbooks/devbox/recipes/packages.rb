apt_repository 'neovim' do
  uri 'ppa:neovim-ppa/stable'
end

apt_repository 'rvm' do
  uri 'ppa:rael-gc/rvm'
  distribution node['lsb']['codename']
end

apt_repository 'zeal' do
  uri 'ppa:zeal-developers/ppa'
end

apt_repository 'spotify' do
  uri 'http://repository.spotify.com'
  components ['stable', 'non-free']
  distribution ''
end

apt_repository 'insync' do
  uri 'http://apt.insynchq.com/ubuntu'
  components ['non-free', 'contrib']
  distribution node['lsb']['codename']
end

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
  neovim
  libpq-dev
  laptop-mode-tools
  rvm
  spotify-client
  zeal
  insync
  firefox
  virtualenv
  cmake
  libfreetype6-dev
  libfontconfig1-dev
)
