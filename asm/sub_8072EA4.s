	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8059810, 0x08059810 + 1
	.set sub_805AE20, 0x0805AE20 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8072EA4, "ax", %progbits
@ sub_8072EA4 @ JP 0x08072EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072EA4
	.thumb_func
sub_8072EA4:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08072EE8 @ =0x08C00008
	ldr r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r5, #0
	movs r1, #0xc4
	bl sub_8059810
	adds r0, r5, #0
	movs r1, #0
	bl sub_805AE20
	movs r0, #0xc4
	lsls r0, r0, #5
	adds r4, r4, r0
	ldr r0, [r4, #0x1c]
	ldr r4, _08072EEC @ =0x0201C790
	adds r1, r4, #0
	bl sub_80D6394
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08072EF4
	ldr r1, _08072EF0 @ =0x02022B88
	adds r0, r4, #0
	movs r2, #0x10
	bl sub_80D636C
	b _08072EFE
	.align 2, 0
_08072EE8: .4byte 0x08C00008
_08072EEC: .4byte 0x0201C790
_08072EF0: .4byte 0x02022B88
_08072EF4:
	ldr r1, _08072F10 @ =0x02022BC8
	adds r0, r4, #0
	movs r2, #0x10
	bl sub_80D636C
_08072EFE:
	bl sub_8001EE4
	adds r0, r6, #0
	bl sub_8002DE4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08072F10: .4byte 0x02022BC8

