	.syntax unified
	.set AiIsInByteList, 0x0803AD38 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set sub_803B434, 0x0803B434 + 1
	.section .text.sub_803AD58, "ax", %progbits
@ sub_803AD58 @ JP 0x0803AD58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803AD58
	.thumb_func
sub_803AD58:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov r8, r1
	adds r7, r2, #0
	movs r0, #0xff
	mov sb, r0
	ldr r0, _0803AE34 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803AE2A
_0803AD7A:
	ldr r0, _0803AE34 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sl, r0
	cmp r4, #0
	blt _0803AE24
	lsls r6, r5, #2
_0803AD8C:
	ldr r0, _0803AE38 @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AE1E
	ldr r0, _0803AE3C @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AE1E
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803ADE4
	ldr r0, _0803AE40 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803ADE4
	ldr r0, _0803AE44 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AE1E
_0803ADE4:
	movs r0, #2
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0803ADFE
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	bl sub_803B434
	cmp r0, #0
	bne _0803AE1E
_0803ADFE:
	ldr r0, _0803AE38 @ =0x0202E4E0
	ldr r0, [r0]
	adds r1, r6, r0
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp sb, r0
	ble _0803AE1E
	strh r4, [r7]
	strh r5, [r7, #2]
	ldr r0, [r1]
	adds r0, r0, r4
	ldrb r0, [r0]
	mov sb, r0
_0803AE1E:
	subs r4, #1
	cmp r4, #0
	bge _0803AD8C
_0803AE24:
	mov r5, sl
	cmp r5, #0
	bge _0803AD7A
_0803AE2A:
	mov r0, sb
	cmp r0, #0xff
	bne _0803AE48
	movs r0, #0
	b _0803AE4A
	.align 2, 0
_0803AE34: .4byte 0x0202E4D0
_0803AE38: .4byte 0x0202E4E0
_0803AE3C: .4byte 0x0202E4D8
_0803AE40: .4byte 0x0202E4D4
_0803AE44: .4byte 0x03004DF0
_0803AE48:
	movs r0, #1
_0803AE4A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

