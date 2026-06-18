	.syntax unified
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_80188EC, "ax", %progbits
@ CanUnitMove @ JP 0x080188EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanUnitMove
	.thumb_func
CanUnitMove:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _0801897C @ =0x080DC684
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _08018980 @ =0x03004DF0
	ldr r2, [r0]
	movs r1, #0x1d
	ldrsb r1, [r2, r1]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _08018984 @ =0x0203A954
	ldrb r0, [r0, #0x10]
	subs r1, r1, r0
	mov sl, r1
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	mov sb, r0
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	movs r7, #0
	mov r4, sp
_0801892E:
	movs r0, #0
	ldrsb r0, [r4, r0]
	mov r1, sb
	adds r6, r1, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	add r1, r8
	ldr r0, _08018988 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08018990
	ldr r0, _08018980 @ =0x03004DF0
	ldr r0, [r0]
	bl GetUnitMovementCost
	ldr r1, _0801898C @ =0x0202E4D8
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08018990
	cmp r0, sl
	bgt _08018990
	movs r0, #1
	b _0801899A
	.align 2, 0
_0801897C: .4byte 0x080DC684
_08018980: .4byte 0x03004DF0
_08018984: .4byte 0x0203A954
_08018988: .4byte 0x0202E4D4
_0801898C: .4byte 0x0202E4D8
_08018990:
	adds r4, #2
	adds r7, #1
	cmp r7, #3
	ble _0801892E
	movs r0, #0
_0801899A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

