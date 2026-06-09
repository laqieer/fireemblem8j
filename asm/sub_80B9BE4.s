	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set PutBlankText, 0x08003DEC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80B9BE4, "ax", %progbits
@ sub_80B9BE4 @ JP 0x080B9BE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9BE4
	.thumb_func
sub_80B9BE4:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x60
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080B9C40 @ =0x08ABCA80
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x54]
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	movs r4, #0
_080B9C06:
	adds r0, r4, #0
	movs r1, #6
	bl sub_80D637C
	lsls r0, r0, #3
	ldr r1, _080B9C44 @ =0x0203EF64
	adds r0, r0, r1
	lsls r1, r4, #1
	movs r2, #0x1f
	ands r1, r2
	lsls r1, r1, #6
	ldr r2, _080B9C48 @ =0x02023CB6
	adds r1, r1, r2
	bl PutBlankText
	adds r4, #1
	cmp r4, #4
	ble _080B9C06
	ldr r2, _080B9C4C @ =0x0000FFB8
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9C40: .4byte 0x08ABCA80
_080B9C44: .4byte 0x0203EF64
_080B9C48: .4byte 0x02023CB6
_080B9C4C: .4byte 0x0000FFB8

