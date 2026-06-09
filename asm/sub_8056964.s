	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8056964, "ax", %progbits
@ sub_8056964 @ JP 0x08056964 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056964
	.thumb_func
sub_8056964:
	push {lr}
	sub sp, #4
	ldr r1, _0805697C @ =0x0201D428
	str r0, [sp]
	ldr r2, _08056980 @ =0x05000948
	mov r0, sp
	bl sub_80D6370
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0805697C: .4byte 0x0201D428
_08056980: .4byte 0x05000948

