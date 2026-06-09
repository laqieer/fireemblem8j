	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806FE4C, "ax", %progbits
@ sub_806FE4C @ JP 0x0806FE4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806FE4C
	.thumb_func
sub_806FE4C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806FE68 @ =0x0860378C
	movs r1, #3
	bl sub_8002BCC
	movs r1, #0
	strh r1, [r0, #0x2c]
	movs r1, #0x28
	strh r1, [r0, #0x2e]
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE68: .4byte 0x0860378C

