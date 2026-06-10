	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018F84, 0x08018F84 + 1
	.section .text.sub_8034AB4, "ax", %progbits
@ sub_8034AB4 @ JP 0x08034AB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034AB4
	.thumb_func
sub_8034AB4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8003CF8
	ldr r0, _08034AE8 @ =0x0000047F
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_80043B8
	adds r0, r5, #0
	bl sub_8018F84
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_80043DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034AE8: .4byte 0x0000047F

