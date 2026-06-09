	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_807B010, "ax", %progbits
@ sub_807B010 @ JP 0x0807B010 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B010
	.thumb_func
sub_807B010:
	push {lr}
	ldr r0, _0807B024 @ =0x08A12FF0
	bl Proc_Find
	cmp r0, #0
	beq _0807B01E
	movs r0, #1
_0807B01E:
	pop {r1}
	bx r1
	.align 2, 0
_0807B024: .4byte 0x08A12FF0

