	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807282C, 0x0807282C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8055618, "ax", %progbits
@ sub_8055618 @ JP 0x08055618 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055618
	.thumb_func
sub_8055618:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	cmp r0, r1
	blt _08055690
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08055654
	ldr r0, _0805564C @ =0x0885727C
	ldr r1, _08055650 @ =0x02022B88
	movs r2, #8
	bl sub_80D636C
	ldr r0, [r4, #0x5c]
	bl sub_807282C
	b _08055664
	.align 2, 0
_0805564C: .4byte 0x0885727C
_08055650: .4byte 0x02022B88
_08055654:
	ldr r0, _08055698 @ =0x0885727C
	ldr r1, _0805569C @ =0x02022BC8
	movs r2, #8
	bl sub_80D636C
	ldr r0, [r4, #0x5c]
	bl sub_807282C
_08055664:
	bl sub_8001EE4
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _08055690
	ldr r1, [r4, #0x5c]
	ldrh r2, [r1, #0x10]
	movs r0, #0x40
	movs r3, #0
	orrs r0, r2
	strh r0, [r1, #0x10]
	ldrh r2, [r1]
	ldr r0, _080556A0 @ =0x0000FFF7
	ands r0, r2
	strh r0, [r1]
	strh r3, [r1, #6]
	adds r0, r4, #0
	bl sub_8002DE4
_08055690:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055698: .4byte 0x0885727C
_0805569C: .4byte 0x02022BC8
_080556A0: .4byte 0x0000FFF7

