	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806A63C, "ax", %progbits
@ sub_806A63C @ JP 0x0806A63C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A63C
	.thumb_func
sub_806A63C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _0806A668 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806A66C @ =0x086028B8
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetAnimAnotherSide
	str r0, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A668: .4byte 0x0201774C
_0806A66C: .4byte 0x086028B8

