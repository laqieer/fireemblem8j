	.syntax unified
	.section .text.sub_8019F38, "ax", %progbits
@ sub_8019F38 @ JP 0x08019F38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019F38
	.thumb_func
sub_8019F38:
	ldr r1, _08019F44 @ =0x08860CDD
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08019F44: .4byte 0x08860CDD

