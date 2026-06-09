	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C0018, "ax", %progbits
@ sub_80C0018 @ JP 0x080C0018 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0018
	.thumb_func
sub_80C0018:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, _080C0038 @ =0x08AC18BC
	adds r1, r3, #0
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x30
	strb r5, [r1]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C0038: .4byte 0x08AC18BC

