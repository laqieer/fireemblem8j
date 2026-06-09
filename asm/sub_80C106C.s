	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set BG_SetPriority, 0x08001DBC + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_80C106C, "ax", %progbits
@ sub_80C106C @ JP 0x080C106C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C106C
	.thumb_func
sub_80C106C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r4]
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x3a
	ldrb r1, [r1]
	bl BG_SetPriority
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #1
	adds r0, r1, #0
	ldrb r2, [r2]
	lsls r0, r2
	ldrb r4, [r4]
	lsls r1, r4
	orrs r0, r1
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	ldr r2, _080C10D4 @ =0x0300305C
	ldrh r1, [r2]
	ldr r0, _080C10D8 @ =0x0000FFC0
	ands r0, r1
	ldr r1, _080C10DC @ =0x0000C0FF
	ands r0, r1
	strh r0, [r2]
	adds r2, r5, #0
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C10D4: .4byte 0x0300305C
_080C10D8: .4byte 0x0000FFC0
_080C10DC: .4byte 0x0000C0FF

