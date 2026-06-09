	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806EDD4, "ax", %progbits
@ sub_806EDD4 @ JP 0x0806EDD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EDD4
	.thumb_func
sub_806EDD4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806EDF8 @ =0x0860349C
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806EDFC @ =0x080E4566
	str r1, [r0, #0x48]
	ldr r1, _0806EE00 @ =0x085FAA50
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806EDF8: .4byte 0x0860349C
_0806EDFC: .4byte 0x080E4566
_0806EE00: .4byte 0x085FAA50

