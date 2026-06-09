	.syntax unified
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A97A0, "ax", %progbits
@ sub_80A97A0 @ JP 0x080A97A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A97A0
	.thumb_func
sub_80A97A0:
	push {lr}
	ldr r2, _080A97B8 @ =0x03006790
	ldr r1, _080A97BC @ =0x00000D88
	adds r0, r0, r1
	ldr r1, _080A97C0 @ =0x0203EDB0
	ldr r3, [r2]
	movs r2, #4
	bl sub_80D65C8
	pop {r0}
	bx r0
	.align 2, 0
_080A97B8: .4byte 0x03006790
_080A97BC: .4byte 0x00000D88
_080A97C0: .4byte 0x0203EDB0

