	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_801E8A0, "ax", %progbits
@ sub_801E8A0 @ JP 0x0801E8A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801E8A0
	.thumb_func
sub_801E8A0:
	push {lr}
	ldr r0, _0801E8B0 @ =0x085C3320
	bl Proc_Find
	cmp r0, #0
	bne _0801E8B4
	movs r0, #0
	b _0801E8B6
	.align 2, 0
_0801E8B0: .4byte 0x085C3320
_0801E8B4:
	movs r0, #1
_0801E8B6:
	pop {r1}
	bx r1
	.align 2, 0

