	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_807AB44, "ax", %progbits
@ sub_807AB44 @ JP 0x0807AB44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AB44
	.thumb_func
sub_807AB44:
	push {lr}
	ldr r0, _0807AB58 @ =0x08A132D0
	bl Proc_Find
	cmp r0, #0
	beq _0807AB52
	movs r0, #1
_0807AB52:
	pop {r1}
	bx r1
	.align 2, 0
_0807AB58: .4byte 0x08A132D0

