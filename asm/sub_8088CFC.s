	.syntax unified
	.set ApplyBitmap, 0x08013110 + 1
	.set DrawStatBarCappedCol, 0x08088CE0 + 1
	.set DrawStatBarFilledCol, 0x08088CC4 + 1
	.set DrawStatBarLeftBorder, 0x08088C1C + 1
	.set DrawStatBarRightBorder, 0x08088C68 + 1
	.set DrawStatBarShadow, 0x08088C40 + 1
	.set DrawStatBarUnfilledCol, 0x08088C94 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8088CFC, "ax", %progbits
@ sub_8088CFC @ JP 0x08088CFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088CFC
	.thumb_func
sub_8088CFC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r7, _08088DE0 @ =0x02020188
	movs r0, #0
	str r0, [sp]
	lsls r2, r2, #4
	ldr r0, _08088DE4 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r2, r0
	mov r0, sp
	adds r1, r7, #0
	bl sub_80D636C
	movs r4, #1
	mov r0, sl
	adds r0, #1
	cmp r4, r0
	bge _08088D4C
	mov r6, r8
	adds r6, #1
	adds r5, r0, #0
_08088D3A:
	adds r2, r4, r6
	adds r0, r7, #0
	mov r3, sb
	lsls r1, r3, #3
	bl DrawStatBarUnfilledCol
	adds r4, #1
	cmp r4, r5
	blt _08088D3A
_08088D4C:
	mov r0, sb
	lsls r5, r0, #3
	mov r2, r8
	adds r2, #1
	adds r0, r7, #0
	adds r1, r5, #0
	bl DrawStatBarLeftBorder
	mov r4, r8
	add r4, sl
	adds r2, r4, #2
	adds r0, r7, #0
	adds r1, r5, #0
	bl DrawStatBarRightBorder
	adds r4, #3
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl DrawStatBarShadow
	movs r4, #0
	adds r6, r5, #0
	ldr r1, [sp, #4]
	lsls r1, r1, #5
	mov sl, r1
	ldr r3, [sp, #0x28]
	cmp r4, r3
	bge _08088D9C
	mov r5, r8
	adds r5, #2
_08088D8A:
	adds r2, r4, r5
	adds r0, r7, #0
	adds r1, r6, #0
	bl DrawStatBarFilledCol
	adds r4, #1
	ldr r0, [sp, #0x28]
	cmp r4, r0
	blt _08088D8A
_08088D9C:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	ble _08088DBE
	mov r0, r8
	adds r0, #2
	ldr r3, [sp, #0x28]
	adds r5, r3, r0
	adds r4, r1, #0
_08088DAC:
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl DrawStatBarCappedCol
	adds r5, #1
	subs r4, #1
	cmp r4, #0
	bne _08088DAC
_08088DBE:
	movs r1, #0xc0
	lsls r1, r1, #0x13
	add r1, sl
	adds r0, r7, #0
	mov r2, sb
	movs r3, #1
	bl ApplyBitmap
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088DE0: .4byte 0x02020188
_08088DE4: .4byte 0x001FFFFF

