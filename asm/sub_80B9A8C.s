	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set PutBlankText, 0x08003DEC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80B9A8C, "ax", %progbits
@ sub_80B9A8C @ JP 0x080B9A8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9A8C
	.thumb_func
sub_80B9A8C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x60
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080B9B08 @ =0x08ABCA70
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x54]
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	adds r0, r5, #0
	adds r0, #0x5f
	ldrb r4, [r0]
	adds r0, r4, #5
	cmp r4, r0
	bge _080B9AE4
_080B9AB8:
	adds r0, r4, #0
	movs r1, #6
	bl sub_80D637C
	lsls r0, r0, #3
	ldr r1, _080B9B0C @ =0x0203EF64
	adds r0, r0, r1
	lsls r1, r4, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #6
	ldr r2, _080B9B10 @ =0x02023CB6
	adds r1, r1, r2
	bl PutBlankText
	adds r4, #1
	adds r0, r5, #0
	adds r0, #0x5f
	ldrb r0, [r0]
	adds r0, #5
	cmp r4, r0
	blt _080B9AB8
_080B9AE4:
	adds r0, r5, #0
	adds r0, #0x5f
	ldrb r2, [r0]
	lsls r2, r2, #0x14
	ldr r0, _080B9B14 @ =0xFFB80000
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080B9B08: .4byte 0x08ABCA70
_080B9B0C: .4byte 0x0203EF64
_080B9B10: .4byte 0x02023CB6
_080B9B14: .4byte 0xFFB80000

