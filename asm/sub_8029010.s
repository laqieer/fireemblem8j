	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8029010, "ax", %progbits
@ sub_8029010 @ JP 0x08029010 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029010
	.thumb_func
sub_8029010:
	push {lr}
	bl sub_80D65C0
	bl GetSelectTargetCount
	cmp r0, #0
	beq _08029020
	movs r0, #1
_08029020:
	pop {r1}
	bx r1

