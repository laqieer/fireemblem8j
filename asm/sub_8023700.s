	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_8023700, "ax", %progbits
@ sub_8023700 @ JP 0x08023700 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023700
	.thumb_func
sub_8023700:
	push {lr}
	ldr r0, _08023724 @ =0x03004DF0
	ldr r1, [r0]
	ldr r0, _08023728 @ =0x0203A954
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetItemAttributes
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	bne _0802372C
	movs r0, #1
	b _0802372E
	.align 2, 0
_08023724: .4byte 0x03004DF0
_08023728: .4byte 0x0203A954
_0802372C:
	movs r0, #2
_0802372E:
	pop {r1}
	bx r1
	.align 2, 0

