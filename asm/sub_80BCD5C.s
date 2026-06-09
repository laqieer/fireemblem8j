	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80BCD5C, "ax", %progbits
@ sub_80BCD5C @ JP 0x080BCD5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCD5C
	.thumb_func
sub_80BCD5C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BCD70 @ =0x08AC0EE0
	bl sub_8002BCC
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BCD70: .4byte 0x08AC0EE0

