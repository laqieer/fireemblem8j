	.syntax unified
	.section .text.GetItemCrit, "ax", %progbits
@ GetItemCrit @ JP 0x080173CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemCrit
	.thumb_func
GetItemCrit:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173E0 @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x18]
	bx lr
	.align 2, 0
_080173E0: .4byte 0x0885E068

