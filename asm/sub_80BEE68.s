	.syntax unified
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.section .text.sub_80BEE68, "ax", %progbits
@ sub_80BEE68 @ JP 0x080BEE68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEE68
	.thumb_func
sub_80BEE68:
	push {lr}
	ldr r0, _080BEE94 @ =0x03005270
	bl GetNextUnclearedNode
	cmp r0, #0
	bge _080BEE76
	movs r0, #0
_080BEE76:
	bl WMLoc_GetChapterId
	ldr r2, _080BEE98 @ =0x0202BCEC
	strb r0, [r2, #0xe]
	adds r2, #0x4a
	ldrb r1, [r2]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080BEE94: .4byte 0x03005270
_080BEE98: .4byte 0x0202BCEC

