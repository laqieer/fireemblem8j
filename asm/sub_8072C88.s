	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8072C88, "ax", %progbits
@ sub_8072C88 @ JP 0x08072C88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072C88
	.thumb_func
sub_8072C88:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08072CB4 @ =0x03003020
	adds r2, r1, #0
	adds r2, #0x3c
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x3d
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072CB4: .4byte 0x03003020

