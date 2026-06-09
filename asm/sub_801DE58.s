	.syntax unified
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_808CD14, 0x0808CD14 + 1
	.section .text.sub_801DE58, "ax", %progbits
@ sub_801DE58 @ JP 0x0801DE58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DE58
	.thumb_func
sub_801DE58:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r2, _0801DEA0 @ =0x0203A954
	ldr r0, _0801DEA4 @ =0x03004DF0
	ldr r1, [r0]
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #6]
	movs r0, #0
	ldrsb r0, [r4, r0]
	strh r0, [r2, #8]
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl sub_808BB14
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r1, r1, #4
	adds r1, #0x20
	ldr r2, _0801DEA8 @ =0x000007C9
	movs r0, #8
	adds r3, r5, #0
	bl sub_808CD14
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801DEA0: .4byte 0x0203A954
_0801DEA4: .4byte 0x03004DF0
_0801DEA8: .4byte 0x000007C9

