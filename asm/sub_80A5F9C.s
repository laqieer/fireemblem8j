	.syntax unified
	.set GetSupportScreenCharIdAt, 0x080A492C + 1
	.set GetSupportScreenPartnerCount, 0x080A5944 + 1
	.set sub_80A5D34, 0x080A5D34 + 1
	.set sub_80A5E18, 0x080A5E18 + 1
	.set sub_80A5E48, 0x080A5E48 + 1
	.set sub_80A5F20, 0x080A5F20 + 1
	.section .text.sub_80A5F9C, "ax", %progbits
@ sub_80A5F9C @ JP 0x080A5F9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5F9C
	.thumb_func
sub_80A5F9C:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x39
	ldrb r1, [r2]
	movs r0, #0xfc
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #0x2c]
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r1, r4, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A5D34
	adds r0, r4, #0
	bl sub_80A5E18
	adds r0, r4, #0
	bl sub_80A5E48
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl sub_80A5F20
	pop {r4}
	pop {r0}
	bx r0

