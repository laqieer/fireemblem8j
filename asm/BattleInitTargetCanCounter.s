	.syntax unified
	.section .text.BattleInitTargetCanCounter, "ax", %progbits
@ BattleInitTargetCanCounter @ JP 0x0802C77C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleInitTargetCanCounter
	.thumb_func
BattleInitTargetCanCounter:
	push {r4, lr}
	ldr r1, _0802C7F4 @ =0x0203A568
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	mov ip, r1
	cmp r0, #0x62
	beq _0802C78E
	cmp r0, #0x34
	bne _0802C79C
_0802C78E:
	mov r0, ip
	adds r0, #0x48
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	adds r0, #0xa
	strb r2, [r0]
_0802C79C:
	ldr r4, _0802C7F8 @ =0x0203A4E8
	mov r3, ip
	ldr r0, [r4, #0x4c]
	ldr r1, [r3, #0x4c]
	orrs r0, r1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0802C7BE
	adds r1, r3, #0
	adds r1, #0x48
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x52
	strb r2, [r0]
_0802C7BE:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	bne _0802C7EE
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802C7EE
	mov r0, ip
	movs r2, #0xb
	ldrsb r2, [r0, r2]
	ands r2, r1
	cmp r2, #0
	bne _0802C7EE
	adds r0, #0x48
	movs r1, #0
	strh r2, [r0]
	adds r0, #0xa
	strb r1, [r0]
_0802C7EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C7F4: .4byte 0x0203A568
_0802C7F8: .4byte 0x0203A4E8

