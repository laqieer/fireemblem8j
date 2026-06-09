	.syntax unified
	.section .text.SetLastCoords, "ax", %progbits
@ SetLastCoords @ JP 0x08032924 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetLastCoords
	.thumb_func
SetLastCoords:
	ldr r3, _08032934 @ =0x085C6080
	ldr r2, [r3]
	adds r2, #0x29
	strb r0, [r2]
	ldr r0, [r3]
	adds r0, #0x2a
	strb r1, [r0]
	bx lr
	.align 2, 0
_08032934: .4byte 0x085C6080

