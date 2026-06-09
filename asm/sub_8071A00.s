	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F94, 0x08070F94 + 1
	.section .text.sub_8071A00, "ax", %progbits
@ sub_8071A00 @ JP 0x08071A00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071A00
	.thumb_func
sub_8071A00:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08071A24 @ =0x0860404C
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08071A28 @ =0x085FF1C0
	adds r0, r4, #0
	movs r1, #1
	adds r2, r3, #0
	bl sub_8070F94
	str r0, [r5, #0x60]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071A24: .4byte 0x0860404C
_08071A28: .4byte 0x085FF1C0

