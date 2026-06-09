	.syntax unified
	.section .text.GetSelectedGameOption, "ax", %progbits
@ GetSelectedGameOption @ JP 0x080B62EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetSelectedGameOption
	.thumb_func
GetSelectedGameOption:
	ldr r0, _080B62F8 @ =0x08AAF6D8
	ldr r0, [r0]
	ldrh r0, [r0, #0x2a]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
_080B62F8: .4byte 0x08AAF6D8

