	.syntax unified
	.set sub_801C2C4, 0x0801C2C4 + 1
	.section .text.sub_801BEB4, "ax", %progbits
@ sub_801BEB4 @ JP 0x0801BEB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BEB4
	.thumb_func
sub_801BEB4:
	push {lr}
	adds r3, r1, #0
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, #2
	adds r0, #0x2d
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r2, #0xb
	adds r0, r3, #0
	bl sub_801C2C4
	movs r0, #0
	pop {r1}
	bx r1

