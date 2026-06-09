	.syntax unified
	.set sub_80860E8, 0x080860E8 + 1
	.set sub_80860F0, 0x080860F0 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A7BDC, "ax", %progbits
@ sub_80A7BDC @ JP 0x080A7BDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7BDC
	.thumb_func
sub_80A7BDC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080A7C00 @ =0x03006790
	bl sub_80860E8
	adds r5, r0, #0
	bl sub_80860F0
	adds r2, r0, #0
	ldr r3, [r4]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80D65C8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7C00: .4byte 0x03006790

