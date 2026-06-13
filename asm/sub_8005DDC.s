	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.EndFaceIn8Frames, "ax", %progbits
@ EndFaceIn8Frames @ JP 0x08005DDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EndFaceIn8Frames
	.thumb_func
EndFaceIn8Frames:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08005DF0 @ =0x085B8FCC
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x54]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005DF0: .4byte 0x085B8FCC

