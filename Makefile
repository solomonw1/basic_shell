all:
	gcc -o shell -Wall main.c signals.c jobs.c wrappers.c
clean:
	rm shell
