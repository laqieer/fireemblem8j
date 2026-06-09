	.syntax unified
	.set PrepSpriteDraw_BlinkButtonStart, 0x08098EA8 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_8097520, "ax", %progbits
@ sub_8097520 @ JP 0x08097520 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097520
	.thumb_func
sub_8097520:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809753C
	bl PrepSpriteDraw_BlinkButtonStart
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	movs r0, #1
	b _0809753E
_0809753C:
	movs r0, #0
_0809753E:
	pop {r4}
	pop {r1}
	bx r1

