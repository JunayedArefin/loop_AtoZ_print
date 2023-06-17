.model small
.stack 100h
.data
a db 'input 3 numbers : $'
b db 'smallest number : $'
.code

main proc
	mov ax,@data
	mov ds,ax

	mov ah,9
	lea dx,a
	int 21h	
	mov ah,1
	int 21h
	mov bl,al
	int 21h
	mov bh,al
	int 21h
	mov cl,al

	smallest:
	cmp bh,bl
	jg level1
	jmp level2

	level2:
	mov ah,9
	lea dx,b
	int 21h

	mov ah,2
	mov dl,bh
	int 21h
	jmp exit

	level1:
	mov ah,9
	lea dx,b
	int 21h
	mov ah,2
	mov dl,bl
	int 21h
	jmp exit
	exit:
	mov ah,4ch
	int 21h
	main endp
end main
