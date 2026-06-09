	.syntax unified
	.set Checksum16, 0x080A7740 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.section .text.sub_80A88E8, "ax", %progbits
@ sub_80A88E8 @ JP 0x080A88E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A88E8
	.thumb_func
sub_80A88E8:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x20
	bl Checksum16
	strh r0, [r4, #0x20]
	ldr r0, _080A890C @ =0x08A9CA20
	ldr r1, [r0]
	ldr r0, _080A8910 @ =0x00007224
	adds r1, r1, r0
	adds r0, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A890C: .4byte 0x08A9CA20
_080A8910: .4byte 0x00007224

