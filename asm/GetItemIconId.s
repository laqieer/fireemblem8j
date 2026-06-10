	.syntax unified
	.section .text.GetItemIconId, "ax", %progbits
@ GetItemIconId @ JP 0x080174A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemIconId
	.thumb_func
GetItemIconId:
	push {lr}
	cmp r0, #0
	beq _080174C4
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080174C0 @ =0x0885E068
	adds r0, r0, r1
	ldrb r0, [r0, #0x1d]
	b _080174C8
	.align 2, 0
_080174C0: .4byte 0x0885E068
_080174C4:
	movs r0, #1
	rsbs r0, r0, #0
_080174C8:
	pop {r1}
	bx r1

