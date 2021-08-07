# Basic shell

Basic shell with job control. Summary explanation of the shell [here](https://onestepcode.com/writing-basic-shell/).

Core read-eval loop taken from [CS:APP](http://csapp.cs.cmu.edu/). Helper wrapper functions taken from [`csapp.c`](http://csapp.cs.cmu.edu/3e/ics3/code/src/csapp.c]).

## Functionalities

This shell runs executables in the current working directory or in the specified path.

It can run one process in the foreground and several in the background. The foreground job can be terminated or stopped by typing _Ctrl+C_ or _Ctrl+Z_, respectively.

Built-in commands: `fg`, `bg`, `jobs`, and `quit`.

`fg` and `bg` accept either the process ID of a running job or the job ID preceded by `%` as a parameter.

```
> bg %1      // Resume job with JID=1 on the background
> bg 14501   // Resume job with PID=14501 on the background
```

## Compilation

Either run `make` or compile as:

```
gcc -o shell -Wall main.c signals.c jobs.c wrappers.c
```

## Example session

`wait` and `write` are dummy executables that run in an infinite loop. The `^C` and `^Z` characters below are the result of typing _Ctrl+C_ and _Ctrl+Z_.

```
> ls
ls: Command not found.
> /bin/ls
jobs.c	 jobs.h   main.c   Makefile   README.md  signals.c   signals.h	wrappers.c   wrappers.h   write
jobs.c~  jobs.h~  main.c~  Makefile~  shell	 signals.c~  wait	wrappers.c~  wrappers.h~
> wait &
[1] 17715			wait &
> wait 
^Z
Job [2] 17716 stopped by signal: Stopped
> fg %2
^C
Job [2] 17716 terminated by signal: Interrupt
> write
1...
1...
1...
1...
^C
Job [2] 17718 terminated by signal: Interrupt
> wait &
[2] 17719			wait &
> jobs
[1] 17715 Running		wait  &
[2] 17719 Running		wait  &
> quit 
```
