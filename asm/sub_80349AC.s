	.syntax unified
	.set GetUnitAid, 0x080186CC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80349AC, "ax", %progbits
@ sub_80349AC @ JP 0x080349AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80349AC
	.thumb_func
sub_80349AC:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8003CF8
	ldr r0, _080349E0 @ =0x00000487
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_80043B8
	adds r0, r5, #0
	bl GetUnitAid
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_80043DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080349E0: .4byte 0x00000487

