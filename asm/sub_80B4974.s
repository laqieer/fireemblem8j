	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BlitClippedTileMapToBg, 0x080B12E4 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80B4974, "ax", %progbits
@ sub_80B4974 @ JP 0x080B4974 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4974
	.thumb_func
sub_80B4974:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	mov r8, r0
	mov r7, r8
	adds r7, #0x3a
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	movs r1, #8
	subs r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r1, r0, r1
	cmp r1, #0
	bge _080B499C
	adds r1, #0x3f
_080B499C:
	asrs r1, r1, #6
	movs r0, #0x18
	subs r0, r0, r1
	mov r6, r8
	adds r6, #0x3b
	strb r0, [r6]
	ldrb r0, [r6]
	movs r5, #3
	movs r1, #3
	bl __udivsi3
	movs r1, #0x14
	subs r1, r1, r0
	mov r4, r8
	adds r4, #0x3c
	strb r1, [r4]
	ldr r0, _080B4A04 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B4A08 @ =0x08A9E23C
	ldr r0, [r0]
	str r5, [sp]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r1, #4
	str r1, [sp, #4]
	movs r1, #0x18
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	movs r1, #1
	movs r2, #0x19
	movs r3, #1
	bl BlitClippedTileMapToBg
	movs r0, #2
	bl BG_EnableSyncByMask
	ldrb r0, [r6]
	cmp r0, #0x18
	bne _080B49F8
	movs r0, #0
	strb r0, [r7]
	mov r0, r8
	bl sub_8002DE4
_080B49F8:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4A04: .4byte 0x020234A8
_080B4A08: .4byte 0x08A9E23C

