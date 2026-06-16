	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B7B2C, "ax", %progbits
@ sub_80B7B2C @ JP 0x080B7B2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7B2C
	.thumb_func
sub_80B7B2C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _080B7B44 @ =0x08AAFCB4
	adds r1, r4, #0
	bl sub_8002BCC
	str r4, [r0, #0x60]
	str r5, [r0, #0x64]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B7B44: .4byte 0x08AAFCB4

