	.syntax unified
	.set sub_8028E0C, 0x08028E0C + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8024B4C, "ax", %progbits
@ sub_8024B4C @ JP 0x08024B4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024B4C
	.thumb_func
sub_8024B4C:
	push {r4, lr}
	ldr r4, _08024B78 @ =0x0203A954
	adds r1, #0x3c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r4, #0x12]
	bl sub_804F610
	ldr r0, _08024B7C @ =0x03004DF0
	ldr r0, [r0]
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_8028E0C
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024B78: .4byte 0x0203A954
_08024B7C: .4byte 0x03004DF0

