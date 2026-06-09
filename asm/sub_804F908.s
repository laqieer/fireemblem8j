	.syntax unified
	.set sub_804EE2C, 0x0804EE2C + 1
	.set sub_804EE8C, 0x0804EE8C + 1
	.section .text.sub_804F908, "ax", %progbits
@ sub_804F908 @ JP 0x0804F908 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804F908
	.thumb_func
sub_804F908:
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	bl sub_804EE8C
	adds r0, r4, #0
	bl sub_804EE2C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

