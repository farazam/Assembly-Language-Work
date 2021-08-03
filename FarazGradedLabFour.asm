[org 0x0100]

jmp start
num:dw 0xF37E
pos: db 5

start:
mov dx,0x1
mov cl,[pos]
sub cl,1
cmp cl,0
je extra


mov cl,[pos]
mov ax,[num]

l1:
shl dx,1
dec cl
jnz l1


jmp invert
	
invert:

xor ax,dx
mov [num],ax
jmp exit


extra:
mov ax,[num]
mov cl,[pos]
jmp invert

exit:	
mov ax,0x4c00
int 0x21