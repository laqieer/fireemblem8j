	.syntax unified
	.set sub_804F718, 0x0804F718 + 1
	.set sub_804F794, 0x0804F794 + 1
	.section .text.sub_804FE54, "ax", %progbits
@ sub_804FE54 @ JP 0x0804FE54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804FE54
	.thumb_func
sub_804FE54:
	push {r4, r5, lr}
	sub sp, #4
	mov ip, r0
	adds r3, r1, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0804FED0
	mov r0, ip
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r0, #1
	lsls r1, r3, #2
	mov r0, ip
	adds r0, #0x34
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0x2c
	ldrsh r4, [r0, r1]
	mov r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r3, r0, #2
	cmp r2, #0
	beq _0804FEB6
	cmp r2, #1
	bne _0804FED0
	mov r0, ip
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	mov r1, ip
	adds r1, #0x66
	ldrh r1, [r1]
	str r3, [sp]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_804F718
	b _0804FED0
_0804FEB6:
	mov r0, ip
	adds r0, #0x64
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	mov r1, ip
	adds r1, #0x66
	ldrh r1, [r1]
	str r3, [sp]
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_804F794
_0804FED0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

