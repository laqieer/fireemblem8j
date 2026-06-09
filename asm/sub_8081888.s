	.syntax unified
	.set StartBgmVolumeChange, 0x08002680 + 1
	.section .text.sub_8081888, "ax", %progbits
@ sub_8081888 @ JP 0x08081888 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8081888
	.thumb_func
sub_8081888:
	push {lr}
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x80
	movs r2, #0x10
	bl StartBgmVolumeChange
	pop {r0}
	bx r0

