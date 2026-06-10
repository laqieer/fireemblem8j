	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set sub_80034D0, 0x080034D0 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_802D3AC, 0x0802D3AC + 1
	.set sub_802D3E0, 0x0802D3E0 + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.section .text.sub_802D6CC, "ax", %progbits
@ sub_802D6CC @ JP 0x0802D6CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802D6CC
	.thumb_func
sub_802D6CC:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804F0EC
	str r4, [sp]
	movs r0, #0xf
	movs r1, #8
	movs r2, #0xe
	movs r3, #0xc
	bl sub_804F0EC
	bl ResetTextFont
	bl sub_80034D0
	movs r0, #4
	bl sub_8003508
	adds r0, r5, #0
	bl sub_802D3AC
	adds r0, r5, #0
	bl sub_802D3E0
	ldr r0, [r5, #0x2c]
	bl sub_8018FCC
	adds r1, r0, #0
	subs r4, #4
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	adds r3, r4, #0
	bl sub_8005544
	ldr r0, [r5, #0x30]
	bl sub_8018FCC
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	movs r2, #0xb0
	adds r3, r4, #0
	bl sub_8005544
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #1
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

