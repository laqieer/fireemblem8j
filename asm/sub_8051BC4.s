	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8051BC4, "ax", %progbits
@ sub_8051BC4 @ JP 0x08051BC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051BC4
	.thumb_func
sub_8051BC4:
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _08051BE0
	movs r0, #0xb
	strh r0, [r5]
	movs r0, #0xa
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	b _08051C24
_08051BE0:
	adds r0, r6, #0
	movs r1, #0x64
	bl sub_80D6374
	strh r0, [r5]
	ldrh r1, [r5]
	movs r0, #0x64
	adds r4, r1, #0
	muls r4, r0, r4
	subs r4, r6, r4
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #0xa
	bl sub_80D6374
	strh r0, [r5, #2]
	ldrh r1, [r5, #2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	subs r4, r4, r0
	strh r4, [r5, #4]
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	cmn r1, r0
	bne _08051C1A
	movs r0, #0xb
	strh r0, [r5, #2]
_08051C1A:
	ldrh r0, [r5]
	cmp r0, #0
	bne _08051C24
	movs r0, #0xb
	strh r0, [r5]
_08051C24:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

