from pathlib import Path
import platform


def link(src, dest):
    if dest.exists():
        print(f"Skipping existing: {dest}")
        return
    dest.parent.mkdir(parents=True, exist_ok=True)
    print(f"Linking: {src} -> {dest}")
    dest.symlink_to(src)


def link_configs(src_dir, dest_dir):
    if src_dir.exists():
        for item in src_dir.iterdir():
            if item.is_dir():
                link(item, dest_dir / item.name)


def link_dotfiles(src_dir, home):
    if src_dir.exists():
        for item in src_dir.iterdir():
            link(item, home / f".{item.name}")


def setup_bash_env(bash_env, shell_file, home):
    if bash_env.exists():
        ln_bash_env = home / ".bash.env"
        link(bash_env, ln_bash_env)
        source_line = f"source {ln_bash_env}"
        if shell_file.exists():
            with open(shell_file, "r+") as f:
                if source_line not in f.read():
                    print(f"Adding source to {shell_file}")
                    f.write(f"\n{source_line}\n")
        else:
            print(f"{shell_file} no found!")


def create_symlinks(linux_desktop=False):
    home = Path.home()
    current_dir = Path.cwd()
    os_name = platform.system()
    desktop_config = current_dir / "desktop" / "config"

    if os_name == "Windows":
        link(current_dir / "config" / "helix", home / "AppData" / "Roaming" / "helix")
        link(current_dir / "rime", home / "AppData" / "Roaming" / "Rime")
        link(current_dir / "dotfiles" / "gitconfig", home / ".gitconfig")
        link(
            current_dir / "desktop" / "config" / "alacritty",
            home / "AppData" / "Roaming" / "alacritty",
        )

    elif os_name == "Linux":
        link_configs(current_dir / "config", home / ".config")
        link_dotfiles(current_dir / "dotfiles", home)
        setup_bash_env(current_dir / "bash.env", home / ".bashrc", home)
        if linux_desktop:
            link_configs(desktop_config, home / ".config")
            link(current_dir / "rime", home / ".local" / "share" / "fcitx5" / "rime")

    elif os_name == "Darwin":
        link_configs(current_dir / "config", home / ".config")
        link_dotfiles(current_dir / "dotfiles", home)
        link(
            current_dir / "desktop" / "config" / "alacritty",
            home / ".config" / "alacritty",
        )
        setup_bash_env(current_dir / "bash.env", home / ".bash_profile", home)

    else:
        print(f"Unsupported OS: {os_name}")
        return


if __name__ == "__main__":
    create_symlinks()
    print("Setup completed!")
