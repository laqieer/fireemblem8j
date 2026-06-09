	.syntax unified
	.set EndEfxHPBarColorChange, 0x08055398 + 1
	.set sub_8055BA4, 0x08055BA4 + 1
	.section .text.sub_8051A00, "ax", %progbits
@ sub_8051A00 @ JP 0x08051A00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051A00
	.thumb_func
sub_8051A00:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8055BA4
	bl EndEfxHPBarColorChange
	ldr r0, _08051A24 @ =0x0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	str r0, [r4, #0x44]
	movs r0, #0
	str r0, [r4, #0x48]
	ldr r0, _08051A28 @ =sub_8051A2C
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051A24: .4byte 0x0203E0FC
_08051A28: .4byte 0x08051A2D  @ sub_8051A2C

