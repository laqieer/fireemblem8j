	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_807AAE0, 0x0807AAE0 + 1
	.section .text.sub_807AB0C, "ax", %progbits
@ sub_807AB0C @ JP 0x0807AB0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AB0C
	.thumb_func
sub_807AB0C:
	push {lr}
	ldr r0, _0807AB20 @ =0x08A132D0
	bl Proc_Find
	cmp r0, #0
	beq _0807AB1C
	bl sub_807AAE0
_0807AB1C:
	pop {r0}
	bx r0
	.align 2, 0
_0807AB20: .4byte 0x08A132D0

