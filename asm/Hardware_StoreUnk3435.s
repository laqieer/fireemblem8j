	.syntax unified
	.section .text.Hardware_StoreUnk3435, "ax", %progbits
@ Hardware_StoreUnk3435 @ JP 0x080014D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Hardware_StoreUnk3435
	.thumb_func
Hardware_StoreUnk3435:
	ldr r2, _080014E4 @ =0x03000014
	strb r0, [r2]
	ldr r0, _080014E8 @ =0x03000015
	strb r1, [r0]
	bx lr
	.align 2, 0
_080014E4: .4byte 0x03000014
_080014E8: .4byte 0x03000015

