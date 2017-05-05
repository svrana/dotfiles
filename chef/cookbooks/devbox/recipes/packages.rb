#apt_repository 'neovim' do
#  uri 'https://launchpad.net/~neovim-ppa/stable/ubuntu'
#  distribution node['lsb']['codename']
#  components ['main']
#end

package %w(
  build-essential
  python-pip
  python-dev
  git
  tmux
  xclip
  openvpn
  exuberant-ctags
  silversearcher-ag
  curl
)
