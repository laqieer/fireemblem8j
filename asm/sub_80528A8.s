	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set EfxTmReplacePal, 0x08073228 + 1
	.set FillBGRect, 0x080732A0 + 1
	.section .text.sub_80528A8, "ax", %progbits
@ sub_80528A8 @ JP 0x080528A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80528A8
	.thumb_func
sub_80528A8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	beq _0805299E
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805299E
	ldrh r0, [r7, #0x3a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r1, r0, #5
	mov r8, r1
	cmp r1, #0
	bge _080528DA
	movs r2, #0
	mov r8, r2
_080528DA:
	adds r6, r0, #7
	cmp r6, #6
	ble _080528E2
	movs r6, #6
_080528E2:
	movs r0, #6
	subs r0, r0, r6
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	str r1, [sp, #8]
	ldr r0, _08052900 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _08052904
	cmp r0, #2
	bgt _08052904
	movs r4, #0
	b _08052906
	.align 2, 0
_08052900: .4byte 0x0203E11C
_08052904:
	movs r4, #0xf
_08052906:
	ldr r2, _080529B0 @ =0x02022CA8
	mov sb, r2
	movs r0, #0x80
	mov sl, r0
	str r0, [sp]
	mov r0, sb
	movs r1, #0x1e
	movs r2, #7
	movs r3, #0
	bl FillBGRect
	cmp r6, #0
	ble _08052998
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne _0805295C
	ldr r0, _080529B4 @ =0x08856664
	ldr r1, [sp, #8]
	adds r0, r1, r0
	mov r2, r8
	lsls r5, r2, #1
	lsls r1, r4, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	movs r2, #0xf
	adds r3, r4, #0
	bl EfxTmCpyBG
	mov r0, sl
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #2
	bl EfxTmReplacePal
_0805295C:
	ldr r0, [r7, #0x50]
	cmp r0, #0
	bne _08052998
	ldr r0, _080529B8 @ =0x08856718
	ldr r1, [sp, #8]
	adds r0, r1, r0
	mov r2, r8
	lsls r5, r2, #1
	movs r2, #0xf
	lsls r1, r2, #1
	add r1, sb
	adds r5, r5, r1
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r1, r5, #0
	adds r3, r4, #0
	bl EfxTmCpyBG
	mov r0, sl
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0xf
	adds r2, r4, #0
	movs r3, #3
	bl EfxTmReplacePal
_08052998:
	movs r0, #1
	bl BG_EnableSyncByMask
_0805299E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080529B0: .4byte 0x02022CA8
_080529B4: .4byte 0x08856664
_080529B8: .4byte 0x08856718

