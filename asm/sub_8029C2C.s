	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8035610, 0x08035610 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8029C2C, "ax", %progbits
@ sub_8029C2C @ JP 0x08029C2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029C2C
	.thumb_func
sub_8029C2C:
	push {r4, lr}
	bl sub_80D65C0
	ldr r0, _08029C5C @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _08029C60 @ =0x085C5718
	bl sub_80507B0
	adds r4, r0, #0
	ldr r0, _08029C64 @ =0x000007F9
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029C5C: .4byte 0x0202E4DC
_08029C60: .4byte 0x085C5718
_08029C64: .4byte 0x000007F9

