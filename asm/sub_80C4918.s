	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C4918, "ax", %progbits
@ sub_80C4918 @ JP 0x080C4918 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4918
	.thumb_func
sub_80C4918:
	push {lr}
	ldr r0, _080C492C @ =0x08AC1F54
	bl Proc_Find
	cmp r0, #0
	beq _080C4926
	movs r0, #1
_080C4926:
	pop {r1}
	bx r1
	.align 2, 0
_080C492C: .4byte 0x08AC1F54

