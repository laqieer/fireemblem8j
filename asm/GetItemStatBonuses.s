	.syntax unified
	.section .text.GetItemStatBonuses, "ax", %progbits
@ GetItemStatBonuses @ JP 0x08017490 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemStatBonuses
	.thumb_func
GetItemStatBonuses:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080174A4 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	bx lr
	.align 2, 0
_080174A4: .4byte 0x0885E068

