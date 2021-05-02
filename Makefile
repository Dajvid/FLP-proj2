all:
	swipl -q -g main -o flp20-log -c src/RubikMain.pl

scramble:
	swipl -q -g main -o scramble -c cubes/RubikScramble.pl

clean:
	rm -f flp20-log scramble flp-log-xsedla1d.zip

zip: clean
	zip flp-log-xsedla1d.zip Makefile src/ cubes/ README.md
