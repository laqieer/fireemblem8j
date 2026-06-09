	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawIcon, 0x08003608 + 1
	.set PutText, 0x08003DA0 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80944C4, "ax", %progbits
@ sub_80944C4 @ JP 0x080944C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80944C4
	.thumb_func
sub_80944C4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	adds r6, r7, #0
	adds r6, #0x12
	adds r0, r6, #0
	movs r1, #0x13
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0809450C @ =0x0200E148
	mov r8, r0
	bl sub_8003CF8
	cmp r4, #5
	bne _08094510
	movs r5, #0
	adds r4, r6, #0
_080944F2:
	adds r1, r5, #0
	adds r1, #0x70
	adds r0, r4, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	adds r4, #4
	adds r5, #1
	cmp r5, #7
	ble _080944F2
	b _08094574
	.align 2, 0
_0809450C: .4byte 0x0200E148
_08094510:
	movs r5, #1
	ldr r3, _08094588 @ =0x08A93994
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #4
	adds r2, r1, #0
	adds r2, #0x10
	adds r0, r2, r3
	ldrb r0, [r0, #8]
	adds r7, #0x10
	mov sb, r7
	cmp r0, #0
	beq _0809456C
	mov r7, r8
	mov r8, r3
	adds r0, r1, r3
	adds r4, r0, #0
	adds r4, #0x10
	adds r6, r2, #0
_08094536:
	ldrb r1, [r4, #8]
	subs r1, #0x40
	adds r0, r7, #0
	bl sub_8003D84
	adds r0, r7, #0
	movs r1, #0
	bl sub_8003D90
	mov r0, r8
	adds r0, #4
	adds r0, r6, r0
	ldr r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r7, #0
	bl sub_8003F28
	adds r4, #0x10
	adds r6, #0x10
	adds r5, #1
	cmp r5, #8
	bgt _0809456C
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _08094536
_0809456C:
	ldr r0, _0809458C @ =0x0200E148
	mov r1, sb
	bl PutText
_08094574:
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094588: .4byte 0x08A93994
_0809458C: .4byte 0x0200E148

