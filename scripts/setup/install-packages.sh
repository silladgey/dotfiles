# Upgrade packages and refresh metadata cache
sudo dnf upgrade --refresh -y

# Add RPM repositories
# https://librewolf.net/installation/fedora/
curl -fsSL https://repo.librewolf.net/librewolf.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
# https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo

tools=(
  alacritty
  btop
  htop
  fastfetch
  git
  perl-Image-ExifTool
  tmux
  zsh
)

dev_env=(
  code  # or code-insiders
  nodejs
  postgresql-server
  postgresql-contrib
)

plugins=(
  dnf5-plugins
  kvantum
  librewolf
)

packages=("${tools[@]}" "${dev_env[@]}" "${plugins[@]}")

# Install new packages
sudo dnf install -y "${packages[@]}"

# Install GitHub CLI from gh-cli RPM repo
sudo dnf install -y gh --repo gh-cli

# Install flatpak packages
flatpak install flathub -y com.getpostman.Postman

# Setup PostgreSQL database
# https://docs.fedoraproject.org/en-US/quick-docs/postgresql/
sudo systemctl enable postgresql
sudo postgresql-setup --initdb --unit postgresql

# Download Brave browser
# https://brave.com/linux/
curl -fsS https://dl.brave.com/install.sh | sh

# Change shell to zsh
# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#fedora
command -v zsh >/dev/null 2>&1 && chsh -s "$(command -v zsh)" && echo "Shell changed to zsh." || echo "zsh not found."

# Download Oh My Zsh
# https://ohmyz.sh/#install
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
