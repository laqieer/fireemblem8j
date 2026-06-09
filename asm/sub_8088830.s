	.syntax unified
	.set sub_800D4BC, 0x0800D4BC + 1
	.section .text.sub_8088830, "ax", %progbits
@ sub_8088830 @ JP 0x08088830 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088830
	.thumb_func
sub_8088830:
	push {lr}
	ldr r0, _08088844 @ =0x0202BCEC
	movs r1, #2
	strb r1, [r0, #0x1b]
	ldr r0, _08088848 @ =0x00000BD7
	bl sub_800D4BC
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08088844: .4byte 0x0202BCEC
_08088848: .4byte 0x00000BD7

