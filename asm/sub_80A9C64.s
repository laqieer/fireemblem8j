	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A9C64, "ax", %progbits
@ sub_80A9C64 @ JP 0x080A9C64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9C64
	.thumb_func
sub_80A9C64:
	push {lr}
	sub sp, #4
	bl GetSaveReadAddr
	ldr r1, _080A9C84 @ =0x03006790
	ldr r2, _080A9C88 @ =0x00000D88
	adds r0, r0, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #4
	bl sub_80D65C8
	ldr r0, [sp]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080A9C84: .4byte 0x03006790
_080A9C88: .4byte 0x00000D88

