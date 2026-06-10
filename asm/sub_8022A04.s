	.syntax unified
	.set sub_8025544, 0x08025544 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8022A04, "ax", %progbits
@ sub_8022A04 @ JP 0x08022A04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022A04
	.thumb_func
sub_8022A04:
	push {lr}
	ldr r0, _08022A1C @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8025544
	ldr r0, _08022A20 @ =0x085C58F8
	bl sub_80507B0
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08022A1C: .4byte 0x03004DF0
_08022A20: .4byte 0x085C58F8

