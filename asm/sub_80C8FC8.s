	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C8FC8, "ax", %progbits
@ sub_80C8FC8 @ JP 0x080C8FC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8FC8
	.thumb_func
sub_80C8FC8:
	push {lr}
	ldr r0, _080C8FDC @ =0x08B3B3D4
	bl Proc_Find
	cmp r0, #0
	beq _080C8FD6
	movs r0, #1
_080C8FD6:
	pop {r1}
	bx r1
	.align 2, 0
_080C8FDC: .4byte 0x08B3B3D4

