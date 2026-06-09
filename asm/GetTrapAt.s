	.syntax unified
	.section .text.GetTrapAt, "ax", %progbits
@ GetTrapAt @ JP 0x0802E128 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetTrapAt
	.thumb_func
GetTrapAt:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r5, _0802E134 @ =0x0203A610
_0802E130:
	adds r3, r5, #0
	b _0802E176
	.align 2, 0
_0802E134: .4byte 0x0203A610
_0802E138:
	ldrb r0, [r3]
	cmp r4, r0
	bne _0802E148
	ldrb r0, [r3, #1]
	cmp r2, r0
	bne _0802E148
	adds r0, r3, #0
	b _0802E17E
_0802E148:
	ldr r0, _0802E170 @ =0x0202E4D8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r1, r0, r1
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E174
	cmp r2, #0
	ble _0802E174
	subs r0, r1, #4
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E174
	subs r2, #1
	b _0802E130
	.align 2, 0
_0802E170: .4byte 0x0202E4D8
_0802E174:
	adds r3, #8
_0802E176:
	ldrb r0, [r3, #2]
	cmp r0, #0
	bne _0802E138
	movs r0, #0
_0802E17E:
	pop {r4, r5}
	pop {r1}
	bx r1

