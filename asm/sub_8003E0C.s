	.syntax unified
	.set sub_8004470, 0x08004470 + 1
	.section .text.GetStringTextLen, "ax", %progbits
@ GetStringTextLen @ JP 0x08003E0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetStringTextLen
	.thumb_func
GetStringTextLen:
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _08003E28 @ =0x02028E70
	ldr r1, [r0]
	ldrb r1, [r1, #0x16]
	adds r5, r0, #0
	cmp r1, #0
	beq _08003E5C
	adds r0, r2, #0
	bl sub_8004470
	b _08003E64
	.align 2, 0
_08003E28: .4byte 0x02028E70
_08003E2C:
	ldrb r3, [r2]
	adds r2, #1
	cmp r3, #0x1f
	bls _08003E5C
	ldrb r0, [r2]
	adds r2, #1
	ldr r1, [r5]
	ldr r1, [r1, #4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _08003E48 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _08003E4E
	.align 2, 0
_08003E48: .4byte 0xFFFFFF00
_08003E4C:
	ldr r1, [r1]
_08003E4E:
	cmp r1, #0
	beq _08003E5C
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08003E4C
	ldrb r0, [r1, #5]
	adds r4, r4, r0
_08003E5C:
	ldrb r0, [r2]
	cmp r0, #1
	bhi _08003E2C
	adds r0, r4, #0
_08003E64:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

