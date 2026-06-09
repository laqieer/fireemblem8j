	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_8025854, 0x08025854 + 1
	.section .text.sub_8023E38, "ax", %progbits
@ sub_8023E38 @ JP 0x08023E38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023E38
	.thumb_func
sub_8023E38:
	push {lr}
	ldr r0, _08023E54 @ =0x03004DF0
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08023E50
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x33
	beq _08023E58
_08023E50:
	movs r0, #3
	b _08023E6C
	.align 2, 0
_08023E54: .4byte 0x03004DF0
_08023E58:
	adds r0, r2, #0
	bl sub_8025854
	bl GetSelectTargetCount
	movs r1, #3
	cmp r0, #0
	beq _08023E6A
	movs r1, #1
_08023E6A:
	adds r0, r1, #0
_08023E6C:
	pop {r1}
	bx r1

