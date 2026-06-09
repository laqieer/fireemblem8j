	.syntax unified
	.section .text.SetItemUnsealedForCharacter, "ax", %progbits
@ SetItemUnsealedForCharacter @ JP 0x08017220 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetItemUnsealedForCharacter
	.thumb_func
SetItemUnsealedForCharacter:
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r2, #0
	bne _08017230
	movs r1, #0xff
	b _08017240
_08017230:
	movs r0, #0xff
	ands r0, r2
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801724C @ =0x0885E068
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08017240:
	ldr r0, _08017250 @ =0x0202BCEC
	adds r0, #0x1c
	adds r0, r1, r0
	strb r3, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0801724C: .4byte 0x0885E068
_08017250: .4byte 0x0202BCEC

