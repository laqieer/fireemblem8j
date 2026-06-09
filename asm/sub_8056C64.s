	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8056C64, "ax", %progbits
@ sub_8056C64 @ JP 0x08056C64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056C64
	.thumb_func
sub_8056C64:
	push {lr}
	ldr r0, _08056C74 @ =0x085E3D04
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_08056C74: .4byte 0x085E3D04

