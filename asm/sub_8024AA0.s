	.syntax unified
	.set sub_8025B10, 0x08025B10 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8024AA0, "ax", %progbits
@ sub_8024AA0 @ JP 0x08024AA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024AA0
	.thumb_func
sub_8024AA0:
	push {lr}
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _08024AC4
	ldr r0, _08024ABC @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8025B10
	ldr r0, _08024AC0 @ =0x085C5798
	bl sub_80507B0
	movs r0, #0x27
	b _08024AC6
	.align 2, 0
_08024ABC: .4byte 0x03004DF0
_08024AC0: .4byte 0x085C5798
_08024AC4:
	movs r0, #8
_08024AC6:
	pop {r1}
	bx r1
	.align 2, 0

