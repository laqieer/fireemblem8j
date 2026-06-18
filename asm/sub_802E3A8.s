	.syntax unified
	.section .text.sub_802E3A8, "ax", %progbits
@ RefreshAllLightRunes @ JP 0x0802E3A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RefreshAllLightRunes
	.thumb_func
RefreshAllLightRunes:
	push {r4, lr}
	ldr r2, _0802E3DC @ =0x0203A610
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0802E3D4
	ldr r4, _0802E3E0 @ =0x0202E4D8
	movs r3, #0
_0802E3B6:
	ldrb r0, [r2, #2]
	cmp r0, #0xd
	bne _0802E3CC
	ldrb r0, [r2, #1]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r2]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r3, [r0]
_0802E3CC:
	adds r2, #8
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802E3B6
_0802E3D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E3DC: .4byte 0x0203A610
_0802E3E0: .4byte 0x0202E4D8

