	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8056944, "ax", %progbits
@ sub_8056944 @ JP 0x08056944 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056944
	.thumb_func
sub_8056944:
	push {lr}
	sub sp, #4
	ldr r1, _0805695C @ =0x0201C8D0
	str r0, [sp]
	ldr r2, _08056960 @ =0x050002D6
	mov r0, sp
	bl sub_80D6370
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0805695C: .4byte 0x0201C8D0
_08056960: .4byte 0x050002D6

