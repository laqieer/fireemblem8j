	.syntax unified
	.section .text.sub_8003E6C, "ax", %progbits
@ sub_8003E6C @ JP 0x08003E6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003E6C
	.thumb_func
sub_8003E6C:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08003E8C @ =0x02028E70
	ldr r1, [r0]
	ldrb r3, [r2]
	adds r2, #1
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08003E90 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _08003E96
	.align 2, 0
_08003E8C: .4byte 0x02028E70
_08003E90: .4byte 0xFFFFFF00
_08003E94:
	ldr r1, [r1]
_08003E96:
	cmp r1, #0
	beq _08003EA4
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08003E94
	ldrb r0, [r1, #5]
	str r0, [r4]
_08003EA4:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1

