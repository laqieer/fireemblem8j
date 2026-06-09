	.syntax unified
	.set sub_802EAC4, 0x0802EAC4 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AADA4, "ax", %progbits
@ sub_80AADA4 @ JP 0x080AADA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AADA4
	.thumb_func
sub_80AADA4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080AADC4 @ =0x03006790
	movs r0, #0
	bl sub_802EAC4
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #2
	ldr r3, [r4]
	adds r0, r5, #0
	bl sub_80D65C8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AADC4: .4byte 0x03006790

