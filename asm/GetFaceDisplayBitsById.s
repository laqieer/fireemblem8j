	.syntax unified
	.set sub_80056AC, 0x080056AC + 1
	.section .text.GetFaceDisplayBitsById, "ax", %progbits
@ GetFaceDisplayBitsById @ JP 0x080056B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetFaceDisplayBitsById
	.thumb_func
GetFaceDisplayBitsById:
	push {lr}
	ldr r1, _080056C4 @ =0x03004920
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_80056AC
	pop {r1}
	bx r1
	.align 2, 0
_080056C4: .4byte 0x03004920

