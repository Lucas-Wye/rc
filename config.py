#! /usr/bin/env python3
import os
import sys
import shutil


def get_all_files(directory):
    file_list = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            file_list.append(os.path.join(root, file))
    return file_list


def config_file(file, base_file, extra=""):
    home_dir = os.path.join(os.path.expanduser("~"), extra)
    my_file = file
    bak_file = os.path.join(file + ".bak")
    sys_file = os.path.join(home_dir, base_file)

    shutil.copy2(sys_file, bak_file)
    shutil.move(my_file, sys_file)
    shutil.move(bak_file, my_file)

    print(my_file, bak_file, sys_file, "\n")


# ------------------------------------------------------------------------------
SYS_DIR = "sys"


def sys_config():
    for file in get_all_files(SYS_DIR):
        config_file(file, os.path.basename(file))


# ------------------------------------------------------------------------------
NV_DIR = "nvim"


def nvim_config():
    for file in get_all_files(NV_DIR):
        config_file(file, file, extra=".config")


# ------------------------------------------------------------------------------
if __name__ == "__main__":
    argc = len(sys.argv)
    if argc != 2:
        print("{} sys/nvim".format(sys.argv[0]))
        exit(1)
    argv = sys.argv[1]
    if argv == "sys":
        sys_config()
    elif argv == "nvim":
        nvim_config()
