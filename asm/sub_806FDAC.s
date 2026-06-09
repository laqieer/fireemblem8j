	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_806FE4C, 0x0806FE4C + 1
	.section .text.sub_806FDAC, "ax", %progbits
@ sub_806FDAC @ JP 0x0806FDAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FDAC
	.thumb_func
sub_806FDAC:
	push {lr}
	ldr r0, _0806FDC8 @ =0x08603774
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	bl sub_806FE4C
	pop {r0}
	bx r0
	.align 2, 0
_0806FDC8: .4byte 0x08603774

