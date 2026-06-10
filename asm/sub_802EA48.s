	.syntax unified
	.set GetTrueTerrainAt, 0x080197CC + 1
	.section .text.sub_802EA48, "ax", %progbits
@ sub_802EA48 @ JP 0x0802EA48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EA48
	.thumb_func
sub_802EA48:
	push {r4, lr}
	ldr r4, _0802EA50 @ =0x0203A610
	b _0802EA76
	.align 2, 0
_0802EA50: .4byte 0x0203A610
_0802EA54:
	ldrb r0, [r4, #2]
	cmp r0, #0xd
	bne _0802EA74
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl GetTrueTerrainAt
	ldrb r2, [r4, #1]
	ldr r1, _0802EA84 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r2, r2, #2
	adds r2, r2, r1
	ldrb r3, [r4]
	ldr r1, [r2]
	adds r1, r1, r3
	strb r0, [r1]
_0802EA74:
	adds r4, #8
_0802EA76:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802EA54
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA84: .4byte 0x0202E4D8

