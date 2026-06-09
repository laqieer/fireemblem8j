	.syntax unified
	.set UnitGetIndexInPrepList, 0x08097BDC + 1
	.set sub_8097674, 0x08097674 + 1
	.set sub_8097B9C, 0x08097B9C + 1
	.section .text.sub_809D104, "ax", %progbits
@ sub_809D104 @ JP 0x0809D104 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D104
	.thumb_func
sub_809D104:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8097B9C
	bl sub_8097674
	bl UnitGetIndexInPrepList
	movs r1, #0
	strh r0, [r4, #0x2e]
	ldr r0, [r4, #0x14]
	adds r0, #0x2a
	ldrb r0, [r0]
	adds r2, r4, #0
	adds r2, #0x2a
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	subs r2, #1
	strb r0, [r2]
	ldr r0, [r4, #0x14]
	ldrh r0, [r0, #0x3c]
	strh r0, [r4, #0x30]
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

