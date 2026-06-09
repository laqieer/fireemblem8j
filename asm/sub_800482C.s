	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003F10, 0x08003F10 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.section .text.sub_800482C, "ax", %progbits
@ sub_800482C @ JP 0x0800482C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800482C
	.thumb_func
sub_800482C:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r7, #0
	bne _0800483E
	bl sub_8003F28
_0800483E:
	cmp r4, #0
	bne _08004844
	movs r4, #1
_08004844:
	ldr r0, _08004870 @ =0x08577F24
	movs r1, #3
	bl sub_8002BCC
	adds r2, r0, #0
	str r5, [r2, #0x2c]
	str r6, [r2, #0x30]
	adds r0, #0x36
	movs r1, #0
	strb r4, [r0]
	subs r0, #2
	strb r7, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #7]
	adds r0, r6, #0
	bl sub_8003F10
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08004870: .4byte 0x08577F24

