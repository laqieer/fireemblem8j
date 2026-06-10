	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8034EA4, 0x08034EA4 + 1
	.set sub_8035610, 0x08035610 + 1
	.section .text.sub_80247A4, "ax", %progbits
@ sub_80247A4 @ JP 0x080247A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80247A4
	.thumb_func
sub_80247A4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8034EA4
	ldr r0, _080247C0 @ =0x000007EE
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080247C0: .4byte 0x000007EE

