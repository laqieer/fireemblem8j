	.syntax unified
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.section .text.sub_80BDEB4, "ax", %progbits
@ sub_80BDEB4 @ JP 0x080BDEB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDEB4
	.thumb_func
sub_80BDEB4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BDED8 @ =0x03005270
	bl GetNextUnclearedNode
	adds r1, r0, #0
	cmp r1, #0
	blt _080BDEDC
	ldr r0, [r4, #0x48]
	adds r0, #0x33
	strb r1, [r0]
	ldr r1, [r4, #0x48]
	adds r1, #0x32
	ldrb r0, [r1]
	movs r2, #2
	orrs r0, r2
	strb r0, [r1]
	b _080BDEEA
	.align 2, 0
_080BDED8: .4byte 0x03005270
_080BDEDC:
	ldr r0, [r4, #0x48]
	adds r0, #0x32
	ldrb r2, [r0]
	movs r1, #3
	rsbs r1, r1, #0
	ands r1, r2
	strb r1, [r0]
_080BDEEA:
	pop {r4}
	pop {r0}
	bx r0

