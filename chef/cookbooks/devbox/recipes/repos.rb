username = ENV['USER']
home = ENV['HOME']
bin_dir = ENV['BIN_DIR']
config_dir = ENV['CONFIG_DIR']
rc_dir = ENV['RC_DIR']

REPO_DIR = "#{home}/repos"

git "#{home}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
  user username.to_s
end

git "#{home}/.vim/bundle/Vundle.vim" do
  repository 'https://github.com/VundleVim/Vundle.vim.git'
  user username.to_s
end

git "#{REPO_DIR}/gruf" do
  repository 'git://github.com/svrana/gruf.git'
  user username.to_s
end

git "#{REPO_DIR}/solarize" do
  repository 'https://github.com/gmodarelli/solarize.git'
  user username.to_s
end

bash 'link-fzf' do
  code <<-EOH
  ln -sf #{REPO_DIR}/fzf/bin/fzf #{bin_dir}/fzf
  ln -sf #{REPO_DIR}/fzf/bin/fzf-tmux #{bin_dir}/fzf-tmux
  mkdir -p #{home}/.config/fzf
  ln -sf #{rc_dir}/fzf.bash  #{home}/.config/fzf/fzf.bash
  EOH
  #not_if { ::File.exist?("#{bin_dir}/fzf") }
  action :nothing
end

git "#{REPO_DIR}/fzf" do
  repository 'https://github.com/junegunn/fzf.git'
  depth 1
  user username.to_s
  notifies :run, 'bash[link-fzf]', :immediately
end

git "#{REPO_DIR}/fonts" do
  repository 'https://github.com/powerline/fonts'
  user username.to_s
end
