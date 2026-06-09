	.syntax unified
	.set SetTalkFlag, 0x080069AC + 1
	.set SetTalkPrintDelay, 0x080069F4 + 1
	.set sub_800687C, 0x0800687C + 1
	.set sub_8006934, 0x08006934 + 1
	.set sub_8006A14, 0x08006A14 + 1
	.set sub_800814C, 0x0800814C + 1
	.section .text.sub_80D1780, "ax", %progbits
@ sub_80D1780 @ JP 0x080D1780 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1780
	.thumb_func
sub_80D1780:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_800687C
	bl sub_800814C
	movs r0, #2
	movs r1, #0xf
	adds r2, r4, #0
	bl sub_8006934
	movs r0, #0
	bl sub_8006A14
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #8
	bl SetTalkFlag
	movs r0, #0x40
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkPrintDelay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

