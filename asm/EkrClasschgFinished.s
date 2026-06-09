	.syntax unified
	.section .text.EkrClasschgFinished, "ax", %progbits
@ EkrClasschgFinished @ JP 0x08074EBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EkrClasschgFinished
	.thumb_func
EkrClasschgFinished:
	push {lr}
	ldr r0, _08074ED0 @ =0x020200B0
	ldr r0, [r0]
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _08074ED4
	movs r0, #0
	b _08074ED6
	.align 2, 0
_08074ED0: .4byte 0x020200B0
_08074ED4:
	movs r0, #1
_08074ED6:
	pop {r1}
	bx r1
	.align 2, 0

