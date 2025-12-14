#!/usr/bin/env python3

import os
import os.path
from pathlib import Path

def create_symlinks():
    home = Path.home()
    current_dir = Path.cwd()
    
    # Link config directories
    config_src = current_dir / "config"
    config_dest = home / ".config"
    
    if config_src.exists():
        config_dest.mkdir(exist_ok=True)
        for item in config_src.iterdir():
            dest = config_dest / item.name
            if dest.exists():
                print(f"Skipping existing: {dest}")
                continue
            print(f"Linking: {item} -> {dest}")
            dest.symlink_to(item)

    # Link dotfiles
    dotfiles_src = current_dir / "dotfiles"
    
    if dotfiles_src.exists():
        for item in dotfiles_src.iterdir():
            dest = home / f".{item.name}"
            if dest.exists():
                print(f"Skipping existing: {dest}")
                continue
            print(f"Linking: {item} -> {dest}")
            dest.symlink_to(item)

    # Add bash.env to shell config
    bash_env = current_dir / "bash.env"
    zshrc = home / ".zshrc"
    
    if bash_env.exists():
        # For NixOS
        bash_env_link = home / ".bash.env"
        if not bash_env_link.exists():
            print(f"Linking: {bash_env} -> {bash_env_link}")
            bash_env_link.symlink_to(bash_env)
        
        # Add to zshrc
        source_line = f"source {bash_env}"
        if zshrc.exists():
            with open(zshrc, 'r+') as f:
                if source_line not in f.read():
                    print(f"Adding source to {zshrc}")
                    f.write(f"\n{source_line}\n")
        else:
            print(f"Creating {zshrc} with source line")
            with open(zshrc, 'w') as f:
                f.write(f"{source_line}\n")

if __name__ == "__main__":
    create_symlinks()
    print("Setup completed!")
