	.syntax unified
	.set CanUnitSupportNow, 0x080282A4 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitSupportLevel, 0x080281D0 + 1
	.set GetUnitSupporterNum, 0x0802833C + 1
	.set UnitGainSupportLevel, 0x08028270 + 1
	.set sub_8085A54, 0x08085A54 + 1
	.section .text.sub_8032320, "ax", %progbits
@ sub_8032320 @ JP 0x08032320 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032320
	.thumb_func
sub_8032320:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080323C0 @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _080323C4 @ =0x03004DF0
	mov sb, r0
	ldr r0, [r0]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl GetUnitSupporterNum
	adds r7, r0, #0
	mov r1, sb
	ldr r0, [r1]
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl GetUnitSupporterNum
	mov r8, r0
	adds r0, r4, #0
	mov r1, r8
	bl CanUnitSupportNow
	mov r2, sb
	ldr r0, [r2]
	adds r1, r7, #0
	bl UnitGainSupportLevel
	adds r0, r4, #0
	mov r1, r8
	bl UnitGainSupportLevel
	mov r1, sb
	ldr r0, [r1]
	ldr r1, [r0]
	ldrb r6, [r1, #4]
	ldr r1, [r4]
	ldrb r5, [r1, #4]
	adds r1, r7, #0
	bl GetUnitSupportLevel
	adds r2, r0, #0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8085A54
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	ldrb r0, [r0]
	adds r4, #0x32
	add r4, r8
	ldrb r1, [r4]
	cmp r0, r1
	beq _080323B0
	cmp r0, r1
	ble _080323A2
	strb r0, [r4]
_080323A2:
	cmp r0, r1
	bge _080323B0
	mov r2, sb
	ldr r0, [r2]
	adds r0, #0x32
	adds r0, r0, r7
	strb r1, [r0]
_080323B0:
	movs r0, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080323C0: .4byte 0x0203A954
_080323C4: .4byte 0x03004DF0

