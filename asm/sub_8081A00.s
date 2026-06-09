	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8081A00, "ax", %progbits
@ sub_8081A00 @ JP 0x08081A00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8081A00
	.thumb_func
sub_8081A00:
	push {lr}
	ldr r0, _08081A1C @ =0x08A1EE2C
	ldr r1, _08081A20 @ =0x06013800
	bl sub_8013008
	ldr r0, _08081A24 @ =0x08A1EE4C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_08081A1C: .4byte 0x08A1EE2C
_08081A20: .4byte 0x06013800
_08081A24: .4byte 0x08A1EE4C

