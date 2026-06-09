	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Prep_CountSupportMenuItems, 0x080973A4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.section .text.sub_8098234, "ax", %progbits
@ sub_8098234 @ JP 0x08098234 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098234
	.thumb_func
sub_8098234:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r5, _080982AC @ =0x02011184
	adds r0, #0x2f
	ldrb r0, [r0]
	bl Prep_CountSupportMenuItems
	adds r3, r0, #0
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	movs r1, #5
	movs r2, #9
	bl sub_804F0EC
	movs r4, #0
	movs r6, #0xc0
	lsls r6, r6, #1
_0809825E:
	adds r0, r7, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08098296
	adds r0, r5, #0
	bl sub_8003CF8
	ldr r1, _080982B0 @ =0x08A95410
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_8009FA8
	ldr r1, _080982B4 @ =0x02022CB0
	adds r1, r6, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r3, #0
	bl sub_8004374
	adds r5, #8
	adds r6, #0x80
_08098296:
	adds r4, #1
	cmp r4, #3
	ble _0809825E
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080982AC: .4byte 0x02011184
_080982B0: .4byte 0x08A95410
_080982B4: .4byte 0x02022CB0

