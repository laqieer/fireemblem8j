	.syntax unified
	.set sub_804F5D4, 0x0804F5D4 + 1
	.section .text.sub_8099228, "ax", %progbits
@ sub_8099228 @ JP 0x08099228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8099228
	.thumb_func
sub_8099228:
	push {lr}
	adds r2, r0, #0
	movs r1, #0x34
	ldrsh r0, [r2, r1]
	adds r0, #1
	lsls r0, r0, #3
	adds r0, #4
	movs r3, #0x36
	ldrsh r1, [r2, r3]
	adds r1, #1
	lsls r1, r1, #3
	adds r2, #0x2a
	ldrb r2, [r2]
	lsls r2, r2, #4
	adds r1, r1, r2
	bl sub_804F5D4
	pop {r0}
	bx r0
	.align 2, 0

