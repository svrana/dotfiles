npm_package 'neovim'
npm_package 'diff-so-fancy'
npm_package 'eslint'
npm_package 'tern'

gem_package 'neovim'

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
  fonts-powerline
  python-pip
  python-dev
  python3-dev
  python3-pip
  git
  tmux
  xclip
  openvpn
  openjdk-8-jdk
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
  ruby-dev
  neovim
  libpq-dev
  rvm
  spotify-client
  zeal
  insync
  firefox
  virtualenv
  cmake
  libfreetype6-dev
  libfontconfig1-dev
  pandoc
)

# custom .desktop files for electron apps that require scaling on hidpi settings

template '/usr/share/applications/spotify.desktop' do
  source 'spotify.desktop.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/home/shaw/.local/share/applications/appimagekit-joplin.desktop' do
  source 'appimagekit-joplin.desktop.erb'
  owner 'shaw'
  group 'shaw'
  mode '0644'
end
