	.syntax unified
	.set m4aSoundMode, 0x080D540C + 1
	.section .text.sub_8002838, "ax", %progbits
@ sub_8002838 @ JP 0x08002838 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002838
	.thumb_func
sub_8002838:
	push {lr}
	ldr r1, _08002848 @ =0x02024E5C
	strb r0, [r1, #8]
	lsls r0, r0, #8
	bl m4aSoundMode
	pop {r0}
	bx r0
	.align 2, 0
_08002848: .4byte 0x02024E5C

