	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_8091558, "ax", %progbits
@ sub_8091558 @ JP 0x08091558 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8091558
	.thumb_func
sub_8091558:
	push {lr}
	ldr r0, _08091568 @ =0x08A73E74
	bl Proc_Find
	cmp r0, #0
	bne _0809156C
	movs r0, #0
	b _0809156E
	.align 2, 0
_08091568: .4byte 0x08A73E74
_0809156C:
	movs r0, #1
_0809156E:
	pop {r1}
	bx r1
	.align 2, 0

