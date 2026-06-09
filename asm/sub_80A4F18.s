	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80A4F18, "ax", %progbits
@ sub_80A4F18 @ JP 0x080A4F18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4F18
	.thumb_func
sub_80A4F18:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _080A4F34 @ =0x08A95B50
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4F34: .4byte 0x08A95B50

