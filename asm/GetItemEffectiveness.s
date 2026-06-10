	.syntax unified
	.section .text.GetItemEffectiveness, "ax", %progbits
@ GetItemEffectiveness @ JP 0x08017478 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemEffectiveness
	.thumb_func
GetItemEffectiveness:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801748C @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0x10]
	bx lr
	.align 2, 0
_0801748C: .4byte 0x0885E068

