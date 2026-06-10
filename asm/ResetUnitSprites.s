	.syntax unified
	.section .text.ResetUnitSprites, "ax", %progbits
@ ResetUnitSprites @ JP 0x0802662C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetUnitSprites
	.thumb_func
ResetUnitSprites:
	push {r4, r5, r6, lr}
	movs r2, #0xcf
	ldr r5, _08026654 @ =0x0203A010
	ldr r6, _08026658 @ =0x0203A00C
	ldr r4, _0802665C @ =0x02033F3C
	movs r3, #0xff
_08026638:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	subs r2, #1
	cmp r2, #0
	bge _08026638
	movs r0, #0
	str r0, [r5]
	movs r0, #0x3f
	str r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08026654: .4byte 0x0203A010
_08026658: .4byte 0x0203A00C
_0802665C: .4byte 0x02033F3C

