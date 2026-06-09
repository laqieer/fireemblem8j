	.syntax unified
	.set GetSoloAnimPreconfType, 0x0802C9A8 + 1
	.section .text.GetBattleAnimPreconfType, "ax", %progbits
@ GetBattleAnimPreconfType @ JP 0x0802C9D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetBattleAnimPreconfType
	.thumb_func
GetBattleAnimPreconfType:
	push {lr}
	ldr r0, _0802CA04 @ =0x0202BCEC
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #2
	bne _0802CA2A
	ldr r2, _0802CA08 @ =0x0203A4E8
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	bne _0802CA10
	ldr r0, _0802CA0C @ =0x0203A568
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _0802CA24
	adds r0, r3, #0
	b _0802CA26
	.align 2, 0
_0802CA04: .4byte 0x0202BCEC
_0802CA08: .4byte 0x0203A4E8
_0802CA0C: .4byte 0x0203A568
_0802CA10:
	ldr r2, _0802CA20 @ =0x0203A568
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	ands r0, r1
	cmp r0, #0
	beq _0802CA24
	movs r0, #1
	b _0802CA2A
	.align 2, 0
_0802CA20: .4byte 0x0203A568
_0802CA24:
	adds r0, r2, #0
_0802CA26:
	bl GetSoloAnimPreconfType
_0802CA2A:
	pop {r1}
	bx r1
	.align 2, 0

