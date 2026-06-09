	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_807C37C, "ax", %progbits
@ sub_807C37C @ JP 0x0807C37C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807C37C
	.thumb_func
sub_807C37C:
	push {lr}
	ldr r0, _0807C390 @ =0x08A13438
	bl Proc_Find
	cmp r0, #0
	beq _0807C38A
	movs r0, #1
_0807C38A:
	pop {r1}
	bx r1
	.align 2, 0
_0807C390: .4byte 0x08A13438

