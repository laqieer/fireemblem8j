	.syntax unified
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_8035610, 0x08035610 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8029B18, "ax", %progbits
@ sub_8029B18 @ JP 0x08029B18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029B18
	.thumb_func
sub_8029B18:
	push {r4, lr}
	bl sub_80D65C0
	ldr r0, _08029B48 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _08029B4C @ =0x085C5778
	bl sub_80507B0
	adds r4, r0, #0
	ldr r0, _08029B50 @ =0x000007F2
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8035610
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08029B48: .4byte 0x0202E4DC
_08029B4C: .4byte 0x085C5778
_08029B50: .4byte 0x000007F2

