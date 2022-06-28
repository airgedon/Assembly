format  ELF64 
public _start           ;declare certain procedure, like an entry point

_start:
	call exit

exit:
	mov	rax, 1 ; 1 - exit
	mov	rbx, 0 ; 0 - return 
	int 0x80




