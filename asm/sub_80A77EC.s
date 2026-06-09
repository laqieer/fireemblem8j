	.syntax unified
	.set Checksum16, 0x080A7740 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.section .text.sub_80A77EC, "ax", %progbits
@ sub_80A77EC @ JP 0x080A77EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A77EC
	.thumb_func
sub_80A77EC:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0x50
	bl Checksum16
	adds r1, r4, #0
	adds r1, #0x60
	strh r0, [r1]
	ldr r0, _080A7810 @ =0x08A9CA20
	ldr r1, [r0]
	adds r0, r4, #0
	movs r2, #0x64
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A7810: .4byte 0x08A9CA20

