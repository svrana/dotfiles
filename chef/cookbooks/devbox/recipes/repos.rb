username = ENV['USER']
home = ENV['HOME']

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

git "#{REPO_DIR}/fzf" do
  repository 'https://github.com/junegunn/fzf.git'
  depth 1
  user username.to_s
end

git "#{REPO_DIR}/fonts" do
  repository 'https://github.com/powerline/fonts'
  user username.to_s
end
