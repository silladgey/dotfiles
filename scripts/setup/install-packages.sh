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

# Download Brave browser
# https://brave.com/linux/
curl -fsS https://dl.brave.com/install.sh | sh

tools=(
  alacritty
  btop
  htop
  fastfetch
  git
  tmux
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

# Setup PostgreSQL database
# https://docs.fedoraproject.org/en-US/quick-docs/postgresql/
sudo systemctl enable postgresql
sudo postgresql-setup --initdb --unit postgresql
