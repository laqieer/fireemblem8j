	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8025854, 0x08025854 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8023E70, "ax", %progbits
@ sub_8023E70 @ JP 0x08023E70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023E70
	.thumb_func
sub_8023E70:
	push {lr}
	ldr r0, _08023E8C @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl sub_8025854
	ldr r0, _08023E90 @ =0x085C5838
	bl sub_80507B0
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08023E8C: .4byte 0x0203A954
_08023E90: .4byte 0x085C5838

