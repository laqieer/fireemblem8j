	.syntax unified
	.set PutNumber, 0x08004A90 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.section .text.sub_8004ABC, "ax", %progbits
@ sub_8004ABC @ JP 0x08004ABC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8004ABC
	.thumb_func
sub_8004ABC:
	push {lr}
	cmp r2, #0x64
	bne _08004ACE
	subs r0, #2
	movs r2, #0x27
	movs r3, #0x28
	bl PutTwoSpecialChar
	b _08004AE6
_08004ACE:
	cmp r2, #0
	blt _08004AD6
	cmp r2, #0xff
	bne _08004AE2
_08004AD6:
	subs r0, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _08004AE6
_08004AE2:
	bl PutNumber
_08004AE6:
	pop {r0}
	bx r0
	.align 2, 0

