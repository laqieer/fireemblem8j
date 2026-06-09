	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_8024838, "ax", %progbits
@ sub_8024838 @ JP 0x08024838 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024838
	.thumb_func
sub_8024838:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08024850 @ =0x000007FE
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08024850: .4byte 0x000007FE

