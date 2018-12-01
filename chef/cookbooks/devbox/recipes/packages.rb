npm_package 'neovim'
npm_package 'diff-so-fancy'
npm_package 'eslint'
npm_package 'tern'
npm_package 'n'

gem_package 'neovim'

apt_repository 'neovim' do
  uri 'ppa:neovim-ppa/stable'
end

apt_repository 'rvm' do
  uri 'ppa:rael-gc/rvm'
  distribution node['lsb']['codename']
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

apt_repository 'yarn' do
  uri 'https://dl.yarnpkg.com/debian'
  key 'https://dl.yarnpkg.com/debian/pubkey.gpg'
  components %w(stable main)
  distribution ''
end

# apt_repository 'salt' do
#   uri 'http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest'
#   key 'https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub'
#   distribution node['lsb']['codename']
#   components ['main']
# end

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
  libpq-dev
  rvm
  spotify-client
  zeal
  insync
  firefox
  virtualenv
  cmake
  flex
  libelf-dev
  libfreetype6-dev
  libfontconfig1-dev
  pandoc
  entr
  weechat
  yarn
)

# custom .desktop files for electron apps that require scaling on hidpi settings

template '/usr/share/applications/spotify.desktop' do
  source 'spotify.desktop.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
