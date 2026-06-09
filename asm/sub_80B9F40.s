	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B9F40, "ax", %progbits
@ sub_80B9F40 @ JP 0x080B9F40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9F40
	.thumb_func
sub_80B9F40:
	push {r4, lr}
	adds r4, r1, #0
	ldr r2, _080B9F6C @ =0x08A9919C
	ldr r1, _080B9F70 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080B9F74 @ =0x06010000
	adds r1, r1, r0
	adds r0, r2, #0
	bl sub_8013008
	ldr r0, _080B9F78 @ =0x08A968D4
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9F6C: .4byte 0x08A9919C
_080B9F70: .4byte 0x000003FF
_080B9F74: .4byte 0x06010000
_080B9F78: .4byte 0x08A968D4

