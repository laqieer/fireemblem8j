	.syntax unified
	.set EndPrepScreenSpriteDraw, 0x08098F04 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_80993F0, 0x080993F0 + 1
	.set sub_8099594, 0x08099594 + 1
	.set sub_80B1D74, 0x080B1D74 + 1
	.section .text.sub_8097F0C, "ax", %progbits
@ sub_8097F0C @ JP 0x08097F0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097F0C
	.thumb_func
sub_8097F0C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80B1D74
	bl EndPrepScreenSpriteDraw
	bl sub_8097D18
	bl sub_80993F0
	adds r4, #0x2d
	strb r0, [r4]
	bl sub_8099594
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

