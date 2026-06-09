	.syntax unified
	.set sub_80B4414, 0x080B4414 + 1
	.set sub_80B4C30, 0x080B4C30 + 1
	.section .text.sub_80B3B08, "ax", %progbits
@ sub_80B3B08 @ JP 0x080B3B08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3B08
	.thumb_func
sub_80B3B08:
	push {r4, lr}
	ldr r4, [r0, #0x14]
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r1, [r0]
	ldr r0, _080B3B40 @ =0x08A9E248
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	movs r2, #0
	bl sub_80B4414
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_80B4C30
	adds r4, #0x3f
	movs r0, #0
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3B40: .4byte 0x08A9E248

