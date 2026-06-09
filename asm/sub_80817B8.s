	.syntax unified
	.set StartBgmVolumeChange, 0x08002680 + 1
	.section .text.sub_80817B8, "ax", %progbits
@ sub_80817B8 @ JP 0x080817B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80817B8
	.thumb_func
sub_80817B8:
	push {lr}
	adds r3, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

