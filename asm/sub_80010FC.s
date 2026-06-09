	.syntax unified
	.set ApplyColorAddition_ClampMax, 0x08001044 + 1
	.set ApplyColorAddition_ClampMin, 0x080010A0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80010FC, "ax", %progbits
@ sub_80010FC @ JP 0x080010FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80010FC
	.thumb_func
sub_80010FC:
	push {r4, lr}
	ldr r4, _0800118C @ =0x0300000C
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08001118
	ldr r0, _08001190 @ =0x02022CA8
	ldr r1, _08001194 @ =0x02024CA8
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_80D636C
_08001118:
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08001130
	ldr r0, _08001198 @ =0x020234A8
	ldr r1, _08001194 @ =0x02024CA8
	ldr r1, [r1, #4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_80D636C
_08001130:
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08001148
	ldr r0, _0800119C @ =0x02023CA8
	ldr r1, _08001194 @ =0x02024CA8
	ldr r1, [r1, #8]
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_80D636C
_08001148:
	ldrb r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08001160
	ldr r0, _080011A0 @ =0x020244A8
	ldr r1, _08001194 @ =0x02024CA8
	ldr r1, [r1, #0xc]
	movs r2, #0x80
	lsls r2, r2, #2
	bl sub_80D636C
_08001160:
	movs r2, #0
	strb r2, [r4]
	ldr r1, _080011A4 @ =0x0300000D
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _080011CA
	strb r2, [r1]
	ldr r0, _080011A8 @ =0x03003020
	adds r0, #0x68
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _080011B0
	ldr r0, _080011AC @ =0x020228A8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	b _080011CA
	.align 2, 0
_0800118C: .4byte 0x0300000C
_08001190: .4byte 0x02022CA8
_08001194: .4byte 0x02024CA8
_08001198: .4byte 0x020234A8
_0800119C: .4byte 0x02023CA8
_080011A0: .4byte 0x020244A8
_080011A4: .4byte 0x0300000D
_080011A8: .4byte 0x03003020
_080011AC: .4byte 0x020228A8
_080011B0:
	cmp r1, #0
	ble _080011C0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl ApplyColorAddition_ClampMax
	b _080011CA
_080011C0:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl ApplyColorAddition_ClampMin
_080011CA:
	pop {r4}
	pop {r0}
	bx r0

