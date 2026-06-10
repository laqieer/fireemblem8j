	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80138FC, "ax", %progbits
@ sub_80138FC @ JP 0x080138FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80138FC
	.thumb_func
sub_80138FC:
	push {lr}
	ldr r0, _0801390C @ =0x085C2458
	bl Proc_Find
	cmp r0, #0
	bne _08013910
	movs r0, #0
	b _08013912
	.align 2, 0
_0801390C: .4byte 0x085C2458
_08013910:
	movs r0, #1
_08013912:
	pop {r1}
	bx r1
	.align 2, 0

