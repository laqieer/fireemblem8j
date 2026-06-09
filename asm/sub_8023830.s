	.syntax unified
	.set StartMenuAt, 0x0804FA24 + 1
	.set sub_80502F4, 0x080502F4 + 1
	.section .text.sub_8023830, "ax", %progbits
@ sub_8023830 @ JP 0x08023830 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023830
	.thumb_func
sub_8023830:
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	beq _08023890
	ldrh r0, [r2, #0x2a]
	adds r0, #3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _0802387C @ =0xFFFFFF00
	ands r3, r1
	orrs r3, r0
	ldrh r0, [r2, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	ldr r1, _08023880 @ =0xFFFF00FF
	ands r3, r1
	orrs r3, r0
	ldr r0, _08023884 @ =0xFF00FFFF
	ands r3, r0
	movs r0, #0xa0
	lsls r0, r0, #0xb
	orrs r3, r0
	ldr r0, _08023888 @ =0x00FFFFFF
	ands r3, r0
	ldr r0, _0802388C @ =0x085C55D4
	adds r1, r3, #0
	adds r2, r4, #0
	bl StartMenuAt
	adds r0, #0x61
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x84
	b _0802389A
	.align 2, 0
_0802387C: .4byte 0xFFFFFF00
_08023880: .4byte 0xFFFF00FF
_08023884: .4byte 0xFF00FFFF
_08023888: .4byte 0x00FFFFFF
_0802388C: .4byte 0x085C55D4
_08023890:
	ldr r1, _080238A0 @ =0x000007CD
	adds r0, r4, #0
	bl sub_80502F4
	movs r0, #8
_0802389A:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080238A0: .4byte 0x000007CD

