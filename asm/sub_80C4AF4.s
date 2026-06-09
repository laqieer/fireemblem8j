	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80C4AF4, "ax", %progbits
@ sub_80C4AF4 @ JP 0x080C4AF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4AF4
	.thumb_func
sub_80C4AF4:
	push {lr}
	ldr r0, _080C4B08 @ =0x08AC1FA4
	bl Proc_Find
	cmp r0, #0
	beq _080C4B02
	movs r0, #1
_080C4B02:
	pop {r1}
	bx r1
	.align 2, 0
_080C4B08: .4byte 0x08AC1FA4

