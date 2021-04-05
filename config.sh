for file in `ls sys/`; do
	mv ~/.$file sys/$file.bak
	mv sys/$file ~/.$file
	mv sys/$file.bak sys/$file
done	
