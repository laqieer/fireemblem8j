	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8034204, "ax", %progbits
@ sub_8034204 @ JP 0x08034204 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034204
	.thumb_func
sub_8034204:
	push {lr}
	ldr r0, _08034218 @ =0x085C609C
	bl Proc_Find
	cmp r0, #0
	beq _08034212
	movs r0, #1
_08034212:
	pop {r1}
	bx r1
	.align 2, 0
_08034218: .4byte 0x085C609C

