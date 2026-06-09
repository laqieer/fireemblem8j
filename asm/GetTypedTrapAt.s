	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.section .text.GetTypedTrapAt, "ax", %progbits
@ GetTypedTrapAt @ JP 0x0802E184 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetTypedTrapAt
	.thumb_func
GetTypedTrapAt:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r3, _0802E190 @ =0x0203A610
	b _0802E1E2
	.align 2, 0
_0802E190: .4byte 0x0203A610
_0802E194:
	ldrb r0, [r3]
	cmp r0, r4
	bne _0802E1AA
	ldrb r0, [r3, #1]
	cmp r0, r5
	bne _0802E1AA
	ldrb r0, [r3, #2]
	cmp r0, r2
	bne _0802E1AA
	adds r0, r3, #0
	b _0802E1EA
_0802E1AA:
	cmp r2, #0x1b
	bne _0802E1E0
	ldr r0, _0802E1DC @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E1E0
	cmp r5, #0
	ble _0802E1E0
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E1E0
	adds r0, r4, #0
	subs r1, r5, #1
	bl GetTrapAt
	b _0802E1EA
	.align 2, 0
_0802E1DC: .4byte 0x0202E4D8
_0802E1E0:
	adds r3, #8
_0802E1E2:
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _0802E194
	movs r0, #0
_0802E1EA:
	pop {r4, r5}
	pop {r1}
	bx r1

