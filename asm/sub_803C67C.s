	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_803C67C, "ax", %progbits
@ sub_803C67C @ JP 0x0803C67C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C67C
	.thumb_func
sub_803C67C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _0803C6A0 @ =0x030017CC
	ldr r0, _0803C6A4 @ =0x030017C8
	ldr r0, [r0]
	ldr r1, [r0, #8]
	str r1, [r2]
	ldr r0, [r0, #0xc]
	bl sub_80D65C0
	ldr r1, _0803C6A8 @ =0x030017C0
	strb r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C6A0: .4byte 0x030017CC
_0803C6A4: .4byte 0x030017C8
_0803C6A8: .4byte 0x030017C0

