	.syntax unified
	.section .text.CheckEkrPopupEnded, "ax", %progbits
@ CheckEkrPopupEnded @ JP 0x08077F54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CheckEkrPopupEnded
	.thumb_func
CheckEkrPopupEnded:
	push {lr}
	ldr r0, _08077F64 @ =0x02020144
	ldr r0, [r0]
	cmp r0, #1
	beq _08077F68
	movs r0, #0
	b _08077F6A
	.align 2, 0
_08077F64: .4byte 0x02020144
_08077F68:
	movs r0, #1
_08077F6A:
	pop {r1}
	bx r1
	.align 2, 0

