	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_807DF10, "ax", %progbits
@ sub_807DF10 @ JP 0x0807DF10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DF10
	.thumb_func
sub_807DF10:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0807DF34 @ =0x08A13D10
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	adds r1, #0x2e
	strb r4, [r1]
	adds r1, #1
	strb r5, [r1]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF34: .4byte 0x08A13D10

