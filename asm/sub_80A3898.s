	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_80A2D48, 0x080A2D48 + 1
	.set sub_80B1780, 0x080B1780 + 1
	.set sub_80B1794, 0x080B1794 + 1
	.set sub_80B1800, 0x080B1800 + 1
	.set sub_80B181C, 0x080B181C + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.section .text.sub_80A3898, "ax", %progbits
@ sub_80A3898 @ JP 0x080A3898 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3898
	.thumb_func
sub_80A3898:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80A2D48
	adds r0, r4, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	adds r0, r4, #0
	bl sub_80B1780
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r0, #0
	movs r2, #2
	bl sub_80B1794
	movs r0, #3
	bl sub_80B1800
	movs r0, #0
	movs r1, #0x40
	movs r2, #0xe8
	movs r3, #0x40
	bl sub_80B181C
	ldr r1, _080A3908 @ =0x03003020
	adds r2, r1, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A3908: .4byte 0x03003020

