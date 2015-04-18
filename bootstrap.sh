for f in bashrc pythonrc.py tmux.conf gitconfig local.bash; do
  cp $f ${HOME}/.$f
done

source ${HOME}/.bashrc
