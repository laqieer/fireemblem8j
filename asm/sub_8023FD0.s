	.syntax unified
	.set sub_808639C, 0x0808639C + 1
	.section .text.sub_8023FD0, "ax", %progbits
@ sub_8023FD0 @ JP 0x08023FD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023FD0
	.thumb_func
sub_8023FD0:
	push {lr}
	ldr r0, _08023FEC @ =0x03004DF0
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_808639C
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08023FEC: .4byte 0x03004DF0

