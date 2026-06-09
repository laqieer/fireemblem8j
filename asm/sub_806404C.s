	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_806404C, "ax", %progbits
@ sub_806404C @ JP 0x0806404C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806404C
	.thumb_func
sub_806404C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08064094 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064098 @ =0x08601050
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	adds r0, r5, #0
	bl GetAnimAnotherSide
	ldr r3, _0806409C @ =0x085FF1C0
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	ldrh r2, [r0, #8]
	ldr r1, _080640A0 @ =0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064094: .4byte 0x0201774C
_08064098: .4byte 0x08601050
_0806409C: .4byte 0x085FF1C0
_080640A0: .4byte 0x0000F3FF

