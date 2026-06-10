	.syntax unified
	.section .text.GetItemUses, "ax", %progbits
@ GetItemUses @ JP 0x0801732C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemUses
	.thumb_func
GetItemUses:
	push {lr}
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0801734C @ =0x0885E068
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08017350
	asrs r0, r2, #8
	b _08017352
	.align 2, 0
_0801734C: .4byte 0x0885E068
_08017350:
	movs r0, #0xff
_08017352:
	pop {r1}
	bx r1
	.align 2, 0

