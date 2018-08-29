# rbenv installation

## clone

    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    git clone git://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems


## zsh

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc.site
    echo 'eval "$(rbenv init -)"' >> ~/.zshrc.site


## bash

    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc.site
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc.site
