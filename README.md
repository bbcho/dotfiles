# Devcontainer + Neovim Setup Guide

## Overview
Set up the devcontainer CLI with user-level dotfiles so your Neovim config is automatically available in any devcontainer - without modifying shared project files.

---

## Step 1: Install the Devcontainer CLI

```bash
npm install -g @devcontainers/cli
```

Verify installation:
```bash
devcontainer --version
```

---

## Step 2: Create Your Dotfiles Repository

### 2.1 Clone and set up locally

```bash
cd ~
git clone https://github.com/bbcho/dotfiles.git
cd dotfiles
```

### 2.2 Create the directory structure

```bash
mkdir -p .config
```

### 2.3 Copy your Neovim config

```bash
cp -r ~/.config/nvim .config/nvim
```

### 2.4 Create the install script

Create `install.sh` in the dotfiles root:

```bash
#!/bin/bash
set -e

echo "==> Installing Neovim..."
if ! command -v nvim &> /dev/null; then
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo tar -xzf nvim-linux64.tar.gz -C /opt
    sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
    rm nvim-linux64.tar.gz
fi

echo "==> Installing dependencies..."
# ripgrep (for telescope grep)
if ! command -v rg &> /dev/null; then
    sudo apt-get update && sudo apt-get install -y ripgrep fd-find
fi

echo "==> Linking config..."
mkdir -p ~/.config
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

echo "==> Done! Run 'nvim' to start."
```

### 2.5 Make it executable and push

```bash
chmod +x install.sh
git add .
git commit -m "Initial dotfiles with neovim config"
git push
```

---

## Step 3: Usage - Working with Devcontainers

### 3.1 Navigate to the module with a devcontainer

```bash
cd ~/monorepo/module-with-devcontainer
```

### 3.2 Start the devcontainer

```bash
devcontainer up --workspace-folder . \
  --dotfiles-repository "https://github.com/bbcho/dotfiles.git" \
  --dotfiles-target-path "~/dotfiles" \
  --dotfiles-install-command "~/dotfiles/install.sh"
```

This will:
- Build/pull the container image
- Clone your dotfiles repo into the container
- Run your `install.sh` script

### 3.3 Open Neovim in the container

```bash
devcontainer exec --workspace-folder . nvim
```

Or get a shell first:
```bash
devcontainer exec --workspace-folder . bash
# then run nvim inside
```

### 3.4 Stop the container when done

```bash
# Find container ID
docker ps

# Stop it
docker stop <container_id>
```

---

## Step 4: Create Shell Aliases (Optional)

Add to your `~/.bashrc` or `~/.zshrc`:

```bash
# Devcontainer shortcuts
alias dcu='devcontainer up --workspace-folder . \
  --dotfiles-repository "https://github.com/bbcho/dotfiles.git" \
  --dotfiles-target-path "~/dotfiles" \
  --dotfiles-install-command "~/dotfiles/install.sh"'
alias dcx="devcontainer exec --workspace-folder ."
alias dcn="devcontainer exec --workspace-folder . nvim"
alias dcs="devcontainer exec --workspace-folder . bash"
```

Then:
```bash
cd ~/monorepo/some-module
dcu   # start container with dotfiles
dcn   # open neovim
```

---

## Troubleshooting

### "nvim: command not found"
Your install.sh didn't run or failed. Check:
```bash
devcontainer exec --workspace-folder . cat ~/dotfiles/install.sh
devcontainer exec --workspace-folder . bash ~/dotfiles/install.sh
```

### Plugins not loading
Lazy.nvim needs to bootstrap. First run may take a moment:
```bash
devcontainer exec --workspace-folder . nvim --headless "+Lazy! sync" +qa
```

### Permission denied on install.sh
Ensure execute permission in the repo:
```bash
cd ~/dotfiles
chmod +x install.sh
git add install.sh
git commit -m "Fix permissions"
git push
```

### Private repo not cloning
For private repos, either use a GitHub personal access token with HTTPS:
```bash
--dotfiles-repository "https://<TOKEN>@github.com/bbcho/dotfiles.git"
```

Or switch to SSH URL with agent forwarding:
```bash
--dotfiles-repository "git@github.com:bbcho/dotfiles.git"

# Ensure SSH agent is running on host before devcontainer up
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

---

## Final Checklist

- [ ] devcontainer CLI installed (`devcontainer --version`)
- [ ] Dotfiles repo cloned locally (`~/dotfiles`)
- [ ] Neovim config copied to `dotfiles/.config/nvim/`
- [ ] `install.sh` created and executable
- [ ] Dotfiles pushed to GitHub
- [ ] Test with `devcontainer up --dotfiles-repository ...` + `devcontainer exec ... nvim`
