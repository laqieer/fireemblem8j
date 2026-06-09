	.syntax unified
	.set sub_80A976C, 0x080A976C + 1
	.set sub_80A9778, 0x080A9778 + 1
	.section .text.sub_80B5640, "ax", %progbits
@ sub_80B5640 @ JP 0x080B5640 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5640
	.thumb_func
sub_80B5640:
	push {r4, r5, lr}
	ldr r1, _080B5668 @ =0x08A9E500
	lsls r0, r0, #2
	ldr r4, [r1]
	adds r4, r4, r0
	movs r5, #0
	ldrsb r5, [r4, r5]
	bl sub_80A976C
	adds r1, r0, #0
	movs r0, #1
	lsls r0, r5
	orrs r0, r1
	bl sub_80A9778
	movs r0, #0
	strb r0, [r4, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B5668: .4byte 0x08A9E500

