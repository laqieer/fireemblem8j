	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8055BA4, "ax", %progbits
@ sub_8055BA4 @ JP 0x08055BA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055BA4
	.thumb_func
sub_8055BA4:
	push {r4, lr}
	ldr r4, _08055BBC @ =0x02017774
	ldr r0, [r4]
	cmp r0, #0
	beq _08055BB6
	bl Proc_End
	movs r0, #0
	str r0, [r4]
_08055BB6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055BBC: .4byte 0x02017774

