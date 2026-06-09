	.syntax unified
	.set SetupFaceGfxData, 0x0800544C + 1
	.section .text.sub_8007748, "ax", %progbits
@ sub_8007748 @ JP 0x08007748 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007748
	.thumb_func
sub_8007748:
	push {lr}
	ldr r0, _08007754 @ =0x085B9128
	bl SetupFaceGfxData
	pop {r0}
	bx r0
	.align 2, 0
_08007754: .4byte 0x085B9128

