	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806A93C, "ax", %progbits
@ sub_806A93C @ JP 0x0806A93C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A93C
	.thumb_func
sub_806A93C:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0806A95C @ =0x086028D0
	movs r1, #0
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806A95C: .4byte 0x086028D0

