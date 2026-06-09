	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetUnit, 0x08019108 + 1
	.set SetUnitAllItemsUsesToMax, 0x0804E1A0 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set ShowUnitSprite, 0x080280C4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_804A0D4, 0x0804A0D4 + 1
	.set sub_804A584, 0x0804A584 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_804B440, "ax", %progbits
@ sub_804B440 @ JP 0x0804B440 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B440
	.thumb_func
sub_804B440:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	ldr r1, _0804B52C @ =0x03001810
	ldr r0, _0804B530 @ =0x0203DD8C
	mov r8, r0
	ldrb r0, [r0, #4]
	adds r0, r0, r1
	ldrb r4, [r0]
	mov r2, r8
	ldrb r0, [r2, #5]
	adds r0, r0, r1
	ldrb r5, [r0]
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r0, r5, #0
	bl GetUnit
	adds r7, r0, #0
	bl sub_804A584
	lsrs r0, r4, #6
	lsls r0, r0, #3
	mov r2, r8
	adds r2, #0x30
	adds r3, r0, r2
	ldr r1, _0804B534 @ =0x0203A4E8
	mov sb, r1
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r3]
	add r0, r8
	adds r0, #0x2c
	movs r3, #0
	strb r4, [r0]
	strb r3, [r6, #9]
	lsrs r0, r5, #6
	lsls r0, r0, #3
	adds r2, r0, r2
	ldr r4, _0804B538 @ =0x0203A568
	adds r1, r4, #0
	adds r1, #0x6e
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	str r1, [r2]
	add r0, r8
	adds r0, #0x2c
	strb r5, [r0]
	strb r3, [r7, #9]
	adds r0, r6, #0
	bl SetUnitAllItemsUsesToMax
	adds r0, r7, #0
	bl SetUnitAllItemsUsesToMax
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r7, #0
	movs r1, #0
	bl SetUnitStatus
	bl sub_807B4B8
	adds r0, r6, #0
	bl sub_8018E64
	cmp r0, #0
	beq _0804B4EC
	adds r0, r6, #0
	bl ShowUnitSprite
	ldr r0, [r6, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0xc]
_0804B4EC:
	bl sub_804A0D4
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	bl sub_8018E64
	mov r1, sb
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _0804B53C
	adds r0, r7, #0
	bl sub_8018E64
	adds r1, r4, #0
	adds r1, #0x72
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _0804B53C
	mov r2, r8
	ldrb r0, [r2, #9]
	adds r0, #1
	strb r0, [r2, #9]
	b _0804B542
	.align 2, 0
_0804B52C: .4byte 0x03001810
_0804B530: .4byte 0x0203DD8C
_0804B534: .4byte 0x0203A4E8
_0804B538: .4byte 0x0203A568
_0804B53C:
	ldr r1, _0804B558 @ =0x0203DD8C
	movs r0, #0
	strb r0, [r1, #9]
_0804B542:
	mov r0, sl
	bl sub_8002DE4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B558: .4byte 0x0203DD8C

