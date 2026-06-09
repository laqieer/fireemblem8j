	.syntax unified
	.set SetTalkFlag, 0x080069AC + 1
	.set SetTalkPrintDelay, 0x080069F4 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80067B0, 0x080067B0 + 1
	.set sub_8006934, 0x08006934 + 1
	.set sub_8006980, 0x08006980 + 1
	.section .text.sub_80C8458, "ax", %progbits
@ sub_80C8458 @ JP 0x080C8458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8458
	.thumb_func
sub_80C8458:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8006980
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #2
	bl sub_80067B0
	bl sub_8001EE4
	movs r0, #1
	movs r1, #0xf
	adds r2, r4, #0
	bl sub_8006934
	movs r0, #4
	bl SetTalkPrintDelay
	movs r0, #0x20
	bl SetTalkFlag
	movs r0, #0x80
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #1
	bl SetTalkFlag
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

