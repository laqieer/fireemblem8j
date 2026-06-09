	.syntax unified
	.set sub_80058D0, 0x080058D0 + 1
	.section .text.sub_80451A8, "ax", %progbits
@ sub_80451A8 @ JP 0x080451A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80451A8
	.thumb_func
sub_80451A8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x40
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	ldrb r2, [r1]
	lsls r1, r2, #3
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r2, #0xa
	bl sub_80058D0
	movs r0, #0
	str r0, [r4, #0x3c]
	subs r0, #0x26
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

