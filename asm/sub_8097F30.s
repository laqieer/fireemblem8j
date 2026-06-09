	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8097F30, "ax", %progbits
@ sub_8097F30 @ JP 0x08097F30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097F30
	.thumb_func
sub_8097F30:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08097F58 @ =0x08A97720
	ldr r1, _08097F5C @ =0x06010000
	adds r2, r2, r1
	adds r1, r2, #0
	bl sub_8013008
	ldr r0, _08097F60 @ =0x08A97C0C
	adds r4, #0x10
	lsls r4, r4, #5
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097F58: .4byte 0x08A97720
_08097F5C: .4byte 0x06010000
_08097F60: .4byte 0x08A97C0C

