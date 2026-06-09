	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_804E5A0, "ax", %progbits
@ sub_804E5A0 @ JP 0x0804E5A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E5A0
	.thumb_func
sub_804E5A0:
	push {lr}
	ldr r0, _0804E5BC @ =0x08A9AC28
	ldr r1, _0804E5C0 @ =0x06016800
	bl sub_8013008
	ldr r0, _0804E5C4 @ =0x08A9B004
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_0804E5BC: .4byte 0x08A9AC28
_0804E5C0: .4byte 0x06016800
_0804E5C4: .4byte 0x08A9B004

