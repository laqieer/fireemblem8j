	.syntax unified
@ Residual Thumb function at ROM 0x080B1030 (240 bytes), formerly kept as raw
@ data/residual/gap_000B1030.bin INCBIN. Difficulty-menu sprite setup: loops
@ calling PutSpriteExt with OAM data, then updates palettes/cursor. All five
@ literal-pool words are DATA pointers into gSprite_Difficultymenu_0 (+0x8, +0x16,
@ +0x2a x2, +0x70), emitted symbolically (no Thumb bit) so they stay shift-safe.
@ The 0x03xxxxxx values a naive scan might read from the code are NOT pool words
@ but inline `movs rN,#imm; lsls rN,#14` IWRAM-address computations (real code).
@ Internal branch targets use local labels; the only inbound ref is
@ gap_000B1030 + 0x1 (odd -> Thumb bit) which resolves unchanged.
	.section .text.gap_000B1030, "ax", %progbits
	.thumb
	.align 2
	.global gap_000B1030
	.thumb_func
gap_000B1030:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #42
	ldrb r0, [r1, #0]
	adds r0, #1
	strb r0, [r1, #0]
	ldr r3, [pc, #92]
	movs r0, #128
	lsls r0, r0, #6
	str r0, [sp, #0]
	movs r0, #4
	movs r1, #56
	movs r2, #4
	bl PutSpriteExt
	ldr r3, [pc, #80]
	movs r0, #128
	lsls r0, r0, #7
	str r0, [sp, #0]
	movs r0, #4
	movs r1, #56
	movs r2, #4
	bl PutSpriteExt
	movs r5, #0
	adds r0, r6, #0
	adds r0, #43
	str r0, [sp, #4]
	movs r1, #6
	mov r9, r1
	movs r2, #5
	mov r8, r2
	movs r7, #192
	lsls r7, r7, #14
	movs r0, #15
	mov sl, r0
_080B1084:
	asrs r4, r7, #16
	adds r0, r6, #0
	adds r0, #43
	ldrb r0, [r0, #0]
	cmp r5, r0
	bne _080B10B4
	mov r0, r8
	mov r1, sl
	ands r0, r1
	lsls r0, r0, #12
	str r0, [sp, #0]
	movs r0, #4
	movs r1, #8
	adds r2, r4, #0
	ldr r3, [pc, #12]
	bl PutSpriteExt
	b _080B10CA
	.4byte gSprite_Difficultymenu_0 + 0x8
	.4byte gSprite_Difficultymenu_0 + 0x16
	.4byte gSprite_Difficultymenu_0 + 0x2a
_080B10B4:
	mov r0, r9
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #12
	str r0, [sp, #0]
	movs r0, #4
	movs r1, #8
	adds r2, r4, #0
	ldr r3, [pc, #80]
	bl PutSpriteExt
_080B10CA:
	ldr r1, [pc, #80]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r3, [r0, #0]
	movs r0, #128
	lsls r0, r0, #7
	str r0, [sp, #0]
	movs r0, #4
	movs r1, #8
	adds r2, r4, #0
	bl PutSpriteExt
	movs r0, #2
	add r9, r0
	add r8, r0
	movs r1, #128
	lsls r1, r1, #14
	adds r7, r7, r1
	adds r5, #1
	cmp r5, #2
	ble _080B1084
	adds r0, r6, #0
	adds r0, #42
	ldrb r0, [r0, #0]
	ldr r2, [sp, #4]
	ldrb r1, [r2, #0]
	bl DifficultyMenu_UpdateModePalettes
	adds r0, r6, #0
	bl DrawDifficultyMenuCursorMaybe
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.4byte gSprite_Difficultymenu_0 + 0x2a
	.4byte gSprite_Difficultymenu_0 + 0x70
