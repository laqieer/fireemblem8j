	.syntax unified
	.section .text.sub_8019F28, "ax", %progbits
@ sub_8019F28 @ JP 0x08019F28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019F28
	.thumb_func
sub_8019F28:
	ldr r1, _08019F34 @ =0x08860C9C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08019F34: .4byte 0x08860C9C

