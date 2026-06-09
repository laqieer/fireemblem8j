	.syntax unified
	.set Checksum16, 0x080A7740 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.section .text.sub_80A8A44, "ax", %progbits
@ sub_80A8A44 @ JP 0x080A8A44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8A44
	.thumb_func
sub_80A8A44:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x10
	bl Checksum16
	strh r0, [r4, #0x10]
	ldr r0, _080A8A68 @ =0x08A9CA20
	ldr r1, [r0]
	ldr r0, _080A8A6C @ =0x00007248
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A8A68: .4byte 0x08A9CA20
_080A8A6C: .4byte 0x00007248

