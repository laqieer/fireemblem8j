	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_801DA74, "ax", %progbits
@ sub_801DA74 @ JP 0x0801DA74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DA74
	.thumb_func
sub_801DA74:
	push {lr}
	ldr r0, _0801DA88 @ =0x085C3248
	bl Proc_Find
	cmp r0, #0
	beq _0801DA82
	movs r0, #1
_0801DA82:
	pop {r1}
	bx r1
	.align 2, 0
_0801DA88: .4byte 0x085C3248

