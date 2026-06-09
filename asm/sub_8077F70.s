	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8077F70, "ax", %progbits
@ sub_8077F70 @ JP 0x08077F70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077F70
	.thumb_func
sub_8077F70:
	push {r4, lr}
	ldr r4, _08077F88 @ =0x02020140
	ldr r0, [r4]
	cmp r0, #0
	beq _08077F82
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08077F82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077F88: .4byte 0x02020140

