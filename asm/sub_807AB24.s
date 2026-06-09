	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.section .text.sub_807AB24, "ax", %progbits
@ sub_807AB24 @ JP 0x0807AB24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AB24
	.thumb_func
sub_807AB24:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0807AB40 @ =0x08A132D0
	bl Proc_Find
	cmp r0, #0
	beq _0807AB38
	adds r1, r4, #0
	bl SetMuMoveScript
_0807AB38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807AB40: .4byte 0x08A132D0

