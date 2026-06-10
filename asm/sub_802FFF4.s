	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_802FFF4, "ax", %progbits
@ sub_802FFF4 @ JP 0x0802FFF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FFF4
	.thumb_func
sub_802FFF4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _08030038
	ldrh r1, [r4, #0x36]
	movs r2, #0x36
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0803000E
	subs r0, r1, #1
	strh r0, [r4, #0x36]
	b _08030038
_0803000E:
	ldr r3, [r4, #0x3c]
	ldrb r0, [r3, #4]
	strh r0, [r4, #0x36]
	ldr r0, [r3]
	ldrb r1, [r3, #6]
	lsls r1, r1, #1
	ldr r2, _08030040 @ =0x02022968
	adds r1, r1, r2
	ldrb r2, [r3, #5]
	bl sub_80D6370
	bl sub_8001EE4
	ldr r0, [r4, #0x3c]
	adds r0, #8
	str r0, [r4, #0x3c]
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08030038
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x3c]
_08030038:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030040: .4byte 0x02022968

