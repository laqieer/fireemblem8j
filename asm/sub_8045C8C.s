	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8014C7C, 0x08014C7C + 1
	.section .text.sub_8045C8C, "ax", %progbits
@ sub_8045C8C @ JP 0x08045C8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045C8C
	.thumb_func
sub_8045C8C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r6, #0
	ldr r0, _08045D08 @ =0x0203DA20
	mov sb, r0
	movs r0, #0x98
	lsls r0, r0, #2
	mov r8, r0
	movs r0, #0xa1
	add r0, sb
	mov sl, r0
	movs r7, #5
_08045CAC:
	mov r0, sb
	adds r0, #0x9c
	adds r5, r6, r0
	ldr r0, _08045D0C @ =0x085D31E8
	ldr r0, [r0]
	adds r0, #0xb
	adds r0, r0, r6
	ldrb r1, [r0]
	ldrb r0, [r5]
	cmp r0, r1
	beq _08045D3C
	strb r1, [r5]
	lsls r0, r6, #3
	mov r1, sb
	adds r1, #0xc
	adds r4, r0, r1
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	ldrb r0, [r5]
	cmp r0, #4
	bhi _08045D18
	ldr r1, _08045D10 @ =0x080DED10
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	bl sub_8014C7C
	ldr r0, _08045D14 @ =0x085D8048
	mov r1, r8
	movs r2, #0x20
	bl sub_8000D68
	b _08045D36
	.align 2, 0
_08045D08: .4byte 0x0203DA20
_08045D0C: .4byte 0x085D31E8
_08045D10: .4byte 0x080DED10
_08045D14: .4byte 0x085D8048
_08045D18:
	movs r0, #0xa
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xb
	adds r2, r7, #0
	mov r3, sl
	bl sub_8014C7C
	lsls r0, r6, #5
	ldr r1, _08045D5C @ =0x085D7EE8
	adds r0, r0, r1
	mov r1, r8
	movs r2, #0x20
	bl sub_8000D68
_08045D36:
	movs r0, #1
	bl BG_EnableSyncByMask
_08045D3C:
	movs r0, #0x20
	add r8, r0
	movs r0, #0xf
	add sl, r0
	adds r7, #3
	adds r6, #1
	cmp r6, #3
	ble _08045CAC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08045D5C: .4byte 0x085D7EE8

