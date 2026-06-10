	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EndFaceById, 0x08005660 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804E448, 0x0804E448 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.section .text.sub_8046728, "ax", %progbits
@ sub_8046728 @ JP 0x08046728 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8046728
	.thumb_func
sub_8046728:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8042FC8
	bl sub_804D0DC
	movs r0, #0
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8088FA4
	bl sub_804E448
	movs r0, #3
	bl EndFaceById
	ldr r4, _0804678C @ =0x0203DA74
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	movs r0, #0x4d
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r1, _08046790 @ =0x02023FBA
	adds r0, r4, #0
	bl PutText
	ldr r0, _08046794 @ =0x085D32A8
	adds r1, r5, #0
	bl sub_8002BCC
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804678C: .4byte 0x0203DA74
_08046790: .4byte 0x02023FBA
_08046794: .4byte 0x085D32A8

