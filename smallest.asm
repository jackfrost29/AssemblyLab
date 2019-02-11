section	.text
global _start ;must be declared for using gcc

_start:	;tell linker entry point
mov ecx, [num1]
cmp ecx, [num2]
jg check_third_num_lr
mov ecx, [num2]

check_third_num_lr:

cmp ecx, [num3]
jg _print
mov ecx, [num3]

_print:

mov [largest], ecx
mov ecx,msg1
mov edx, len1
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel

mov ecx,largest
mov edx, 2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel



mov ecx, [num1]
cmp ecx, [num2]
jl check_third_num_sm
mov ecx, [num2]

check_third_num_sm:

cmp ecx, [num3]
jl _exit
mov ecx, [num3]

_exit:

mov [smallest], ecx
mov ecx,msg2
mov edx, len2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel

mov ecx, smallest
mov edx, 2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel


mov ecx, newline
mov edx, 2
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel


mov eax, 1
int 80h

section	.data

newline db 0xa
msg1 db "The largest digit is: "
len1 equ $- msg1
msg2 db  0xA, "The smallest digit is: "
len2 equ $- msg2
num1 dd '64'
num2 dd '74'
num3 dd '84'

segment .bss
largest resb 0
smallest resb 0
