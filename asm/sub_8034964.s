	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8034964, "ax", %progbits
@ sub_8034964 @ JP 0x08034964 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034964
	.thumb_func
sub_8034964:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_8003CF8
	ldr r0, _080349A8 @ =0x00000486
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #3
	bl sub_80043B8
	ldr r0, [r4, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r3, r3, r0
	adds r0, r5, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_80043DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080349A8: .4byte 0x00000486

