	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8034AEC, "ax", %progbits
@ sub_8034AEC @ JP 0x08034AEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034AEC
	.thumb_func
sub_8034AEC:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_8003CF8
	ldr r0, _08034B1C @ =0x00000483
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #3
	bl sub_80043B8
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #2
	adds r3, r5, #0
	bl sub_80043DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034B1C: .4byte 0x00000483

