	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8034EA4, 0x08034EA4 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_8024760, "ax", %progbits
@ sub_8024760 @ JP 0x08024760 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024760
	.thumb_func
sub_8024760:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8034EA4
	ldr r0, _0802477C @ =0x000007ED
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802477C: .4byte 0x000007ED

