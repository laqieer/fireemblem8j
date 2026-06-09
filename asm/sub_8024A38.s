	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_8025B10, 0x08025B10 + 1
	.section .text.sub_8024A38, "ax", %progbits
@ sub_8024A38 @ JP 0x08024A38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024A38
	.thumb_func
sub_8024A38:
	push {lr}
	ldr r0, _08024A50 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8025B10
	bl GetSelectTargetCount
	cmp r0, #0
	beq _08024A54
	movs r0, #1
	b _08024A56
	.align 2, 0
_08024A50: .4byte 0x03004DF0
_08024A54:
	movs r0, #3
_08024A56:
	pop {r1}
	bx r1
	.align 2, 0

