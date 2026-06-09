	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_809A780, "ax", %progbits
@ sub_809A780 @ JP 0x0809A780 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A780
	.thumb_func
sub_809A780:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _0809A7A0 @ =0x08A94688
	bl sub_8002BCC
	movs r1, #0
	str r1, [r0, #0x38]
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	str r6, [r0, #0x34]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A7A0: .4byte 0x08A94688

