	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8021AE4, "ax", %progbits
@ sub_8021AE4 @ JP 0x08021AE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021AE4
	.thumb_func
sub_8021AE4:
	push {lr}
	ldr r0, _08021AF8 @ =0x085C3950
	bl Proc_Find
	cmp r0, #0
	beq _08021AF2
	movs r0, #1
_08021AF2:
	pop {r1}
	bx r1
	.align 2, 0
_08021AF8: .4byte 0x085C3950

