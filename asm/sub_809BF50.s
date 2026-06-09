	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_809B118, 0x0809B118 + 1
	.set sub_809B284, 0x0809B284 + 1
	.set sub_809C178, 0x0809C178 + 1
	.set sub_809C224, 0x0809C224 + 1
	.set sub_809C250, 0x0809C250 + 1
	.section .text.sub_809BF50, "ax", %progbits
@ sub_809BF50 @ JP 0x0809BF50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809BF50
	.thumb_func
sub_809BF50:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x34]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0809BF62
	b _0809C07C
_0809BF62:
	ldr r0, _0809BF7C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BF80
	adds r0, r6, #0
	bl sub_8002DE4
	b _0809C082
	.align 2, 0
_0809BF7C: .4byte 0x085775CC
_0809BF80:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BFF0
	adds r5, r6, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r7, r0, #0
	adds r4, r6, #0
	adds r4, #0x2b
	ldrb r0, [r4]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	adds r1, r0, #0
	ldrb r0, [r5]
	ldrb r4, [r4]
	cmp r0, r4
	beq _0809BFD8
	cmp r7, #0
	bgt _0809BFB8
	cmp r1, #0
	ble _0809BFD8
_0809BFB8:
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _0809BFD4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C082
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809C082
	.align 2, 0
_0809BFD4: .4byte 0x0202BCEC
_0809BFD8:
	ldr r0, _0809BFEC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C082
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809C082
	.align 2, 0
_0809BFEC: .4byte 0x0202BCEC
_0809BFF0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809C020
	movs r0, #1
	bl sub_809C224
	adds r0, r6, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0809C01C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809C082
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809C082
	.align 2, 0
_0809C01C: .4byte 0x0202BCEC
_0809C020:
	adds r0, r6, #0
	bl sub_809B118
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C07C
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r1, r0, #0
	ldr r0, _0809C08C @ =0x00000502
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0x4c
	bl sub_809C178
	ldr r4, _0809C090 @ =0x02013538
	ldr r5, _0809C094 @ =0x02022F0A
	ldrb r0, [r7]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #2
	bl sub_809C250
	subs r4, #0x28
	subs r5, #0x1e
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl sub_809C250
	movs r0, #1
	bl BG_EnableSyncByMask
_0809C07C:
	adds r0, r6, #0
	bl sub_809B284
_0809C082:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C08C: .4byte 0x00000502
_0809C090: .4byte 0x02013538
_0809C094: .4byte 0x02022F0A

