	.syntax unified
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_80042E0, "ax", %progbits
@ sub_80042E0 @ JP 0x080042E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80042E0
	.thumb_func
sub_80042E0:
	push {r4, lr}
	ldr r0, _08004310 @ =0x085C7420
	ldr r4, _08004314 @ =0x02028E70
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	ldr r1, _08004318 @ =0x020228A8
	ldr r2, [r4]
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0800431C @ =sub_8004150
	str r0, [r2, #8]
	movs r0, #0
	bl SetTextFontGlyphs
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004310: .4byte 0x085C7420
_08004314: .4byte 0x02028E70
_08004318: .4byte 0x020228A8
_0800431C: .4byte 0x08004151  @ sub_8004150

