format  ELF64		; specify the format of 64-bit system 
public _start           ; declare certain procedure, like an entry point


replace equ 0xA
msg db "Hello World!", replace, 0    ; msg - variable db - data bytes, we should put 0 for strings
len = $-msg
_start:
        mov rax, 4    ; 4 - write
	mov rbx, 1    ; 1 - stdout
	mov rcx, msg
	mov rdx, len
	int 0x80
	call exit

exit:
	mov	rax, 1    ; 1 - exit
	mov	rbx, 0    ; 0 - return 
	int 0x80




