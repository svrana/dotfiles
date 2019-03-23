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
  # curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  # key 'https://dl.yarnpkg.com/debian/pubkey.gpg'
  components %w(stable main)
  distribution ''
end

# custom .desktop files for electron apps that require scaling on hidpi settings
template '/usr/share/applications/spotify.desktop' do
  source 'spotify.desktop.erb'
  owner 'root'
  group 'root'
  mode '0644'
end
