struc agenda
     .name   resb 10
     .number resb 10
     .type   resb 10
endstruc


struc   mystruct
	a:	resw	1
	b:	resd	1
	c:	resb	1
	d:	resd	1
	e:	resb	6
endstruc

section .bss

myagenda: resb agenda_size

section .text
    mov eax, myagenda + agenda.name
