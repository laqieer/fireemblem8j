	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_8055E9C, "ax", %progbits
@ sub_8055E9C @ JP 0x08055E9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055E9C
	.thumb_func
sub_8055E9C:
	push {lr}
	ldr r1, _08055EB4 @ =0x02017778
	ldr r0, [r1]
	cmp r0, #0
	beq _08055EAE
	movs r0, #0
	str r0, [r1]
	bl Proc_End
_08055EAE:
	pop {r0}
	bx r0
	.align 2, 0
_08055EB4: .4byte 0x02017778

