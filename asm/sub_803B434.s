	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803B434, "ax", %progbits
@ AiCountNearbyEnemyUnits @ JP 0x0803B434 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiCountNearbyEnemyUnits
	.thumb_func
AiCountNearbyEnemyUnits:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	movs r6, #0
	ldr r4, _0803B4B4 @ =0x085D1FC4
	subs r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	ldr r1, _0803B4B8 @ =0x0000270F
	cmp r0, r1
	beq _0803B4A6
	ldr r5, _0803B4BC @ =0x0202E4D0
	mov sb, r1
_0803B45A:
	adds r4, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	mov r1, r8
	adds r3, r1, r0
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	bge _0803B49E
	movs r1, #2
	ldrsh r0, [r4, r1]
	adds r2, r7, r0
	movs r1, #2
	ldrsh r0, [r5, r1]
	cmp r2, r0
	bge _0803B49E
	ldr r0, _0803B4C0 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B49E
	ldr r0, _0803B4C4 @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B49E
	adds r6, #1
_0803B49E:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, sb
	bne _0803B45A
_0803B4A6:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803B4B4: .4byte 0x085D1FC4
_0803B4B8: .4byte 0x0000270F
_0803B4BC: .4byte 0x0202E4D0
_0803B4C0: .4byte 0x0202E4D4
_0803B4C4: .4byte 0x0202BE40

