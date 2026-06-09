	.syntax unified
	.set sub_8000CD8, 0x08000CD8 + 1
	.section .text.sub_8038334, "ax", %progbits
@ sub_8038334 @ JP 0x08038334 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038334
	.thumb_func
sub_8038334:
	push {lr}
	bl sub_8000CD8
	ldr r1, _08038344 @ =0x020038C4
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08038344: .4byte 0x020038C4

