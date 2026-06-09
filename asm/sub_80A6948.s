	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.set sub_80A5884, 0x080A5884 + 1
	.section .text.sub_80A6948, "ax", %progbits
@ sub_80A6948 @ JP 0x080A6948 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6948
	.thumb_func
sub_80A6948:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	adds r1, #0x39
	ldrb r3, [r1]
	lsrs r1, r3, #2
	movs r2, #7
	ands r1, r2
	movs r2, #3
	ands r2, r3
	adds r2, #1
	bl sub_80A5884
	adds r4, #0x3e
	movs r3, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A6984
	movs r1, #0x80
	lsls r1, r1, #1
	str r3, [sp]
	movs r0, #9
	movs r2, #0x80
	movs r3, #0x10
	bl ChangeBgm
	b _080A6994
_080A6984:
	ldrb r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	str r3, [sp]
	adds r1, r2, #0
	movs r3, #0x10
	bl ChangeBgm
_080A6994:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

