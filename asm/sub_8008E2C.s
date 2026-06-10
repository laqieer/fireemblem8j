	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8008E2C, "ax", %progbits
@ sub_8008E2C @ JP 0x08008E2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008E2C
	.thumb_func
sub_8008E2C:
	push {lr}
	ldr r0, _08008E40 @ =0x085B93BC
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _08008E3C
	movs r0, #1
_08008E3C:
	pop {r1}
	bx r1
	.align 2, 0
_08008E40: .4byte 0x085B93BC

