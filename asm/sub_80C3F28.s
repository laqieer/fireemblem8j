	.syntax unified
	.set ResetText, 0x08003BC4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80C5784, 0x080C5784 + 1
	.section .text.sub_80C3F28, "ax", %progbits
@ sub_80C3F28 @ JP 0x080C3F28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3F28
	.thumb_func
sub_80C3F28:
	push {r4, lr}
	adds r4, r0, #0
	bl ResetText
	bl sub_80C5784
	ldr r0, _080C3F44 @ =0x08AC1E94
	adds r1, r4, #0
	bl sub_8002BCC
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C3F44: .4byte 0x08AC1E94

