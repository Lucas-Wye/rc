for file in `ls sys/`; do
	mv ~/.$file sys/$file.bak
	mv sys/$file ~/.$file
	mv sys/$file.bak sys/$file
done

# Rime Config For Linux
#cp rime/double_pinyin_flypy.* ~/.config/ibus/rime
#cp rime/ibus_rime.yaml rime/default.* ~/.config/ibus/rime
