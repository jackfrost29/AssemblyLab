section	.text
global _start 		;must be declared for using gcc

_start:				;tell linker entry point
mov eax, [num1]
mov ebx, [num2]
cmp eax, ebx
jl _first
mov [num1], ebx		; first swap
mov [num2], eax



_first:
mov eax, [num2]
mov ebx, [num3]
cmp eax, ebx
jl _second
mov [num2], ebx		; second swap
mov [num3], eax



_second:
mov eax, [num1]
mov ebx, [num2]
jl _exit
mov [num1], ebx		; second swap
mov [num2], eax

_exit:

mov ecx, num1
mov edx, 2
mov ebx,1			;file descriptor (stdout)
mov eax,4			;system call number (sys_write)
int 0x80			;call kernel

mov ecx, newLine
mov edx, 1
mov ebx,1			;file descriptor (stdout)
mov eax,4			;system call number (sys_write)
int 0x80			;call kernel

mov ecx, num2
mov edx, 2
mov ebx,1			;file descriptor (stdout)
mov eax,4			;system call number (sys_write)
int 0x80			;call kernel

mov ecx, newLine
mov edx, 1
mov ebx,1			;file descriptor (stdout)
mov eax,4			;system call number (sys_write)
int 0x80			;call kernel

mov ecx, num3
mov edx, 2
mov ebx,1			;file descriptor (stdout)
mov eax,4			;system call number (sys_write)
int 0x80			;call kernel

mov ecx, newLine
mov edx, 1
mov ebx,1	;file descriptor (stdout)
mov eax,4	;system call number (sys_write)
int 0x80	;call kernel

mov eax, 1
int 80h

section	.data

newLine db 0xA
num1 dd '4'
num2 dd '5'
num3 dd '2'

segment .bss
largest resb 0
