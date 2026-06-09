	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018F84, 0x08018F84 + 1
	.section .text.sub_8034A50, "ax", %progbits
@ sub_8034A50 @ JP 0x08034A50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034A50
	.thumb_func
sub_8034A50:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl sub_8003CF8
	ldr r0, _08034AAC @ =0x0000047F
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_80043B8
	ldr r0, _08034AB0 @ =0x000004CA
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x28
	movs r2, #3
	bl sub_80043B8
	adds r0, r5, #0
	bl sub_8018F84
	adds r3, r0, #0
	adds r3, r3, r6
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	bl sub_80043DC
	adds r0, r5, #0
	bl sub_8018F84
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl sub_80043DC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034AAC: .4byte 0x0000047F
_08034AB0: .4byte 0x000004CA

